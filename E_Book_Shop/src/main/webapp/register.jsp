<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<%@page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Register</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<h4 class="text-center">Registration Page</h4>
					
					 <c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg }</p>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty failedMsg }">
					<p class="text-center text-danger">${failedMsg }</p>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter full name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname" placeholder="Enter name">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" placeholder="Enter email">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno" placeholder="Enter phone number">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" required="required" name="password" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & condition</label>
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="all_component/footer.jsp" %>

</body>
</html>