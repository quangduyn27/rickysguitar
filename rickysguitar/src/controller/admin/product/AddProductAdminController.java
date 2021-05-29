package controller.admin.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Cat;
import model.bean.Product;
import model.bean.User;
import model.dao.CatDAO;
import model.dao.ProductDAO;
import utils.AuthUtil;
import utils.FileUtil;

@MultipartConfig
public class AddProductAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddProductAdminController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(AuthUtil.checkLogin(request, response)== false) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		if(user.getIdRole()!=2) {
			request.setAttribute("error", "<p style='color:red'>Không được quyền vao.</p>");
			RequestDispatcher rd = request.getRequestDispatcher("/admin-index");
			rd.forward(request, response);
			return;
		}
		CatDAO catDao = new CatDAO();
		request.setAttribute("listcat", catDao.getCatLisAdd());
		RequestDispatcher rd = request.getRequestDispatcher("/view/admin/product/add.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(AuthUtil.checkLogin(request, response)== false) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		ProductDAO songDao = new ProductDAO();
		CatDAO catDao = new CatDAO();

		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		int sale = Integer.parseInt(request.getParameter("sale"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String detail = request.getParameter("khungsoanthao");
		int idcat = Integer.parseInt(request.getParameter("category"));
		String fileName = FileUtil.upload("picture", request);
		
		Cat cat = new Cat(idcat, null,0,1,0);
		Product product = new Product(0, name, detail, price, sale, fileName, quantity,0, cat);

		if (songDao.addProduct(product) > 0) {

			response.sendRedirect(request.getContextPath() + "/admin-product?msg=1");
		} else {

			request.setAttribute("listcat", catDao.getCatList());

			request.setAttribute("product", product);
			RequestDispatcher rd = request.getRequestDispatcher("/view/admin/product/add.jsp?msg=2");
			rd.forward(request, response);
		}
	}

}
