<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center text-primary p-1">Edit Profile</h4>
					
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session"></c:remove>
						</c:if>
						
						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session"></c:remove>
						</c:if>
						
						<form action="update_profile" method="post">
							<div class="form-group">
							<input type="hidden" value="${userobj.id}" name="id">
								<label for="exampleInputEmail1">Enter full name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"  value="${userobj.name}">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" value="${userobj.email}">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno" value="${userobj.phno}">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" required="required" name="password" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							
							<div class="text-center">
							<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>