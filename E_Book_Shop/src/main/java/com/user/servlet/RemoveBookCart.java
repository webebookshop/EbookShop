package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int bid = Integer.parseInt(req.getParameter("bid"));
	int uid = Integer.parseInt(req.getParameter("uid"));
	int cid = Integer.parseInt(req.getParameter("cid"));
	
	CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
	System.out.println("Book fetched to delete");
	boolean f=dao.deleteBook(bid,uid,cid);
	System.out.println("Cart Book deleted");
	HttpSession session=req.getSession();
	
	if(f) {
		session.setAttribute("succMsg", "Book Removed From Cart");
		resp.sendRedirect("checkout.jsp");
	}
	else {
		session.setAttribute("failedMsg", "Somethig Wrong On Server");
		resp.sendRedirect("checkout.jsp");
	}
	
	
	
}
}
