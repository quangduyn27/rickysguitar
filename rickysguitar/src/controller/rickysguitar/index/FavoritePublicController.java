package controller.rickysguitar.index;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Favorite;
import model.bean.Product;
import model.bean.User;
import model.dao.FavoriteDAO;
import utils.AuthUtil;
import utils.DefineUtil;
import utils.StringUtil;

public class FavoritePublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FavoriteDAO fd;

       
    public FavoritePublicController() {
        super();
		fd = new FavoriteDAO();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(AuthUtil.checkLogin(request, response)== false) {
			response.sendRedirect(request.getContextPath()+"/public-login");
			return;
		}	
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		
		if(request.getParameter("del")!=null&request.getParameter("sid")!=null) {
		int sid = Integer.parseInt(request.getParameter("sid"));
		if (fd.delLike(sid, user.getId()) > 0) {
			System.out.println("xoá thanh cong");
		} 
			
		}
		if(request.getParameter("sid")!=null&request.getParameter("del")==null) {
		int sid = Integer.parseInt(request.getParameter("sid"));
			Favorite fv = new Favorite(0, user.getId(), sid, 1);
			if(fd.existLike(user.getId(),sid)==0) {
				
			if (fd.addLike(fv) > 0) {
				System.out.println("thich thanh cong");
			} }}
		
		int Numberoffavoriteproduct = fd.getNumberFavoriteByUid(user.getId());
		 int NumberOfPages = (int) Math.ceil((float) Numberoffavoriteproduct / DefineUtil.NUMBER_PER_PAGE);
		 int currentpage = 1;
		if (request.getParameter("page") != null) {
			try {
				currentpage = Integer.parseInt(request.getParameter("page"));
				if (currentpage < 1) {
					throw new Exception();
				}
			} catch (Exception e) {
				response.sendRedirect(request.getContextPath() + "/public-favorite?msgErr=URL");
				return;
			}
		}
		 int offset = (currentpage - 1) * DefineUtil.NUMBER_PER_PAGE;

		ArrayList<Product> favoriteProduct = fd.getFavoriteProduct(user.getId(), offset);
		request.setAttribute("listproduct", favoriteProduct);
		request.setAttribute("currentpage", currentpage);
		request.setAttribute("numberOfPages", NumberOfPages);
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/wishlist.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		
		int sid = Integer.parseInt(request.getParameter("aidproduct"));
		if (fd.delLike(sid, user.getId()) > 0) {
			System.out.println("xoá thanh cong");
		} 
		
		int Numberoffavoriteproduct = fd.getNumberFavoriteByUid(user.getId());
		System.out.println(Numberoffavoriteproduct);
		 int NumberOfPages = (int) Math.ceil((float) Numberoffavoriteproduct / DefineUtil.NUMBER_PER_PAGE);
		 int currentpage = 1;
		if (request.getParameter("page") != null) {
			try {
				currentpage = Integer.parseInt(request.getParameter("page"));
				if (currentpage < 1) {
					throw new Exception();
				}
			} catch (Exception e) {
				response.sendRedirect(request.getContextPath() + "/public-favorite?msgErr=URL");
				return;
			}
		}
		 int offset = (currentpage - 1) * DefineUtil.NUMBER_PER_PAGE;

		ArrayList<Product> favoriteProduct = fd.getFavoriteProduct(user.getId(), offset);
		int stt=0;
		for(Product product:favoriteProduct) {
			++stt;
			ArrayList<String> listpicture = StringUtil.getFileName(product.getPicture());
		
		response.getWriter().print(" <tr>\n"
				+ "											<td>"+stt+"</td>\n"
				+ "											<!-- Product image -->\n"
				+ "											<td>\n"
				+ "												<a href=\""+request.getContextPath()+"/public-detail?sid="+ product.getId()+"\">\n"
				+ "													<img style=\"width:90px\" src=\""+request.getContextPath()+"/files/"+listpicture.get(0)+"\" alt=\"\" class=\"img-responsive\"/>\n"
				+ "												</a>\n"
				+ "											</td>\n"
				+ "											<td><a href=\""+request.getContextPath()+"/public-detail?sid="+ product.getId()+"\">"+product.getName()+"</a></td>\n"
				+ "											<td>"+product.getCat().getName()+"</td>\n"
				+ "											<td>"+product.getPrice()+"</td>\n"
				+ "											<td>\n"
				+ "												<div class=\"btn-group btn-group-xs\">\n"
				+ "													<a  class=\"btn btn-primary\"><i class=\"fa fa-money\"></i>  Checkout</a>\n"
				+ "													<button  onclick=\"return getDel("+product.getId()+")\" class=\"btn btn-danger\"><i class=\"fa fa-trash-o\"></i> Delete</button>\n"
				+ " 											</div>\n"
				+ "											</td>\n"
				+ "										</tr> ");
		}
		
//		request.setAttribute("listproduct", favoriteProduct);
		
		//nếu bên ajax dùng reload thì ko cần forward nên ko cần forward
		
		
//		RequestDispatcher rd = request.getRequestDispatcher("/view/public/wishlist.jsp");
//		rd.forward(request, response);
		//String json = "{\"status\":\"deleted\",\"code\":\"200\"}";
		//response.getWriter().print(json);
		
		
	}
}
