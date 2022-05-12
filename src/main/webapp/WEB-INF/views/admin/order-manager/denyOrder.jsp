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
							<h5 class="card-header">Deny order</h5>
							<div class="card-body">
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6">
											<a href="admin/order/manager_order.htm" class="btn btn-primary"> <i
												class="material-icons"></i> <span>View waiting order</span></a>
												<a href="admin/order/confirmedOrder.htm" class="btn btn-success"> <i
												class="admin/material-icons"></i> <span>View confirmed order</span></a>
										</div>
									</div>
								</div>
								<br>
								<div class="table-responsive">
									<table class="table table-striped table-bordered first">
										<thead>
											<tr>
												<th>ID</th>
												<th>Oder owner</th>
												<th>Address</th>
												<th>Phone number</th>
												<th>Email</th>
<!-- 												<th>Item</th> -->
<!-- 												<th>Note</th> -->
<!-- 												<th>Total</th> -->

											</tr>
										</thead>
										<c:forEach var="item" items="${denyOrder}">
											<tbody>
												<tr>
													<td>${ item.MAPD}</td>
													<td>${ item.HOTEN}</td>
													<td>${ item.DIACHI}</td>
													<td>${ item.SDT}</td>
													<td>${ item.EMAIL}</td>
												<td><a title="Detail" class="detail"
														href="admin/order/orderDetails/${item.MAPD}.htm"
														data-toggle="tooltip"> <img
															src="${pageContext.request.contextPath}/assets/images/detail.png"
															height="30" style="max-width: 50px">
													</a></td>
<%-- 												<td> -->
<%-- 														<strong><a href="admin/orderDetails/${item.MAPD}.htm"></a></strong> --%>
<!-- 													</td> -->
<%-- 													<td>${ item.order_note}</td> --%>
<%-- 													<td><fmt:formatNumber type="number" maxFractionDigits="3" --%>
<%-- 																value="${total}" /></td> --%>
												</tr>
											</tbody>
										</c:forEach>
<!-- 										<tfoot> -->
<!-- 											<tr> -->
<!-- 												<th>ID</th> -->
<!-- 												<th>Oder owner</th> -->
<!-- 												<th>Address</th> -->
<!-- 												<th>Phone number</th> -->
<!-- 												<th>Email</th> -->
<!-- <!-- 												<th>Item</th> -->
<!-- <!-- 												<th>Note</th> --> 
<!-- 												<th>Total</th> -->
<!-- 											</tr> -->
<!-- 										</tfoot> -->
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
