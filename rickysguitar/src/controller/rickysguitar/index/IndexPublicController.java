
package controller.rickysguitar.index;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Product;
import model.dao.OrderDetailDao;
import model.dao.ProductDAO;
import utils.DefineUtil;

public class IndexPublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IndexPublicController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		ProductDAO productDao = new ProductDAO();
		ArrayList<Product> listproduct = new ArrayList<Product>();
		ArrayList<Product> listproduct3 = productDao.get3NewProduct();

		int numberOfProducts, offset, numberOfPages = 0, currentpage = 0, cid = 0;
		String search = "";

		if (request.getParameter("timkiem") != null) {
			search = request.getParameter("timkiem");
			if (request.getParameter("category") != null) {
				cid = Integer.parseInt(request.getParameter("category"));
			}
			System.out.println(" noi dung tim kiem: " + search);
			System.out.println(" the loai: " + cid);
			numberOfProducts = productDao.getNumberOfProductSearchIndex(search, cid);
			numberOfPages = (int) Math.ceil((float) numberOfProducts / DefineUtil.NUMBER_PER_PAGE);
			currentpage = 1;
			if (request.getParameter("page") != null) {
				try {
					currentpage = Integer.parseInt(request.getParameter("page"));
					if (currentpage < 1) {
						throw new Exception();
					}
				} catch (Exception e) {
					response.sendRedirect(request.getContextPath() + "/public-index?msgErr=URL");
					return;
				}
			}
			offset = (currentpage - 1) * DefineUtil.NUMBER_PER_PAGE;

			listproduct = productDao.getProductSearchIndexPagination(search, cid, offset);
			request.setAttribute("search", search);
			request.setAttribute("category", cid);

		} else {

			numberOfProducts = productDao.getNumberOfProduct();
			numberOfPages = (int) Math.ceil((float) numberOfProducts / DefineUtil.NUMBER_PER_PAGE);

			currentpage = 1;
			if (request.getParameter("page") != null) {
				try {
					currentpage = Integer.parseInt(request.getParameter("page"));
					if (currentpage < 1) {
						throw new Exception();
					}
				} catch (Exception e) {
					response.sendRedirect(request.getContextPath() + "/public-index?msgErr=URL");
					return;
				}
			}
			offset = (currentpage - 1) * DefineUtil.NUMBER_PER_PAGE;
			listproduct = productDao.getProductPagination(offset);

			OrderDetailDao odd = new OrderDetailDao();
			ProductDAO prDao = new ProductDAO();
			
			// lấy id sản phầm hay mua trong orderdetail đẫ đặt
			ArrayList<Integer> listid = odd.getIdproductodd();
			ArrayList<Product> listrecommend = new ArrayList<Product>();
			
			// lấy sp dựa trên id đã lấy đc
			for (Integer Integer : listid) {
				listrecommend.add(prDao.getProductBySid(Integer));
			}

			request.setAttribute("listrecommend", listrecommend);
			request.setAttribute("listproductsale", productDao.getSaleProduct());

		}
		request.setAttribute("listproduct3", listproduct3);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentpage", currentpage);
		request.setAttribute("listproduct", listproduct);
		RequestDispatcher rd = request.getRequestDispatcher("/view/public/index.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
