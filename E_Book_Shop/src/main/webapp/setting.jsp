<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>

<style>
a {
text-decoration: none;
color:black;
}
a:hover {
text-decoration: none;
}
</style>
<%@include file="all_component/allCss.jsp"%>
</head>
<bodystyle ="background-color:#f7f7f7;"> 
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="all_component/navbar.jsp"%>

<div class="container">
	<c:if test="${not empty userobj}">
	<h3 class="text-center p-2">Hello, ${userobj.name}</h3>
	</c:if>
	
	<div class="row p-5">
		<div class="col-md-4 mt-3">
			<a href="sell_book.jsp">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-book-open fa-3x"></i>
					</div>
					<h4>Sell Old Book</h4>
					</div>
				</div>
			</a>
		</div>
			<div class="col-md-4 mt-3">
			<a href="old_book.jsp">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-book-open fa-3x"></i>
					</div>
					<h4>Old Book</h4>
					</div>
				</div>
			</a>
		</div>
		<div class="col-md-4 mt-3">
			<a href="edit_profile.jsp">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-edit fa-3x"></i>
					</div>
					<h4>Edit Profile</h4>
					</div>
				</div>
			</a>
		</div>

		<div class="col-md-6 mt-3">
			<a href="order.jsp">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-danger">
					<i class="fa-solid fa-box-open fa-3x"></i>
					</div>
					<h4>My Order</h4>
					<p>Track your Order</p>
					</div>
				</div>
			</a>
		</div>
		<div class="col-md-6 mt-3">
			<a href="helpline.jsp">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-user-circle fa-3x"></i>
					</div>
					<h4>Help Center</h4>
					<p>24*7 Service</p>
					</div>
				</div>
			</a>
		</div>
	</div>
</div>
<%@include file="all_component/footer.jsp" %>

</body>
</html>