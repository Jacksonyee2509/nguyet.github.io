<%@include file="/WEB-INF/views/tablib.jsp"%>
<!doctype html>
<html lang="en">
<title>Order Manager</title>

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
							<h5 class="card-header">Order Manager</h5>
							<div class="card-body">
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6">
											<a href="admin/order/confirmedOrder.htm" class="btn btn-success"> <i
												class="material-icons"></i> <span>View confirmed order</span></a>
												<a href="admin/order/denyOrder.htm" class="btn btn-warning"> <i
												class="material-icons"></i> <span>View deny order</span></a>
										</div>
									</div>
								</div>
								<br>
								<div class="table-responsive">
									<table class="table table-striped table-bordered first">
										<thead>
											<tr>
												<th>Oder owner</th>
												<th>Phone number</th>
												<th>Address</th>
												<th>Order Date</th>

											</tr>
										</thead>
										<c:forEach var="item" items="${waitingOrder}">
											<tbody>
												<tr>
													<td>${ item.HOTEN}</td>
													<td>${ item.SDT}</td>
													<td>${ item.DIACHI}</td>
													<td>${ item.NGAYDAT}</td>
													
													<td><a title="Detail" class="detail"
														href="admin/order/orderDetails/${item.MAPD}.htm"
														data-toggle="tooltip"> <img
															src="${pageContext.request.contextPath}/assets/images/detail.png"
															height="30" style="max-width: 50px">
													</a></td>
													<td><a title="Accept" class="edit"
														href="admin/order/accept/${item.MAPD}.htm"
														data-toggle="tooltip"> <img
															src="${pageContext.request.contextPath}/assets/images/accept.png"
															height="30" style="max-width: 50px">
													</a></td>
													<td><a title="Deny" class="delete"
														href="admin/order/deny/${ item.MAPD }.htm"
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

	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script src="assets/vendor/multi-select/js/jquery.multi-select.js"></script>
	<script src="assets/libs/js/main-js.js"></script>
	<script src="assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="assets/vendor/datatables/js/data-table.js"></script>
</body>

</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/tablib.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1px;">
		<h2>Waiting order</h2>
		<c:forEach var="item" items="${nullOrder}">
			<tr>
				<td>${item.order_id}</td>
				<td>${item.order_owner}</td>
				<td>${item.order_item}</td>
				<td><a href="accept/${item.order_id }.htm">OK</a></td>
				<td><a href="deny/${item.order_id }.htm">DENY</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<table border="1px;">
		<h2>Confirmed order</h2>
		<c:forEach var="item2" items="${confirmedOrder}">
			<tr>
				<td>${item2.order_id}</td>
				<td>${item2.order_owner}</td>
				<td>${item2.order_item}</td>
			</tr>
		</c:forEach>
	</table>
	
	<table border="1px;">
		<h2>Deny order</h2>
		<c:forEach var="item3" items="${denyOrder}">
			<tr>
				<td>${item3.order_id}</td>
				<td>${item3.order_owner}</td>
				<td>${item3.order_item}</td>
			</tr>
		</c:forEach>
	</table>
		

		
		
	
	
		
	
</body>
</html> --%>