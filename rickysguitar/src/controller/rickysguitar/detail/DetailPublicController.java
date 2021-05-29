package controller.rickysguitar.detail;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Product;
import model.bean.rating;
import model.dao.ProductDAO;
import model.dao.RatingDao;

public class DetailPublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailPublicController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDao = new ProductDAO();
		RatingDao ratingDao = new RatingDao();
		int sid = Integer.parseInt(request.getParameter("sid"));
		if(request.getParameter("favorid")!=null) {
		int favorid = Integer.parseInt(request.getParameter("favorid"));
		request.setAttribute("favorid", favorid);
		}
		Product productbysid = productDao.getProductBySid(sid);
		if (productDao.addView(sid) > 0) {
		}

		int cid = productbysid.getCat().getId();
		ArrayList<Product> listrandproduct = productDao.getRandProduct(sid, cid);
		
		ArrayList<rating> listrating = ratingDao.getRatingListBySid(sid);
		float averagerating = 0.0f;
		 for(rating rating: listrating) {
			averagerating += rating.getRating();
		}
		averagerating = averagerating/listrating.size();
		request.setAttribute("listreview", listrating.size());
		request.setAttribute("productratingaverage", averagerating);
		
		request.setAttribute("listrating", ratingDao.getRatingListBySid(sid));
		request.setAttribute("productbysid", productbysid);
		request.setAttribute("listrandproduct", listrandproduct);

		RequestDispatcher rd = request.getRequestDispatcher("/view/public/detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int quantity = Integer.parseInt(request.getParameter("aquantity"));
		int trangthai = Integer.parseInt(request.getParameter("atrangthai"));
		
		if(trangthai==0) {
			if(quantity>1) {
			quantity -=1;
			}
		}else {
			if(quantity>0) {
				quantity +=1;
			}
		}
		request.setAttribute("quantity", quantity);
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/quantity.jsp");
		rd.forward(request, response);
	}

}
