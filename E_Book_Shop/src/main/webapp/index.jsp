<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.util.List,com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBookShop: Index</title>
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
<body style="background-color: #f7fbfc;">

<%User u=(User)session.getAttribute("userobj");%>
	<%@include file="all_component/navbar.jsp"%>
	
	
	<div class="container-fluid back-img">
		<h2 class="text-center ">
			<i class="fa-solid fa-book"></i> EBook Shop Management System
		</h2>
	</div>
		<!-- ******************************************************************************** -->
	<!-- Start Recent Book -->
	<div class="container" >
		<h3 class="text-center">Recent Book</h3>
		<div class="row">


			<%
			BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list=dao2.getRecentBooks();
			for(BookDtls b: list) {
			
			%>
			
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
				<div class="card-body text-center">
					<img alt="java programming" src="books/<%=b.getPhotoName()%>" style="height:200px; weidth:150px;"  class="img-thumbnil"/>
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
		<div class="text-center mt-3">
		<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
	<!-- **************************************************************End Recent Book -->
<hr>
<!-- Start New Book -->
	<div class="container" >
		<h3 class="text-center">New Book</h3>
		<div class="row">

			
			<%
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			
			List<BookDtls> list1=dao.getNewBook();
			
			for(BookDtls b:list1){
			
			
			%>
				<div class="col-md-3">
				<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="java programming" src="books/<%=b.getPhotoName()%>" style="height:200px; weidth:150px;"  class="img-thumbnil"/>
					<p><%=b.getBookName() %></p>
					<p><%=b.getAuthor() %></p>
					<p>Categories: <%=b.getBookCategory()%></p>
					
					<div class="row text-center">
					
					<% if(u==null){%>
					<a href="login.jsp" class="btn btn-danger btn-sm ml-2"> Add Cart</a>
					<% } 
					else {  %>
					<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" 
					class="btn btn-danger btn-sm ml-2">Add Cart</a>
					
					<%} %>
					
					
					<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
					
					<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
					</div>
				</div>
				</div>
			</div>
			
			<%
			}
			%>
			
			
		</div>
		<div class="text-center mt-3">
		<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
	<!-- ************************************************************************End New Book -->
<hr>
<!-- Start Old Book -->
	<div class="container" >
		<h3 class="text-center">Old Book</h3>
		<div class="row">
		
		<%
			BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConn());
			
			List<BookDtls> list3=dao3.getOldBooks();
			
			for(BookDtls b:list3){
			
			
			%>
				<div class="col-md-3">
				<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="java programming" src="books/<%=b.getPhotoName()%>" style="height:200px; weidth:150px;"  class="img-thumbnil"/>
					<p><%=b.getBookName() %></p>
					<p><%=b.getAuthor() %></p>
					<p>Categories: <%=b.getBookCategory()%></p>
					<div class="row text-center">
					
					<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
					<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
					</div>
				</div>
				</div>
			</div>
			
			<%
			}
			%>
			
			
			
		</div>
		<div class="text-center mt-3">
		<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
	<!-- ******************************************************************End Old Book -->
<%@include file="all_component/footer.jsp" %>
</body>
</html>