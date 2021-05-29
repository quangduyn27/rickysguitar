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

public class CartPublicController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CartPublicController2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/shopping-cart.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> listproduct1 = new ArrayList<Product>();
			int delid = Integer.parseInt(request.getParameter("aidproduct"));
			System.out.println("id san pham can xoa: " + delid);
			
			HttpSession session = request.getSession();
			@SuppressWarnings("unchecked")
			ArrayList<Product> listproduct = (ArrayList<Product>) session.getAttribute("listcart");
			
			for(Product product: listproduct) {
				if(product.getId()==delid) {
					continue;
				}
				listproduct1.add(product);
			}
			listproduct = listproduct1;
			System.out.println("so luong sp sau khi xoa: " + listproduct.size());

			session.setAttribute("listcart", listproduct);

		
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/shopping-cart2.jsp");
		rd.forward(request, response);
	}

}
