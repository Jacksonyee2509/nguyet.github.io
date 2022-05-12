<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/tablib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<base href="${pageContext.servletContext.contextPath }/">
<title>Update Employee Info</title>
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
<form:form action="admin/editEmpl.htm" modelAttribute="nhanvien">
	<body oncontextmenu='return false' class='snippet-body'>
		<div class="container rounded bg-white mt-5 mb-5">
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
							<h4 class="text-right">Profile Settings</h4>
						</div>
						<form:hidden path="MANV"/>
						<div class="row mt-3">
						<div class="col-md-12">
								<label class="labels">Name</label>
								<form:input path="HOTEN" type="text"
									class="form-control" placeholder="Họ và tên" required = "required"/>
									<form:errors path="HOTEN"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Phone Number</label>
								<form:input path="SDT" class="form-control" type="tel" pattern="[0]{1}[0-9]{9}" placeholder="Số điện thoại" value="" />
									<form:errors path="SDT"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Address</label>
								<form:input path="DIACHI" type="text"
									class="form-control" placeholder="Address" />
									<form:errors path="DIACHI"/>
							</div>

							<div class="col-md-12">
								<label class="labels" for="role">Role </label>
								<form:select path="chucvu.MACV" id="role" items="${list_role}"
						class="form-control" itemValue="MACV" itemLabel="TENCV"/>
							</div>
							
						</div>
						<div class="mt-5 text-center">
							<button class="btn btn-primary profile-button">Update
								Info</button>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="p-3 py-5">
						<!-- <div
							class="d-flex justify-content-between align-items-center experience">
							<span>Edit Experience</span><span
								class="border px-3 p-1 add-experience"><i
								class="fa fa-plus"></i>&nbsp;Experience</span>
						</div>
						<br>
						<div class="col-md-12">
							<label class="labels">Experience in Designing</label><input
								type="text" class="form-control" placeholder="experience"
								value="">
						</div>
						<br>
						<div class="col-md-12">
							<label class="labels">Additional Details</label><input
								type="text" class="form-control"
								placeholder="additional details" value=""> -->
					</div>
				</div>
			</div>
		</div>
	</body>
</form:form>
</html>