package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Cat;
import model.bean.Favorite;
import model.bean.Product;
import utils.ConnectDBLibrary;
import utils.DefineUtil;

public class FavoriteDAO extends AbstractDAO{
	public FavoriteDAO() {
		connectdblibrary = new ConnectDBLibrary();
	}

	public int addLike(Favorite fv) {
		String sql = "INSERT INTO favorites (iduser, idproduct, trangthai) VALUES(?,?,?)";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst  = con.prepareStatement(sql);
			pst.setInt(1, fv.getIduser());
			pst.setInt(2, fv.getIdprodcut());
			pst.setInt(3, 1);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	public int delLike(int sid,int uid) {
		String sql = "DELETE FROM favorites WHERE idproduct = ? AND iduser = ?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst  = con.prepareStatement(sql);
			pst.setInt(1, sid);
			pst.setInt(2, uid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	public ArrayList<Product> getFavoriteProduct(int iduser, int offset) {
		ArrayList<Product> listsong = new ArrayList<Product>();
		String sql = "SELECT * FROM favorites INNER JOIN product ON favorites.idproduct = product.id "
				+ "INNER JOIN category ON category.id = product.cat_id "
				+ "WHERE iduser = ? LIMIT ?,?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, iduser);
			pst.setInt(2, offset);
			pst.setInt(3, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product(rs.getInt("product.id"), rs.getString("product.name"),
						rs.getString("detail"),rs.getInt("price"),rs.getInt("sale"), rs.getString("picture"),
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
	
	public ArrayList<Favorite> getFavoriteByUid(int iduser) {
		ArrayList<Favorite> listfv = new ArrayList<Favorite>();
		String sql = "SELECT * FROM favorites WHERE iduser = ?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, iduser);
			rs = pst.executeQuery();
			while (rs.next()) {
				Favorite fv = new Favorite(rs.getInt("idfavorite"), rs.getInt("iduser"), rs.getInt("idproduct"), rs.getInt("trangthai"));
				listfv.add(fv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listfv;
	}
	
	public int getNumberFavoriteByUid(int iduser) {
		String sql = "SELECT COUNT(*) AS count FROM favorites WHERE iduser = ?";
		con = connectdblibrary.getConnection();
		int count = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, iduser);
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

	public int existLike(int iduser, int sid) {
		String sql = "SELECT COUNT(*) AS count FROM favorites WHERE iduser = ? AND idproduct =?";
		con = connectdblibrary.getConnection();
		int count = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, iduser);
			pst.setInt(2, sid);
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

	
}
