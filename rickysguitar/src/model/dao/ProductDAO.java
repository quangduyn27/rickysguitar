package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Cat;
import model.bean.Product;
import utils.ConnectDBLibrary;
import utils.DefineUtil;

public class ProductDAO extends AbstractDAO {
	public ProductDAO() {
		connectdblibrary = new ConnectDBLibrary();
	}

	public ArrayList<Product> getProductList() {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id ORDER BY product.id DESC";
		con = connectdblibrary.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, st, con);
		}
		return listsong;
	}

	public ArrayList<Product> getProductSearchIndexPagination(String search, int cid, int offset) {
		ArrayList<Product> listsong = new ArrayList<Product>();
		con = connectdblibrary.getConnection();
		
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id WHERE product.name LIKE ?";
		if(cid != 0) {
			sql += " AND category.id = ? ";
		}
		sql += " LIMIT ?,?";
		try {
			pst = con.prepareStatement(sql);
			
			pst.setString(1, "%" + search + "%");
			if(cid != 0) {
				pst.setInt(2, cid);
				pst.setInt(3, offset);
				pst.setInt(4, DefineUtil.NUMBER_PER_PAGE);
				}else {
			pst.setInt(2, offset);
			pst.setInt(3, DefineUtil.NUMBER_PER_PAGE);
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;
	}
	public int getNumberOfProductSearchIndex(String search, int cid) {
		con = connectdblibrary.getConnection();
		
		String sql = "SELECT COUNT(*) AS count FROM product INNER JOIN category ON category.id = product.cat_id WHERE product.name LIKE ?";
		if(cid != 0) {
			sql += " AND category.id = ? ";
		}
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, "%" + search + "%");
			if(cid != 0) {
				pst.setInt(2, cid);
			}
			rs = pst.executeQuery();
			if (rs.next()) {
				int count = rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return 0;
	}
	public ArrayList<Product> getProductSearch(String search) {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id WHERE product.name LIKE ?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, "%" + search + "%");
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;
	}

	public int addProduct(Product product) {
		String sql = "INSERT INTO product (name, detail, price,sale, picture, quantity,view, cat_id)	 VALUES (?,?,?,?,?,?,?,?)";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst  = con.prepareStatement(sql);
			pst.setString(1, product.getName());
			pst.setString(2, product.getDetail());
			pst.setInt(3, product.getPrice());
			pst.setInt(4, product.getSale());
			pst.setString(5, product.getPicture());
			pst.setInt(6, product.getQuantity());
			pst.setInt(7, 0);
			pst.setInt(8, product.getCat().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}
	public int addProductImage(int sid, String fileName) {
		String sql = "UPDATE `product` SET `picture`= CONCAT(picture,',', ?) WHERE id = ?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst  = con.prepareStatement(sql);
			pst.setString(1, fileName);
			pst.setInt(2, sid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}
	public int delProductImage(int sid, String fileName) {
		String sql = "UPDATE `product` SET `picture`= ? WHERE id = ?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst  = con.prepareStatement(sql);
			pst.setString(1, fileName);
			pst.setInt(2, sid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	public Product getProductBySid(int sid) {
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id WHERE product.id =? ";
		con = connectdblibrary.getConnection();
		Product pr = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, sid);
			rs = pst.executeQuery();
			if (rs.next()) {
				 pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return pr;
	}

	public int editProduct(Product product) {
		String sql = "UPDATE product SET name=?, detail = ?, price=?,sale =?, picture =?,quantity =?, view= ?, cat_id=? WHERE id =?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst  = con.prepareStatement(sql);
			pst.setString(1, product.getName());
			pst.setString(2, product.getDetail());
			pst.setInt(3, product.getPrice());
			pst.setInt(4, product.getSale());
			pst.setString(5, product.getPicture());
			pst.setInt(6, product.getQuantity());
			pst.setInt(7, 0);
			pst.setInt(8, product.getCat().getId());
			pst.setInt(9, product.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			connectdblibrary.close(pst, con);
		}
		System.out.println("ketqua: "+ result);
		return result;
	}

	public int delProduct(int sid) {
		String sql = "DELETE FROM product WHERE id =?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst  = con.prepareStatement(sql);
			pst.setInt(1, sid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}
	public ArrayList<Product> get8NewProduct() {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id ORDER BY product.id DESC LIMIT 8";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;
	}
	public ArrayList<Product> get3NewProduct() {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id ORDER BY RAND() LIMIT 3";
		con = connectdblibrary.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, st, con);
		}
		return listsong;
	}

	public ArrayList<Product> getProductByCid(int cid) {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM product INNER JOIN  ON category.id = product.cat_id WHERE category.id =? ";
		con = connectdblibrary.getConnection();
		
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cid);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;
	}

	public ArrayList<Product> getRandProduct(int sid, int cid) {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id WHERE product.id !=? AND product.cat_id =? ORDER BY RAND() LIMIT 5";
		con = connectdblibrary.getConnection();
		
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, sid);
			pst.setInt(2, cid);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"),rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;
	}

	public int addView(int sid) {
		String sql = "UPDATE product SET view= view + 1 WHERE id =?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst  = con.prepareStatement(sql);
			pst.setInt(1, sid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	public int getNumberOfProduct() {
		String sql = "SELECT COUNT(*) AS count FROM product";
		con = connectdblibrary.getConnection();
		//int count = 0;
		
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				int count = rs.getInt("count");
				return count;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return 0;
	}

	public ArrayList<Product> getProductPagination(int offset) {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id ORDER BY product.id DESC LIMIT ?,?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;
	}

	public int getNumberOfProduct(int cid) {
		String sql = "SELECT COUNT(*) AS count FROM product WHERE cat_id = ?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cid);
			rs = pst.executeQuery();
			if (rs.next()) {
				int count = rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return 0;
	}

	public ArrayList<Product> getProductPaginationByCid(int cid, int offset) {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id WHERE category.id = ? ORDER BY product.id DESC LIMIT ?,?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.setInt(2, offset);
			pst.setInt(3, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;
	}

	public int delProductByCid(int cid) {
		String sql = "DELETE FROM product WHERE cat_id =?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst  = con.prepareStatement(sql);
			pst.setInt(1, cid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	public ArrayList<Product> getSaleProduct() {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM product INNER JOIN category ON category.id = product.cat_id WHERE product.sale !=0 ORDER BY product.sale DESC LIMIT 12";
		con = connectdblibrary.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"), rs.getInt("sale"), rs.getString("picture"),
						rs.getInt("quantity"),rs.getInt("view"), new Cat(rs.getInt("category.id"), rs.getString("category.name"),rs.getInt("category.status"), rs.getInt("category.status"),rs.getInt("orders")) );
				listsong.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;

	}

	public int getNumberOfSaleProduct() {
		String sql = "SELECT COUNT(*) AS count FROM product WHERE product.sale != 0 ";
		con = connectdblibrary.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				int count = rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return 0;
	}

	

	

	
}
