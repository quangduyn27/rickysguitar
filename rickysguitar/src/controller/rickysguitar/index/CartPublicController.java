package controller.rickysguitar.index;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Product;
import model.dao.ProductDAO;

public class CartPublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Product> listproduct = new ArrayList<>();

    public CartPublicController() {
        super();
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProductDAO productDao = new ProductDAO();
		boolean check = true; int quantity =1;
		int sid = Integer.parseInt(request.getParameter("aidproduct"));
		
		if(request.getParameter("aquantity")!=null) {
		 quantity = Integer.parseInt(request.getParameter("aquantity"));
		}
		System.out.println(quantity);
		Product product = productDao.getProductBySid(sid);
		if (listproduct.size() == 0) {	
			product.setQuantity(quantity);
			listproduct.add(product);
		} else {
			for (Product product1 : listproduct) {
				if (product1.getId() == product.getId()) {
					product1.setQuantity(quantity + product1.getQuantity());
					System.out.println("soluong trong gio:" + product1.getQuantity());
					check = true;
					break;
				} else {
					check = false;
				}
			}
			if (!check) {
				listproduct.add(product);
			}
		}
		session.setAttribute("listcart", listproduct);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/cart.jsp");
		rd.forward(request, response);
	}
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int quantity = Integer.parseInt(request.getParameter("aquantity"));
		int trangthai = Integer.parseInt(request.getParameter("atrangthai"));
		int idproduct = Integer.parseInt(request.getParameter("aidproduct"));
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		// lấy sản phẩm trong giỏ hàng ở session
		ArrayList<Product>  listcart = (ArrayList<Product>) session.getAttribute("listcart");
		
		
		if(trangthai==0) {
			if(quantity>1) {
				quantity -=1;
				}
			// duyệt mảng sp tìm sp có id cần điều chỉnh số lượng và lưu lại trong session
			for(Product product: listcart) {
				if(product.getId()==idproduct) {
					product.setQuantity(quantity);
				}
			}
		}else {
			if(quantity>0) {
				quantity +=1;
				}
			for(Product product: listcart) {
				if(product.getId()==idproduct) {
					product.setQuantity(quantity);
				}
			}
		}
		request.setAttribute("listcart", session.getAttribute("listcart"));
		request.setAttribute("quantity", quantity);
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/quantity2.jsp");
		rd.forward(request, response);
    	
    }

}
