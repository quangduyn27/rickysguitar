package controller.admin.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Product;
import model.bean.User;
import model.dao.ProductDAO;
import utils.AuthUtil;
import utils.StringUtil;

public class DelPictureProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelPictureProductController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(AuthUtil.checkLogin(request, response)== false) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userLogin");
		if(user.getIdRole()!=2) {
			request.setAttribute("error", "<p style='color:red'>Không được quyền vao.</p>");
			RequestDispatcher rd = request.getRequestDispatcher("/admin-index");
			rd.forward(request, response);
			return;
		}
		ProductDAO productDao = new ProductDAO();
		int sid = Integer.parseInt(request.getParameter("sid"));
		// lấy tên ảnh của sản phẩm
		String fileName = request.getParameter("filename");
		String fileName3= "";
		Product product = productDao.getProductBySid(sid);
		ArrayList<String> listFileName2 = new ArrayList<String>();
		// cắt chuỗi ảnh thành mẳng của sản phẩm cần xoá 
		ArrayList<String> listFileName = StringUtil.getFileName(product.getPicture());
		if (listFileName.size() > 0) {
			// duyệt mảng để tìm ra ànhr cần xoá
    		for (String fileName1: listFileName) {
    			if(!fileName1.equals(fileName)) {
    				listFileName2.add(fileName1);
    			}
    			}	
    				for (String fileName4: listFileName2) {
    					System.out.println(fileName4);
    					//nếu ảnh cuối cùng thì ko cần cộng thêm dấu "," để ngăn cách ảnh, rồi tạo chuỗi ảnh
    			if(fileName4.equals(listFileName2.get(listFileName2.size()-1))) {
    				fileName3 += fileName4;
    			}else {
    			fileName3 += fileName4 + ",";
    			}
		}
		}// update lại chuỗi ảnh vào sản phẩm.
    		if (productDao.delProductImage(sid, fileName3) > 0) {
    			// truyền id sản phẩm qua trang thêm ảnh để tải tải danh sách ảnh của sản phẩm.
				response.sendRedirect(request.getContextPath() + "/admin-product-picture-add?msg=3&sid="+ sid);
				
			} else {

				request.setAttribute("productbyid", product);
				RequestDispatcher rd = request.getRequestDispatcher("/view/admin/product/picture.jsp?msg=2");
				rd.forward(request, response);
			}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
