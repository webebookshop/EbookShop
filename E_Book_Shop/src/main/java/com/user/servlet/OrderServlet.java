package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Book_Order;
import com.entity.Cart;
@WebServlet("/order")
public class OrderServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	    	
	    	HttpSession session=req.getSession();
	        int id = Integer.parseInt(req.getParameter("id"));
	        String name = req.getParameter("username");
	        String email = req.getParameter("email");
	        String phno = req.getParameter("phno");
	        String address = req.getParameter("address");
	        String landmark = req.getParameter("landmark");
	        String cityState = req.getParameter("city");
	        String pincode = req.getParameter("pin");
	        String paymentType = req.getParameter("payment");

	        String fullAddress = address + " " + landmark + " " + cityState + " " + pincode;
	        CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
	        List<Cart> blist = dao.getBookByUser(id);
	        
	        if(blist.isEmpty()) {
	        	session.setAttribute("failedMsg","Add Items to the cart");
	        	resp.sendRedirect("checkout.jsp");
	        }else {
	        	BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
		        int i = dao2.getOrderNo();
		        ArrayList<Book_Order> orderlist = new ArrayList<Book_Order>();

		        for (Cart c : blist) {
		        	 i++;
		            Book_Order o = new Book_Order(); 
		            o.setOrderId("BOOK-CRD-80" + i);
		            o.setUserName(name);
		            o.setEmail(email);
		            o.setPhno(phno);
		            o.setFulladd(fullAddress);
		            o.setBookName(c.getBookName());
		            o.setAuthor(c.getAuthor());
		            o.setPrice(c.getPrice() + "");
		            o.setPaymentType(paymentType);
		            orderlist.add(o);
		           
		        }

		        if ("noSelect".equals(paymentType)) { // Check if paymentType is not equal to "noSelect"
		           session.setAttribute("failedMsg", "Choose Payment Method");
		        	resp.sendRedirect("checkout.jsp");
		        } else {
		            boolean f = dao2.saveOrder(orderlist);

		            if (f) {
		            	resp.sendRedirect("order_success.jsp");
		                System.out.println("Order success");
		            } else {
		            	session.setAttribute("failedMsg", "Order failed");
			        	resp.sendRedirect("checkout.jsp");
		                System.out.println("Order failed");
		            }
		        }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
