package controller.admin.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Product;
import model.bean.User;
import model.dao.ProductDAO;
import utils.AuthUtil;
import utils.FileUtil;
@MultipartConfig
public class PictureAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PictureAdminController() {
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
			ProductDAO product = new ProductDAO();
			int sid = Integer.parseInt(request.getParameter("sid"));
			request.setAttribute("productbyid", product.getProductBySid(sid));
			RequestDispatcher rd = request.getRequestDispatcher("view/admin/product/picture.jsp");
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int sid = Integer.parseInt(request.getParameter("sid"));
			String name = request.getParameter("name");
			
			String fileName = FileUtil.upload("picture", request);
			ProductDAO productDao = new ProductDAO();
			Product product = new Product(sid, name,"", 0, 0, fileName, 0, 0, null);
			if (productDao.addProductImage(sid,fileName) > 0) {

				response.sendRedirect(request.getContextPath() + "/admin-product-picture-add?msg=1&sid=" + sid);
			} else {

				request.setAttribute("productbyid", product);
				RequestDispatcher rd = request.getRequestDispatcher("/view/admin/product/picture.jsp?msg=2");
				rd.forward(request, response);
			}
	}

}
