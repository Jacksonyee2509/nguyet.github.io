<%@include file="/WEB-INF/views/tablib.jsp"%>
<!doctype html>
<html lang="en">
<title>Employee Manager</title>

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
							<h5 class="card-header">Employee Manager</h5>
							<div class="card-body">
								<div class="table-title">
									<div class="row">
										<div class="col-sm-6">
											<a href="admin/addEmpl.htm" class="btn btn-success"> <i
												class="material-icons"></i> <span>Add New Employee</span></a>
										</div>
									</div>
								</div>
								<br>
								<div class="table-responsive">
									<table class="table table-striped table-bordered first">
										<thead>
											<tr>
												<th>Name</th>
												<th>Phone</th>
												<th>Address</th>
												<th>Role name</th>
												<th>Account Status</th>
											</tr>
										</thead>
										<c:forEach var="item" items="${ view_nv }" begin="0"
											end="${ view_nv.size() }" varStatus="loop">
											<tbody>
												<tr>
													<td>${ item.HOTEN}</td>
													<td>${ item.SDT}</td>
													<td>${ item.DIACHI}</td>
													<td>${ item.chucvu.TENCV }</td>	
													<c:if
														test="${ item.getTknv().TRANGTHAI == true}">
														<td>Active</td>		
													</c:if>
													<c:if
														test="${ item.getTknv().TRANGTHAI == false}">
														<td>Inactive</td>		
													</c:if>
													<c:if
														test="${ item.getTknv() == null}">
														<td>Unavailable</td>		
													</c:if>		
													<td><a title="Edit Info" class="edit"
															href="admin/editEmpl/${ item.MANV }.htm" data-toggle="tooltip">
														<img src="${pageContext.request.contextPath}/assets/images/chinhsua.jpg"
																height="30" style="max-width: 50px">
														</a>
													</td>
													<c:if
														test="${ item.getTknv() == null}">
														<td>
															<a title="Add Account" class="add"
																href="admin/addAcc/${ item.MANV }.htm"
																data-toggle="tooltip"> <img src="${pageContext.request.contextPath}/assets/images/addAcc.png"
																height="30" style="max-width: 40px">
															</a>
														</td>		
													</c:if>
													<c:if
														test="${ item.getTknv() != null}">
														<td>
															<a title="Update Account" class="update"
																href="admin/editAcc/${ item.MANV }.htm"
																data-toggle="tooltip"> <img src="${pageContext.request.contextPath}/assets/images/editAcc.png"
																height="30" style="max-width: 40px">
															</a>
														</td>		
													</c:if>
													
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