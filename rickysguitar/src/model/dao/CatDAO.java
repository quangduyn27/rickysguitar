package model.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.bean.Cat;
import utils.ConnectDBLibrary;
import utils.DefineUtil;

public class CatDAO extends AbstractDAO {

	public CatDAO() {
		connectdblibrary = new ConnectDBLibrary();
	}

	public void CreateMenu(javax.servlet.jsp.JspWriter out,HttpServletRequest request) {
		String sql = "SELECT * FROM category WHERE parent_id = 0 AND status != 0";
		con = connectdblibrary.getConnection();
		int i = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			try {
				out.println("<ul>");
				while (rs.next()) {
					
						System.out.println(i);

						out.println("<li>"); 

						out.println("<a href='"+ request.getContextPath()+ "/public-cat?cid=" + rs.getInt("id") + "'>" + rs.getString("name")
								+ "</a>");

						CreateChildMenu(rs.getInt("id"), out,request);
					
				}
				out.println("</ul>");
			} catch (IOException ex) {

			}
		} catch (SQLException e) {
		}
	}

	public void CreateChildMenu(int parentId, javax.servlet.jsp.JspWriter out, HttpServletRequest request) {
		String sql = "SELECT * FROM category WHERE parent_id = ? AND status !=0";
		con = connectdblibrary.getConnection();
		try {
			List<Cat> listcat = new ArrayList<Cat>();
			try {
				pst = con.prepareStatement(sql);
				pst.setInt(1, parentId);
				rs = pst.executeQuery();
				while (rs.next()) {	
					listcat.add(new Cat(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id")));	
				}
				if (listcat.size() > 0) {
					out.println("<ul>");
					for (Cat cat : listcat) {
						out.println("<li>");
						out.println("<a href='"+request.getContextPath()+"/public-cat?cid=" + cat.getId() + "'>" + cat.getName()
								+ "</a>");
						CreateChildMenu(cat.getId(), out,request);
					}
					out.println("</ul>");
				} else {
					out.println("</li>");
				}
			} catch (IOException ex) {

			}
		} catch (SQLException e) {

		}
	}
	

	public ArrayList<Cat> getCatList() {
		ArrayList<Cat> listcat = new ArrayList<Cat>();
		String sql = "SELECT * FROM category WHERE parent_id = 0 AND status!=0 ORDER BY id ASC";
		con = connectdblibrary.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
					Cat cat = new Cat(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"),
							rs.getInt("status"), rs.getInt("orders"));
					listcat.add(cat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, st, con);
		}
		return listcat;
	}
	public ArrayList<Cat> getCatListHeader() {
		ArrayList<Cat> listcat = new ArrayList<Cat>();
		String sql = "SELECT * FROM category ORDER BY id ASC";
		con = connectdblibrary.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Cat cat = new Cat(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"),
						rs.getInt("status"), rs.getInt("orders"));
				listcat.add(cat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, st, con);
		}
		return listcat;
	}
	
	
	public ArrayList<Cat> getCatLisAdd() {
		ArrayList<Cat> listcat = new ArrayList<Cat>();
		String sql = "SELECT * FROM category";
		con = connectdblibrary.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Cat cat = new Cat(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"),
						rs.getInt("status"), rs.getInt("orders"));
				listcat.add(cat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, st, con);
		}
		return listcat;
	}
	

	public int addcat(Cat cat) {
		String sql = "INSERT INTO category (name,parent_id,status, orders) VALUES (?,?,?,?)";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, cat.getName());
			pst.setInt(2, cat.getParent_id());
			pst.setInt(3, 1);
			pst.setInt(4, 0);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	public Cat getCatByCid(int cid) {
		String sql = "SELECT * FROM category WHERE id = ?";
		con = connectdblibrary.getConnection();
		Cat cat = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cid);
			rs = pst.executeQuery();
			if (rs.next()) {
				cat = new Cat(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"), rs.getInt("status"),
						rs.getInt("orders"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return cat;
	}

	public int editCat(Cat cat) {
		String sql = "UPDATE category SET name = ?,parent_id=?, status = ?  WHERE id= ?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, cat.getName());
			pst.setInt(2, cat.getParent_id());
			pst.setInt(3, 1);
			pst.setInt(4, cat.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;

	}

	public int delcat(int cid) {
		String sql = "DELETE FROM category WHERE id= ?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	public ArrayList<Cat> getCatSearch(String search) {
		ArrayList<Cat> listcat = new ArrayList<Cat>();
		String sql = "SELECT * FROM category WHERE name LIKE ?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, "%" + search + "%");
			rs = pst.executeQuery();
			while (rs.next()) {
				Cat cat = new Cat(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"), rs.getInt("status"),
						rs.getInt("orders"));
				listcat.add(cat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listcat;
	}

	public int activeCat(int cid) {
		String sql = "UPDATE category SET status = 1 WHERE id= ?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}
	
	public int deactiveCat(int cid) {
		String sql = "UPDATE category SET status = 0 WHERE id= ?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	public int getNumberOfCat() {
		String sql = "SELECT COUNT(*) AS count FROM category";
		con = connectdblibrary.getConnection();
		int count = 0;
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return 0;
	}

	public ArrayList<Cat> getCatListPagination(int offset) {
		ArrayList<Cat> listcat = new ArrayList<Cat>();
		String sql = "SELECT * FROM category ORDER BY id DESC LIMIT ?,?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Cat cat = new Cat(rs.getInt("id"), rs.getString("name"), rs.getInt("parent_id"), rs.getInt("status"),
						rs.getInt("orders"));
				listcat.add(cat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, st, con);
		}
		return listcat;
	}

	public int hasOrder(int cid) {
		String sql = "SELECT COUNT(*) AS count FROM category WHERE orders = ?";
		con = connectdblibrary.getConnection();
		int count = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cid);
			rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return 0;
	}

	public int editOrder(int cid, int order) {
		String sql = "UPDATE category SET orders = ? WHERE id= ?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, order);
			pst.setInt(2, cid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	
}
