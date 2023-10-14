<%@page import="com.DAO.BookOrderImpl,com.DB.DBConnect,java.util.List,com.entity.Book_Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="allCss.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
</head>
<body style="background-color: #f0f1f2">

	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
<c:redirect url="../login.jsp"></c:redirect>
</c:if>
	<h3 class="text-center">Hello Admin</h3>
	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col"> Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone Number</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment</th>
			</tr>
		</thead>
		<tbody>
		
		<%
		BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
		List<Book_Order> list=dao.getAllOrders();
		
		for(Book_Order b:list){
		
		%>
		
			<tr>
				<th scope="row"><%=b.getOrderId() %></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getEmail() %></td>
					<td><%=b.getFulladd() %></td>
					<td><%=b.getPhno() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				
				
				
			</tr>
		<% } %>
			
		</tbody>
	</table>
</body>
</html>