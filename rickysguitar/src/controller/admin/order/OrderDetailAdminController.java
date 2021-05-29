package controller.admin.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Orderdetail;
import model.bean.User;
import model.dao.OrderDetailDao;
import model.dao.OrdersDao;
import utils.AuthUtil;

public class OrderDetailAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderDetailAdminController() {
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
		int oid = Integer.parseInt(request.getParameter("oid"));
		OrderDetailDao od = new OrderDetailDao();
		OrdersDao odDao = new OrdersDao();
		ArrayList<Orderdetail> listod = od.getOrderDetailByOid(oid);
		
		request.setAttribute("order", odDao.getOrderByOid(oid));
		request.setAttribute("listod", listod);
		RequestDispatcher rd = request.getRequestDispatcher("/view/admin/order/orderdetail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
