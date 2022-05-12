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
							<div class="card-body">
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6">
										<h5 class="card-header">Order ${id} details</h5>
										</div>
									</div>
								</div>
								<br>
								<div class="table-responsive">
									<table class="table table-bordered"> <!-- class="table table-striped table-bordered first" -->
										<!-- <thead> -->
											<tr class="bg-light text-dark">
												<th>ID</th>
												<th>Image</th>
												<th>Name</th>
												<th>Price</th>
												<th>Discount</th>
												<th>Quantity</th>
												<th>Subtotal</th>
												<th>Total</th>
											</tr>
										<!-- </thead> -->
										<c:forEach var="item" items="${od}" varStatus="loop">
											<!-- <tbody> -->
												<tr>
													<td>${ loop.count}</td>
													<td><img width="50px" src="assets/images/shop/${item.sp.HINHANH}"/></td>
													<td>${ item.sp.TENSP}</td>
													<td>${ item.sp.DONGIA}</td>
													<td>${ item.sp.KHUYENMAI}</td>
													<td>${ item.SOLUONG }</td>
													<td>
														<c:if test="${item.sp.KHUYENMAI != 0}">
															<fmt:formatNumber type="number"
																maxFractionDigits="3" value="${(item.sp.DONGIA - item.sp.DONGIA*item.sp.KHUYENMAI )* item.SOLUONG}" />
														</c:if>
														<c:if test="${item.sp.KHUYENMAI == 0}">
															<fmt:formatNumber type="number"
																maxFractionDigits="3" value="${item.sp.DONGIA * item.SOLUONG}" />
															
														</c:if>				
													</td>
													<c:if test="${loop.first}">
													<td rowspan="${size}">
														 <strong>Total: <fmt:formatNumber type="number"
																maxFractionDigits="2" value="${total}" /> VND
														</strong>
													</td>
													</c:if>
													
												</tr>
											<!-- </tbody> -->
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>

				</div>
			</div>
		</div>
	<!-- ============================================================== -->
	<!-- end main wrapper -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->

	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script src="assets/vendor/multi-select/js/jquery.multi-select.js"></script>
	<script src="assets/libs/js/main-js.js"></script>
	<script src="assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="assets/vendor/datatables/js/data-table.js"></script>
</body>

</html>