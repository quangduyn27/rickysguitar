package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Orders;
import utils.ConnectDBLibrary;
import utils.DefineUtil;

public class OrdersDao extends AbstractDAO{

	public OrdersDao() {
		connectdblibrary = new ConnectDBLibrary();
	}
	public int addOrder(Orders order) {
		String sql = "INSERT INTO orders ( name, email, address, paymentmethod, phone, status) VALUES (?,?,?,?,?,?)";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, order.getName());
			pst.setString(2, order.getEmail());
			pst.setString(3, order.getAddress());
			pst.setString(4, order.getPaymentmethod());
			pst.setString(5, order.getPhone());
			pst.setInt(6, order.getStatus());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}
	public Orders getnewestorder() {
		String sql = "SELECT * FROM `orders` ORDER BY idorder DESC LIMIT 1";
		Orders od = null;
		con = connectdblibrary.getConnection();
		try {
			st = con.createStatement();
			rs= st.executeQuery(sql);
			if(rs.next()) {
				 od = new Orders(rs.getInt("idorder"), rs.getString("name"), rs.getString("email"), rs.getString("address"), rs.getString("paymentmethod"), rs.getString("phone"), rs.getTimestamp("date"), rs.getInt("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return od;
	}
	
	public Orders getOrderByOid(int oid) {
		String sql = "SELECT * FROM `orders` WHERE idorder = ?";
		Orders od = null;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, oid);
			rs= pst.executeQuery();
			if(rs.next()) {
				od = new Orders(rs.getInt("idorder"), rs.getString("name"), rs.getString("email"), rs.getString("address"), rs.getString("paymentmethod"), rs.getString("phone"), rs.getTimestamp("date"), rs.getInt("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return od;
	}
	
	public int getNumberOfOrder() {
		String sql = "SELECT COUNT(*) AS count FROM orders";
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
	
	public ArrayList<Orders> getOrderPagination(int offset) {
		ArrayList<Orders> listsong = new ArrayList<Orders>();
		String sql = "SELECT * FROM orders ORDER BY idorder DESC LIMIT ?,?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Orders od = new Orders(rs.getInt("idorder"), rs.getString("name"), rs.getString("email"), rs.getString("address"), rs.getString("paymentmethod"), rs.getString("phone"), rs.getTimestamp("date"), rs.getInt("status"));
				listsong.add(od);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;
	}

	public ArrayList<Orders> getOrdersSearch(String search) {
		ArrayList<Orders> listsong = new ArrayList<Orders>();
		String sql = "SELECT * FROM orders WHERE name LIKE ?";
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, "%" + search + "%");
			rs = pst.executeQuery();
			while (rs.next()) {
				Orders od = new Orders(rs.getInt("idorder"), rs.getString("name"), rs.getString("email"), rs.getString("address"), rs.getString("paymentmethod"), rs.getString("phone"), rs.getTimestamp("date"), rs.getInt("status"));
				listsong.add(od);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(rs, pst, con);
		}
		return listsong;
	}
	public int UpdateStatus(int oid, int status) {
		String sql = "UPDATE orders SET status = ? WHERE idorder = ?";
		int result = 0;
		con = connectdblibrary.getConnection();
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, status);
			pst.setInt(2, oid);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectdblibrary.close(pst, con);
		}
		return result;
	}
	
}
