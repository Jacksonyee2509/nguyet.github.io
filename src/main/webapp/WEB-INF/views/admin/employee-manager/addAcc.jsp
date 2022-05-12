<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/tablib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<base href="${pageContext.servletContext.contextPath }/">
<title>Create Employee Account</title>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<style>
*[id$=errors] {
	color: red;
	font-style: italic;
}

body {
	background: rgb(99, 39, 120)
}

.form-control:focus {
	box-shadow: none;
	border-color: #BA68C8
}

.profile-button {
	background: rgb(99, 39, 120);
	box-shadow: none;
	border: none
}

.profile-button:hover {
	background: #682773
}

.profile-button:focus {
	background: #682773;
	box-shadow: none
}

.profile-button:active {
	background: #682773;
	box-shadow: none
}

.back:hover {
	color: #682773;
	cursor: pointer
}

.labels {
	font-size: 11px
}

.add-experience:hover {
	background: #BA68C8;
	color: #fff;
	cursor: pointer;
	border: solid 1px #BA68C8
}
</style>
<script type='text/javascript' src=''></script>
<script type='text/javascript'
	src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>
<script type='text/javascript'></script>
</head>
<form:form action="admin/addAcc.htm" modelAttribute="taikhoan">
	<body oncontextmenu='return false' class='snippet-body'>
		<div class="container rounded bg-white mt-5 mb-5">
			<c:if test="${ message != null }">  
		          <div class="alert alert-primary" role="alert"> ${ message }</div>
			</c:if> 
			<div class="row">
				<div class="col-md-3 border-right">
					<div
						class="d-flex flex-column align-items-center text-center p-3 py-5">
						<img class="rounded-circle mt-5" width="150px"
							src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
					</div>
				</div>
				<div class="col-md-5 border-right">
					<div class="p-3 py-5">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<h4 class="text-right">Create Employee Account</h4>
						</div>
						<div class="row mt-3">
						<form:hidden path="nhanvien.MANV"/>
						<div class="col-md-12">
								<label class="labels">Username</label>
								<form:input path="TK" type="text"
									class="form-control" placeholder="Username" required="required"/>
									<form:errors path="TK"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Password</label>
								<form:input path="MK" class="form-control" type="password" placeholder="Password" required="required" />
									<form:errors path="MK"/>
							</div>
							
						</div>
						<div class="mt-5 text-center">
							<button class="btn btn-primary profile-button">Create Account</button>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="p-3 py-5">
					</div>
				</div>
			</div>
		</div>
	</body>
</form:form>
</html>