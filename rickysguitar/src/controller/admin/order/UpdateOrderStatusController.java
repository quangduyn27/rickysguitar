package controller.admin.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.OrdersDao;

public class UpdateOrderStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateOrderStatusController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		 int oid = Integer.parseInt(request.getParameter("aidorder"));
		 int status = Integer.parseInt(request.getParameter("aorderstatus"));
		 System.out.println(oid + "va" + status);
		 
		OrdersDao od = new OrdersDao();
		
		if(od.UpdateStatus(oid,status)>0) {
			request.setAttribute("order", od.getOrderByOid(oid));
			RequestDispatcher rd = request.getRequestDispatcher("/view/admin/order/orderstatus.jsp");
			rd.forward(request, response);	
		}
	}

}
