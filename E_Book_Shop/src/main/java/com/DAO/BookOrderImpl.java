package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Order;

public class BookOrderImpl implements BookOrderDAO {
	private Connection conn;

	public BookOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getOrderNo() {
		int i = 0;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean saveOrder(List<Book_Order> blist) {
		boolean f = false;
		try {
			String sql = "insert into book_order(order_id, user_name, email, address, phone, book_name, author, price, payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false); // Start a transaction
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Book_Order b : blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch(); // Add the statement to the batch
			}

			int[] count = ps.executeBatch();
			conn.commit(); // Commit the transaction
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Book_Order> getBook(String email) {

		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order order = null;

		try {
			String sql = "select * from book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				order = new Book_Order();
				order.setId(rs.getInt(1));
				order.setOrderId(rs.getString(2));
				order.setUserName(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setFulladd(rs.getString(5));
				order.setPhno(rs.getString(6));
				order.setBookName(rs.getString(7));
				order.setAuthor(rs.getString(8));
				order.setPrice(rs.getString(9));
				order.setPaymentType(rs.getString(10));
				list.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Book_Order> getAllOrders() {

		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order order = null;

		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				order = new Book_Order();
				order.setId(rs.getInt(1));
				order.setOrderId(rs.getString(2));
				order.setUserName(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setFulladd(rs.getString(5));
				order.setPhno(rs.getString(6));
				order.setBookName(rs.getString(7));
				order.setAuthor(rs.getString(8));
				order.setPrice(rs.getString(9));
				order.setPaymentType(rs.getString(10));
				list.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
}
