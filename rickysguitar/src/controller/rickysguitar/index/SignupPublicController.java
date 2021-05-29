package controller.rickysguitar.index;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.dao.UserDAO;
import utils.StringUtil;

public class SignupPublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignupPublicController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/signup.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO ud = new UserDAO();
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String email = request.getParameter("email");
		
		String birthday = day +"-"+  month+"-"+ year;
		String fullname = lastname + " " + firstname;
		
		if(ud.hasUser(username)>0) {
			request.setAttribute("error", "<p style='color:red'>Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác.</p>");
			RequestDispatcher rd = request.getRequestDispatcher("/view/public/signup.jsp");
			rd.forward(request, response);
			return;
		}
		password = StringUtil.md5(password);
		User user = new User(0, username, password, fullname, birthday, email, 0);
		
		if(ud.addUser(user)>0) {
			request.setAttribute("success", "<p style='color:green'>Đăng ký thành công!</p>");
			RequestDispatcher rd = request.getRequestDispatcher("/view/public/signup.jsp");
			rd.forward(request, response);
			return;
		}
	}

}
