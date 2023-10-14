<%@page import="com.entity.Book_Order"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Book</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

	<div class="container p-2">
	
	<h3 class="text-center text-primary ">Your Order</h3>
		<table class="table table-striped mt-3">
			<thead>
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
					
				</tr>
			</thead>
			<tbody>
			<%
			User u=(User)session.getAttribute("userobj");
			BookOrderImpl dao=new BookOrderImpl(DBConnect.getConn());
			List<Book_Order> list=dao.getBook(u.getEmail());
			
			for(Book_Order b:list){
			%>
				<tr>
					<th scope="row"><%=b.getId() %></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
					
				</tr>
				<% } %>
			
			</tbody>
		</table>
	</div>


<%@include file="all_component/footer.jsp" %>
</body>
</html>