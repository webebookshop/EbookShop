package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.print.attribute.standard.RequestingUserName;

import com.entity.User;

public class UserDAOImpl implements UserDao {
	
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn=conn;
		
	}

	@Override
	public boolean userRegister(User us) {
		boolean flag=false;
		
		try {
			String sql="insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			
			int status=ps.executeUpdate();
			
			if(status>0) {
				flag=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public User login(String email, String password) {
		User us = null;
		try {
		String sql = "select * from user where email=? and password=?"; 
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
		us=new User();
		us.setId(rs.getInt(1));
		us.setName (rs.getString(2)); 
		us.setEmail (rs.getString(3));
		us.setPhno(rs.getString(4));
		us.setPassword (rs.getString(5));
		us.setAddress(rs.getString(6));
		us.setLandmark (rs.getString(7));
		us.setCity (rs.getString(8));
		us.setState(rs.getString(9));
		us.setPincode (rs.getString(10));
		}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id,  String ps) {
boolean f=false;
try {
	String sql="select * from user where id=? && password=?";
	PreparedStatement pst=conn.prepareStatement(sql);
	pst.setInt(1, id);
	pst.setString(2, ps);
	
	ResultSet rs=pst.executeQuery();
	while(rs.next()) {
		f=true;
	}
} catch (Exception e) {
	e.printStackTrace();
}
		return f;
	}

	@Override
	public boolean updateProfile(User us) {
boolean flag=false;
		
		try {
			String sql="update user set name=?,email=?,phno=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());
			
			int status=ps.executeUpdate();
			
			if(status==1) {
				flag=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean checkUser(String em) {
		boolean flag=true;
		try {
			String sql="select * from user where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			
			ResultSet rSet=ps.executeQuery();
			
			
			if(rSet.next()) {
				flag=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	
	
	
	
	
}