<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<title>Admin Dashboard</title>

<%@include file="/WEB-INF/views/admin/header/head.jsp"%>

<body>
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- navbar for ql -->
		<!-- ============================================================== -->
		<%
					if ((int)session.getAttribute("role") == 1) {
					%>
					<!-- navbar for ql -->
						<%@include file="/WEB-INF/views/admin/navbar/navbar.jsp"%>
					<%
					}
					else{
					%>
					<!-- navbar for nv -->
						<%@include file="/WEB-INF/views/admin/navbar/navbarNV.jsp"%>
					<%
					}
		%>

		
		<!-- ============================================================== -->
		<!-- end left sidebar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class="dashboard-ecommerce">
				<div class="container-fluid dashboard-content ">
					<!-- ============================================================== -->
					<!-- pageheader  -->
					<!-- ============================================================== -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="page-header">
								<h2 class="pageheader-title">E-commerce Dashboard Template
								</h2>
								<p class="pageheader-text">Nulla euismod urna eros, sit amet
									scelerisque torton lectus vel mauris facilisis faucibus at enim
									quis massa lobortis rutrum.</p>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end pageheader  -->
					<!-- ============================================================== -->
					<div class="ecommerce-widget">

						<div class="row">
							<!-- ============================================================== -->
							<!-- sales  -->
							<!-- ============================================================== -->
							<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="card border-3 border-top border-top-primary">
									<div class="card-body">
										<h5 class="text-muted">Product</h5>
										<div class="metric-value d-inline-block">
											<h1 class="mb-1">${ countProduct }</h1>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="card border-3 border-top border-top-primary">
									<div class="card-body">
										<h5 class="text-muted">Category</h5>
										<div class="metric-value d-inline-block">
											<h1 class="mb-1">${ countCategory }</h1>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="card border-3 border-top border-top-primary">
									<div class="card-body">
										<h5 class="text-muted">Customer</h5>
										<div class="metric-value d-inline-block">
											<h1 class="mb-1">${ countCustomer }</h1>
										</div>

									</div>
								</div>
							</div>

							<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
								<div class="card border-3 border-top border-top-primary">
									<div class="card-body">
										<h5 class="text-muted">Emloyee</h5>
										<div class="metric-value d-inline-block">
											<h1 class="mb-1">${ countEmloyee }</h1>
										</div>
									</div>
								</div>
							</div>
							<!-- ============================================================== -->
							<!-- end total orders  -->
							<!-- ============================================================== -->
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- ============================================================== -->
	<!-- end wrapper  -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- end main wrapper  -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<!-- jquery 3.3.1 -->
	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<!-- bootstap bundle js -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<!-- slimscroll js -->
	<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<!-- main js -->
	<script src="assets/libs/js/main-js.js"></script>
	<!-- chart chartist js -->
	<script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
	<!-- sparkline js -->
	<script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
	<!-- morris js -->
	<script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
	<script src="assets/vendor/charts/morris-bundle/morris.js"></script>
	<!-- chart c3 js -->
	<script src="assets/vendor/charts/c3charts/c3.min.js"></script>
	<script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
	<script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
	<script src="assets/libs/js/dashboard-ecommerce.js"></script>
</body>

</html>