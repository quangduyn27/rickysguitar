package controller.rickysguitar.index;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.bean.rating;
import model.dao.RatingDao;
import utils.AuthUtil;

public class RatingPublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RatingPublicController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if (AuthUtil.checkLogin(request, response) == false) {
			response.sendRedirect(request.getContextPath() + "/public-login");
			return;
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		RatingDao ratingDao = new RatingDao();
		ArrayList<rating> listrating = new ArrayList<rating>();
		
			int idproduct = Integer.parseInt(request.getParameter("aidproduct"));
		System.out.println("id sản phẩm: "+ idproduct);
			float star = Float.parseFloat(request.getParameter("astar"));
		System.out.println("star :"+ star);

		String content = request.getParameter("acontent");
		System.out.println("nội dung: " + content);
		rating rating = new rating(0, idproduct, user.getId(), user.getFullname(), content, star, null);
		System.out.println(rating);
		if (ratingDao.addRating(rating) > 0) {
			System.out.println("add thanh cong");
		}
		listrating = ratingDao.getRatingListBySid(idproduct);
		System.out.println("listrating "+ listrating);
		request.setAttribute("listrating", listrating);
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/rating.jsp");
		rd.forward(request, response);
	}

}
