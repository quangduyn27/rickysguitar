package controller.admin.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.dao.UserDAO;
import utils.AuthUtil;
import utils.DefineUtil;

public class IndexUserAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IndexUserAdminController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}	
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		if (user.getIdRole() != 2&user.getIdRole() != 1) {
			request.setAttribute("error", "<p style='color:red'>Không được quyền vao.</p>");
			RequestDispatcher rd = request.getRequestDispatcher("/admin-index");
			rd.forward(request, response);
			return;
		}
		UserDAO userDao = new UserDAO();
		ArrayList<User> listUser = new ArrayList<User>();
		int numberOfItems = userDao.getNumberOfUser();
		int numberOfPages = (int) Math.ceil((float)numberOfItems/DefineUtil.NUMBER_PER_PAGE);
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}catch (NumberFormatException e) {
		}
		int offset = (currentPage - 1) * DefineUtil.NUMBER_PER_PAGE;
		
		listUser = userDao.getUserPagination(offset);
		if (request.getParameter("timkiem") != null) {
			String search = request.getParameter("timkiem");
			listUser = userDao.getUserSearch(search);
			request.setAttribute("search", search);
		}
		
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("listuser", listUser);
		RequestDispatcher rd = request.getRequestDispatcher("/view/admin/user/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
