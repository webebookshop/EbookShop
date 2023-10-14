<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.DAO.BookDAOImpl, com.entity.BookDtls, com.DB.DBConnect, java.util.List,com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>

<style>
.back-img {
	background: url("img/book2.png");
	height: 50vh;
	weidth: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
.crd-ho:hover{
background-color:#f7fdff;
}
</style>

<%@include file="all_component/allCss.jsp"%>
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	
	
<%User u=(User)session.getAttribute("userobj");%>

	<div class="container-fluid">
		<div class="row  p-3 m-5">
			
			
			<%
			String ch=request.getParameter("ch");
			BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list=dao2.getBookBySearch(ch);
			for(BookDtls b: list) {
			
			%>


			<div class="col-md-3">
				<div class="card crd-ho mt-2">
				<div class="card-body text-center">
					<img alt="java programming" src="books/<%=b.getPhotoName()%>" style="height:150px;"  class="img-thumbnil"/>
					<p><%=b.getBookName() %></p>
					<p><%=b.getAuthor() %></p>
					<p>Categorie: <%=b.getBookCategory() %></p>
					<div class="row text-center">
					<%if(b.getBookCategory().equals("Old")){ %>
					<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
					<%
					}
					else{ %>
					
					<% if(u==null){%>
					<a href="login.jsp" class="btn btn-danger btn-sm ml-2"> Add Cart</a>
					<% } 
					else {  %>
					<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" 
					class="btn btn-danger btn-sm ml-2">Add Cart</a>
					
					<%} %>

					<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
					
					<% } %>
					
					<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
					</div>
				</div>
				</div>
			</div>
			
			<%
			}
			%>
			
		
		</div>
	</div>

</body>
</html>