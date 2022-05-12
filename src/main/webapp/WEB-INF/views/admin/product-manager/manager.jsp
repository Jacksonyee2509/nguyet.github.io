<%@include file="/WEB-INF/views/tablib.jsp"%>
<!doctype html>
<html lang="en">
<title>User Manager</title>

<%@include file="/WEB-INF/views/admin/header/head.jsp"%>

<body>

	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- navbar -->
		<!-- ============================================================== -->
		<%@include file="/WEB-INF/views/admin/navbar/navbar.jsp"%>
		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class="container-fluid  dashboard-content">

				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
						<c:if test="${ message != null }">  
		               		<div class="alert alert-primary" role="alert">${ message }</div>
						</c:if> 
							<h5 class="card-header">Product Manager</h5>
							<div class="card-body">
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6">
											<a href="admin/addPro.htm" class="btn btn-success"> <i
												class="material-icons"></i> <span>Add New Product</span></a>
										</div>
									</div>
								</div>
								<br>
								<div class="table-responsive">
									<table class="table table-striped table-bordered first">
										<thead>
											<tr>
												<th>Name</th>
												<th>Image</th>
												<th>Price</th>
												<th>Discount</th>												
												<th>Quantity</th>
												<th>Brand</th>
												<th>Category</th>
											</tr>
										</thead>
										<c:forEach var="item" items="${ view_product }" begin="0"
											end="${ view_product.size() }" varStatus="loop">
											<tbody>
												<tr>
													<td>${ item.TENSP}</td>
													<td><img width="50px" src="assets/images/shop/${item.HINHANH }"/></td>
													<td>${ item.DONGIA}</td>
													<td>${ item.KHUYENMAI }</td>
													<td>${ item.SOLUONG }</td>
													<td>${ item.HANG }</td>
													<td>${ item.loaisp.TENLOAI }</td>
													<td><a title="Edit" class="edit"
														href="admin/updatePro/${ item.MASP }.htm" data-toggle="tooltip">
															<img
															src="${pageContext.request.contextPath}/assets/images/chinhsua.jpg"
															height="30" style="max-width: 50px">
													</a></td>
														<td><a title="Delete" class="delete"
															href="admin/deletePro/${ item.MASP }.htm"
															data-toggle="tooltip"> <img
																src="${pageContext.request.contextPath}/assets/images/xoa.png"
																height="30" style="max-width: 40px">
														</a></td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>

				</div>
				<!-- </div> -->
				<!-- ============================================================== -->
				<!-- footer -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- end footer -->
				<!-- ============================================================== -->
			</div>
		</div>
	</div>
 
	<!-- ============================================================== -->
	<!-- end main wrapper -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<%-- <c:if test="${ message != null }">  
		 <%@include file="/WEB-INF/views/alertMess.jsp"%>                    
	</c:if> --%>
	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script src="assets/vendor/multi-select/js/jquery.multi-select.js"></script>
	<script src="assets/libs/js/main-js.js"></script>
	<script src="assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="assets/vendor/datatables/js/data-table.js"></script>
</body>

</html>