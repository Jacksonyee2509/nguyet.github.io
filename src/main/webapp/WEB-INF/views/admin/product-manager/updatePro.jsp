<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/tablib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<base href="${pageContext.servletContext.contextPath }/">
<title>Update Product</title>
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
<body oncontextmenu='return false' class='snippet-body'>
<form:form action="admin/updatePro.htm" modelAttribute="sanpham" enctype="multipart/form-data" method="post">
		<div class="container rounded bg-white mt-5 mb-5">
			<div class="row">
				<div class="col-md-3 border-right">
					<div
						class="d-flex flex-column align-items-center text-center p-3 py-5">
						<img class="rounded-circle mt-5" width="150px"
							src="assets/images/product.jpg">
					</div>
				</div>
				<div class="col-md-7 border-right">
					<div class="p-3 py-5">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<h4 class="text-right">Update Product</h4>
						</div>
						<div class="row mt-3">
							<form:hidden path="MASP"/>
							<form:hidden path="HINHANH"/>
							<div class="col-md-12">
								<label class="labels">Name</label>
								<form:input path="TENSP" type="text" class="form-control" id="name" required="required"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Price</label>
								<form:input path="DONGIA" type="text" class="form-control" id="price" required="required"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Discount</label>
								<form:input path="KHUYENMAI" type="text"
									class="form-control" placeholder="Discount" value="0" required="required"/>
								<form:errors path="KHUYENMAI" />
							</div>
							<div class="col-md-12">
								<label class="labels">Brand</label>
								<form:input path="HANG" type="text" class="form-control" id="brand"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Quantity</label>
								<form:input path="SOLUONG" type="text" class="form-control" required="required"/>
							</div>
							<div class="col-md-12">
								<label class="labels">Image</label>	
				                <div class="custom-file">
				                    <input type="file" class="custom-file-input" name="image" accept="image/*"/>
				                    
				                </div>
							</div>
							<div class="col-md-12">
								<label class="labels">Detail</label>
								<form:input path="MOTA" type="text" class="form-control" id="detail"/>
							</div>

							<div class="col-md-12">
								<label class="labels" for="category">Category: </label>
								<form:select path="loaisp.MALOAI" id="category" items="${view_category}"
						class="form-control" itemValue="MALOAI" itemLabel="TENLOAI"/>
							</div>
							
							
							<div class="mt-5 text-center">
								<button class="btn btn-primary profile-button">Update Product</button>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="p-3 py-5"></div>
					</div>
				</div>
			</div>
		</div>
</form:form>
</body>
</html>