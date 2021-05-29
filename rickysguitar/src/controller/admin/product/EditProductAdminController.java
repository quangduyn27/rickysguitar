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
public class EditProductAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditProductAdminController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		ProductDAO productDao = new ProductDAO();
		int sid = Integer.parseInt(request.getParameter("sid"));
		CatDAO catDao = new CatDAO();
		
		request.setAttribute("listcat", catDao.getCatList());
		request.setAttribute("product", productDao.getProductBySid(sid));
		RequestDispatcher rd = request.getRequestDispatcher("/view/admin/product/edit.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(AuthUtil.checkLogin(request, response)== false) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		
		ProductDAO songDao = new ProductDAO();
		int sid = Integer.parseInt(request.getParameter("sid"));
		Product oldSong = songDao.getProductBySid(sid);
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		int sale = Integer.parseInt(request.getParameter("sale"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String detail = request.getParameter("detail");
		int idcat = Integer.parseInt(request.getParameter("category"));

		if (name.equals("")|detail.equals("")) {
			request.setAttribute("error", "<p style='color:red'>Vui lòng nhập.</p>");
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product/edit.jsp");
			rd.forward(request, response);
			return;
			} 
		String fileName = FileUtil.upload("picture", request);
		
		if (fileName.equals("")) {
			fileName = oldSong.getPicture();  //neu rong thi lay file cu
		} else {
			if (FileUtil.delFile(oldSong.getPicture(), request)) { //co gia tri thi xoa file cu
				System.out.println();
			}
		}
	
		Cat cat = new Cat(idcat, null,0, 1,0);
		Product product = new Product(sid, name, detail, price,sale, fileName, quantity,0, cat);
		if (songDao.editProduct(product) > 0) {
			response.sendRedirect(request.getContextPath() + "/admin-product?msg=2&?sid="+sid);
		} else {
			
			response.sendRedirect(request.getContextPath() + "/admin-product?msg=4");
		}
	}

}
