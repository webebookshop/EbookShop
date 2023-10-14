package com.user.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DAO.UserDao;
import com.DB.DBConnect;
import com.entity.User;



@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
		try {
			
			String name=request.getParameter("fname");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String password=request.getParameter("password");
			String check=request.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			
			User us=new User();		
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session=request.getSession();
			
			if(check!=null) {
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
				
				if(dao.checkUser(email)) {
					boolean flag=dao.userRegister(us);
					
					if(flag) {
						//System.out.println("User registered successfully");
						session.setAttribute("succMsg", "Registered successfully");
						response.sendRedirect("register.jsp");
					}else {
						//System.out.println("Not registered");
						session.setAttribute("failedMsg", "Something wrong on server");
						response.sendRedirect("register.jsp");
					}
				}else {
					session.setAttribute("failedMsg", "User Already Exist.. Try another email id");
					response.sendRedirect("register.jsp");
				}
			}else {
				//System.out.println("Please check agree terms & condition");
				session.setAttribute("failedMsg", "Please check agree terms & condition");
				response.sendRedirect("register.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
