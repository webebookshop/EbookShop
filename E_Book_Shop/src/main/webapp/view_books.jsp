<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.util.List,com.entity.BookDtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=b.getPhotoName()%>"
					style="height: 150px; width: 100px;"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>

				<%
				if (b.getBookCategory().equals("Old")) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getEmail()%>
				</h5>
				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-undo-alt fa-2x"></i>
						<p>Return Availabel</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>

				</div>

				<div class="text-center p-3">

					<%
					if (b.getBookCategory().equals("Old")) {
					%>
					<a href="index.jsp" class="btn btn-primary btn-sm ml-2"><i
						class="fa-solid fa-cart-plus"></i> Continue Shopping</a>
					<%
					} else {
					%>
					<a href="index.jsp" class="btn btn-primary btn-sm ml-2"><i
						class="fa-solid fa-cart-plus"></i> Add Cart</a>
					<%
					}
					%>

					<a href="" class="btn btn-danger btn-sm ml-1"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
				</div>
			</div>



		</div>
	</div>

</body>
</html>