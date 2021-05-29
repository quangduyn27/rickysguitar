package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Orderdetail;
import utils.ConnectDBLibrary;

public class OrderDetailDao extends AbstractDAO{
	
	public OrderDetailDao() {
		connectdblibrary = new ConnectDBLibrary();
	}
	public int addOrderDetail(Orderdetail orderdetail) {
		String sql = "INSERT INTO orderdetail (idproduct, name, quantity, price, detail, idorder) VALUES (?,?,?,?,?,?)";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, orderdetail.getIdproduct());
			pst.setString(2, orderdetail.getName());
			pst.setInt(3, orderdetail.getQuantity());
			pst.setInt(4, orderdetail.getPrice());
			pst.setString(5, orderdetail.getDetail());
			pst.setInt(6, orderdetail.getIdorder());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}
	
	public ArrayList<Orderdetail> getOrderDetailByOid(int oid) {
		ArrayList<Orderdetail> listod = new ArrayList<Orderdetail>();
		String sql = "SELECT * FROM orderdetail WHERE idorder =? ";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, oid);
			rs = pst.executeQuery();
			while (rs.next()) {
				Orderdetail	 pr = new Orderdetail(rs.getInt("iddetail"), rs.getInt("idproduct"), rs.getString("name"), rs.getInt("quantity"), rs.getInt("price"), rs.getString("detail"),rs.getInt("idorder"));
				listod.add(pr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listod;
	}
	public ArrayList<Integer> getIdproductodd() {
		ArrayList<Integer> listod = new ArrayList<Integer>();
		String sql = "SELECT DISTINCT idproduct FROM orderdetail";
		con = connectdblibrary.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				listod.add(rs.getInt("idproduct"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, st, con);
		}
		return listod;
	}
}
