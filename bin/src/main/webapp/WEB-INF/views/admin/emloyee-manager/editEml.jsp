<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/tablib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<base href="${pageContext.servletContext.contextPath }/">
<title>Edit Emloyee</title>
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
<form:form action="editEml.htm" modelAttribute="user" method="POST">
	<body oncontextmenu='return false' class='snippet-body'>

		<div class="container rounded bg-white mt-5 mb-5">
			<div class="row">
				<div class="col-md-3 border-right">
					<div
						class="d-flex flex-column align-items-center text-center p-3 py-5">
						<img class="rounded-circle mt-5" width="150px"
							src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span
							class="font-weight-bold">${ user.emloyee.nhanvien_name }</span><span
							class="text-black-50">${ user.users_username }</span><span>
						</span>
					</div>
				</div>
				<div class="col-md-5 border-right">
					<div class="p-3 py-5">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<h4 class="text-right">Profile Settings</h4>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">ID</label>
								<form:input path="users_id" type="text" class="form-control"
									placeholder="first name" readonly="true" />
							</div>
							<div class="col-md-12">
								<label class="labels">Name</label>
								<form:input path="emloyee.nhanvien_name" type="text"
									class="form-control" placeholder="Họ và tên" />
									<form:errors path="emloyee.nhanvien_name"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Mobile Number</label>
								<form:input path="emloyee.nhanvien_sdt" type="text"
									class="form-control" placeholder="Số điện thoại" value="" />
									<form:errors path="emloyee.nhanvien_sdt"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Username</label>
								<form:input path="users_username" type="text"
									class="form-control" placeholder="Username" />
									<form:errors path="users_username"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Password</label>
								<form:input path="users_password" type="password"
									class="form-control" placeholder="Password" value="" />
									<form:errors path="users_password"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Role ID</label>
								<form:input path="role.role_id" type="text" class="form-control"
									placeholder="Role ID" />
								<%-- <form:select path="role.role_id">
										<c:forEach var="item" items="${ view_role }" begin="0"
											end="${ view_role.size() }" varStatus="loop">
											<form:option value="${ item.role_name }"></form:option>
										</c:forEach>
									</form:select> --%>
							</div>
							<div class="col-md-12">
								<label class="labels">Gender:</label><br> <span>Male
								</span>
								<form:radiobutton path="emloyee.nhanvien_gioitinh" value="true" />
								<span>Female </span>
								<form:radiobutton path="emloyee.nhanvien_gioitinh" value="false" />
							</div>
						</div>
						<!-- <div class="row mt-3">
							<div class="col-md-6">
								<label class="labels">Country</label><input type="text"
									class="form-control" placeholder="country" value="">
							</div>
							<div class="col-md-6">
								<label class="labels">State/Region</label><input type="text"
									class="form-control" value="" placeholder="state">
							</div>
						</div> -->
						<div class="mt-5 text-center">
							<button class="btn btn-primary profile-button">Save
								Profile</button>
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
		</div>
	</body>
</form:form>
</html>