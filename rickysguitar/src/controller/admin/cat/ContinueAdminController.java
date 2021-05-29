package controller.admin.cat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Cat;
import model.dao.CatDAO;

public class ContinueAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContinueAdminController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int cid = Integer.parseInt(request.getParameter("cid"));
		int order = Integer.parseInt(request.getParameter("order"));
		CatDAO catDao = new CatDAO();

		Cat cat1 = new Cat(cid, "",0, 0, order);
		ArrayList<Cat> listcat = catDao.getCatList();
		for (Cat cat2 : listcat) {
			if (cat2.getOrders() == cat1.getOrders()) {
				System.out.println(cat1.getOrders());
				cat2.setOrders(0);
				if (catDao.editOrder(cat1.getId(), cat1.getOrders()) > 0
						&& catDao.editOrder(cat2.getId(), cat2.getOrders()) > 0) {
					response.sendRedirect(request.getContextPath() + "/admin-cat?msg=6");
					return;
				}
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
