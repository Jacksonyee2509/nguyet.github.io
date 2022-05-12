<!-- ============================================================== -->
<!-- navbar -->
<!-- ============================================================== -->
<%@  taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>



<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet"
	href="assets/vendor/charts/chartist-bundle/chartist.css">
<link rel="stylesheet"
	href="assets/vendor/charts/morris-bundle/morris.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
<base href="${pageContext.servletContext.contextPath}/">
</head>



<div class="dashboard-header">

	<nav class="navbar navbar-expand-lg bg-white fixed-top">
		<a class="navbar-brand" href="admin.htm">Sport Equipment Shop</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto navbar-right-top">
				<li style="position:relative; top: 20px;" class="nav-user	">${LoginInfo.emloyee.nhanvien_name}</li>
				<li class="nav-item dropdown nav-user">
				<a class="nav-link nav-user-img" id="navbarDropdownMenuLink2"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
						src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"
						alt="" class="user-avatar-md rounded-circle"></a>
					
					<div class="dropdown-menu dropdown-menu-right nav-user-dropdown"
						aria-labelledby="navbarDropdownMenuLink2">
						
						<div class="nav-user-info">
							<%-- <c:if
								test="${ LoginInfo.role.role_id != 1 && LoginInfo.role.role_id != 3 }">
								<h5 class="mb-0 text-white nav-user-name"> ${LoginInfo.role.role_id} asdas
								</h5>
								<p>cc</p>
							</c:if> --%>
							<h5 class="mb-0 text-white nav-user-name"> ${LoginInfo.emloyee.nhanvien_name}
							</h5>
						</div>
						<a class="dropdown-item"
							href="${pageContext.servletContext.contextPath }/logoutAD.htm"><i
							class="fas fa-power-off mr-2"></i>Logout</a> <a class="dropdown-item"
							href="${pageContext.servletContext.contextPath }/home.htm"><i
							class="fas fa-home mr-2"></i>Go to home</a>
					</div></li>
			</ul>
		</div>
	</nav>
</div>
<!-- ============================================================== -->
<!-- end navbar -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- left sidebar -->
<!-- ============================================================== -->
<div class="nav-left-sidebar sidebar-dark">
	<div class="menu-list">
		<nav class="navbar navbar-expand-lg navbar-light">
			
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav flex-column">
					<li class="nav-divider">Menu</li>
					
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="collapse" aria-expanded="false"
						data-target="#submenu-7" aria-controls="submenu-7"><i
							class="fas fa-fw fa-table"></i>Orders</a>
						<div id="submenu-7" class="collapse submenu" style="">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link" href="admin/order/manager_order.htm"
									>Waiting order</a></li>
								<li class="nav-item"><a class="nav-link" href="admin/order/confirmedOrder.htm"
									>Confirmed order</a></li>
								<li class="nav-item"><a class="nav-link" href="admin/order/denyOrder.htm"
									>Deny order</a></li>	
								

							</ul>
						</div></li>	


				</ul>
			</div>
		</nav>
	</div>
</div>
<!-- ============================================================== -->
<!-- end left sidebar -->
<!-- ============================================================== -->