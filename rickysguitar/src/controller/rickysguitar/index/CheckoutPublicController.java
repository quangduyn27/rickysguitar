package controller.rickysguitar.index;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Orderdetail;
import model.bean.Orders;
import model.bean.Product;
import model.dao.OrderDetailDao;
import model.dao.OrdersDao;

public class CheckoutPublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckoutPublicController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/checkout.jsp");
		rd.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		OrdersDao orderDao = new OrdersDao();
		OrderDetailDao oddDao = new OrderDetailDao();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String telephone = request.getParameter("telephone");
		String address = request.getParameter("address");
		String paymentmethod = request.getParameter("paymentmethod");
		int status = 1;
		//tạo ra 1 đơn hàng và them vào 
		Orders order = new Orders(0, name, email, address, paymentmethod, telephone, null,status);
		if(orderDao.addOrder(order)>0) {
			System.out.println(" Thêm đơn hàng thành công ");
		}
		// lấy đơn hàng vừa tạo
		Orders order2 = orderDao.getnewestorder();
		
		// lấy hàng từ trong giỏ và thêm vào database
		if(session.getAttribute("listcart")!=null) {
			@SuppressWarnings("unchecked")
			ArrayList<Product> listcart = (ArrayList<Product>)session.getAttribute("listcart");
			if(listcart.size()>0) {
				for(Product product: listcart) {
					Orderdetail odd = new Orderdetail(0, product.getId(), product.getName(), product.getQuantity(), product.getPrice(), product.getDetail(), order2.getIdorder());
					oddDao.addOrderDetail(odd);
				}
				System.out.println("them chi tiet thanh cong");
			}
		}
		session.invalidate();
		request.setAttribute("success", "Đặt hàng thành công. Cảm ơn bạn.");
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/checkout.jsp");
		rd.forward(request, response);
		
	}

}
