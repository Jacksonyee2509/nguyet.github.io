<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/tablib.jsp"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<%@include file="/WEB-INF/views/user/header/head.jsp"%>

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>

		<%@include file="/WEB-INF/views/user/header/header.jsp"%>

		<div class="main">
			<section class="module">
				<div class="container">
					<h2>Your order</h2>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-border checkout-table">
								<tbody>
									<tr>
										<th style="max-width: 50px">Order</th>
										<th class="hidden-xs">Owner</th>
										<th>Order item</th>
										<th class="hidden-xs">Address</th>
										<th>Phone number</th>
										<th class="hidden-xs">Note</th>
										<th>Order status</th>
										<th>Total</th>
									</tr>
									<c:forEach var="item" items="${order }" varStatus="loop">

										<tr>
											<td class="hidden-xs">
													<h5>${loop.count}</h5></td>
											<td>
													<h5>${item.order_ownername}</h5></td>
											<td>
												<h5><a href="user/orderDetails/${item.order_id}.htm">${item.order_items}</a></h5>
											</td>
											<td class="hidden-xs">
												<h5>${item.order_address }</h5>
											</td>
											<td>${item.order_phone}</td>
											<td class="hidden-xs">
												<h5>${item.order_note}</h5>
											</td>
											<td>
												<c:if test="${item.order_status == NULL }">
													<h5><i>Chờ xác nhận</i></h5>
												</c:if>
												<c:if test="${item.order_status == 1 }">
													<h5 style="color:green"><i>Đã xác nhận</i></h5>
												</c:if>
												<c:if test="${item.order_status == 0 }">
													<h5 style="color:red"><i>Từ chối</i></h5>
												</c:if>
											</td>
											<td>
												<h5><strong><fmt:formatNumber type="number" maxFractionDigits="3"
														value="${item.total}" /></strong></h5>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						
					</div>
					<hr class="divider-w">
				</div>
			</section>

			<%@include file="/WEB-INF/views/user/footer/footer.jsp"%>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<%@include file="/WEB-INF/views/user/js/js.jsp"%>
</body>
</html>