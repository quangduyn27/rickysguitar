package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.rating;
import utils.ConnectDBLibrary;

public class RatingDao extends AbstractDAO{

	public RatingDao() {
		connectdblibrary = new ConnectDBLibrary();
	}
	
	public int addRating(rating rating) {
		String sql = "INSERT INTO rating (idproduct, iduser ,fullname ,content, rating) VALUES (?,?,?,?,?)";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, rating.getIdproduct());
			pst.setInt(2, rating.getIduser());
			pst.setString(3, rating.getFullname());
			pst.setString(4, rating.getContent());
			pst.setDouble(5, rating.getRating());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}

	public ArrayList<rating> getRatingListBySid(int idproduct) {
			ArrayList<rating> listrating = new ArrayList<rating>();
			String sql = "SELECT * FROM rating WHERE idproduct = ? ORDER BY datepost DESC ";
			con = connectdblibrary.getConnection();
			try {
				pst = con.prepareStatement(sql);
				pst.setInt(1, idproduct);
				rs = pst.executeQuery();
				while (rs.next()) {
						rating rating = new rating(rs.getInt("idrating"), rs.getInt("idproduct"), rs.getInt("iduser"), rs.getString("fullname"), rs.getString("content"), rs.getFloat("rating"), rs.getTimestamp("datepost"));
						listrating.add(rating);
					}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				connectdblibrary.close(rs, st, con);
			}
			return listrating;
		
	}
	
}
