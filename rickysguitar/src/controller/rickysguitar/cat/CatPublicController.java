package controller.rickysguitar.cat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Product;
import model.dao.CatDAO;
import model.dao.ProductDAO;
import utils.DefineUtil;

public class CatPublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CatPublicController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		ArrayList<Product> listproductbycid = new ArrayList<Product>();
		CatDAO catDao = new CatDAO();
		ProductDAO productDao = new ProductDAO();
		int numberOfProducts = productDao.getNumberOfProduct(cid);
		int numberOfPages = (int) Math.ceil((float) numberOfProducts / DefineUtil.NUMBER_PER_PAGE);
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
//			response.sendRedirect(request.getContextPath()+"/view/public/404.jsp");
//			return;
		}
		if (currentPage > numberOfPages || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * DefineUtil.NUMBER_PER_PAGE;
		 listproductbycid = productDao.getProductPaginationByCid(cid, offset);
		System.out.println("page" + currentPage);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("listproductbycid", listproductbycid);
		request.setAttribute("cat", catDao.getCatByCid(cid));
		request.setAttribute("listproduct3", productDao.get3NewProduct());
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/cat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
