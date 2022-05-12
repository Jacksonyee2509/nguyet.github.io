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
					<h2>Order id: ${id}</h2>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-border checkout-table">
								<tbody>
									<tr>
										<th>ID</th>
										<th class="hidden-xs">Image</th>
										<th>Product</th>
										<th class="hidden-xs">Price</th>
										<th>Quantity</th>
										<th class="hidden-xs">Discount</th>
										<th>Sub Total</th>
									</tr>
									<c:forEach var="item" items="${od}" varStatus="loop">

										<tr>
											<td><h5>${loop.count}</h5></td>
											<td class="hidden-xs"><img style="max-height:50px" src="assets/images/shop/${item.product.product_images }"/></td>
											<td>
												<h5 class="product-title font-alt">
													${item.product.product_name}</h5>
											</td>
											<td class="hidden-xs">
												<h5 class="product-title font-alt">
													${item.product.product_price}
												</h5>
											</td>

											<td class="hidden-xs">
												<h5 class="product-title font-alt">${item.quantity}</h5>
											</td>
											
											<td class="hidden-xs">
												<h5 class="product-title font-alt">${item.product.product_discount}</h5>
											</td>
											
											
											<td>
												<h5 class="product-title font-alt">
													<c:if test="${item.product.product_price != 0}">
														<fmt:formatNumber type="number"
															maxFractionDigits="3" value="${(item.product.product_price - item.product.product_discount )* item.quantity}" />
													</c:if>
													<c:if test="${item.product.product_price == 0}">
														<fmt:formatNumber type="number"
															maxFractionDigits="3" value="${item.product.product_price * item.quantity}" />
													</c:if>
												</h5>
											</td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-9"></div>
						<div class="col-sm-3">
						
							<h3>
								<strong>Total: <fmt:formatNumber type="number"
										maxFractionDigits="3" value="${total}" /> VND
								</strong>
							</h3>
						</div>
						
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