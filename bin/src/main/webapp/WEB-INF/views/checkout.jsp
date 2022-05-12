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
					<h2>Your cart</h2>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-border checkout-table">
								<tbody>
									<tr>
										<th class="hidden-xs">Item</th>
										<th>Description</th>
										<th class="hidden-xs">Price</th>
										<th>Quantity</th>
										<th>Sub Total</th>
									</tr>
									<c:forEach var="item" items="${gioHang.items}">

										<tr>
											<td class="hidden-xs"><a href="#"><img
													src="assets/images/shop/${item.prod.product_images}"
													alt="Accessories Pack" /></a></td>
											<td>
												<h5 class="product-title font-alt">
													${item.prod.product_name}</h5>
											</td>
											<td class="hidden-xs">
												<h5 class="product-title font-alt">
													<c:if test="${ item.prod.product_discount > 0 }">
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${ item.prod.product_price - item.prod.product_discount}" />
																		VND
																</c:if>
												<c:if test="${ item.prod.product_discount == 0 }">
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${item.prod.product_price}" /> VND
																</c:if>	
														
														
														
														
												</h5>
											</td>

											<td class="hidden-xs">
												<h5 class="product-title font-alt">${item.quantity}</h5>
											</td>
											<td>
												<h5 class="product-title font-alt">
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${item.subTotal}" />
													VND
												</h5>
											</td>
										</tr>
									</c:forEach>
									<!-- <tr>
										<td class="hidden-xs"><a href="#"><img
												src="assets/images/shop/product-13.jpg"
												alt="Men’s Casual Pack" /></a></td>
										<td>
											<h5 class="product-title font-alt">Men’s Casual Pack</h5>
										</td>
										<td class="hidden-xs">
											<h5 class="product-title font-alt">£20.00</h5>
										</td>
										<td><input class="form-control" type="number" name=""
											value="1" max="50" min="1" /></td>
										<td>
											<h5 class="product-title font-alt">£20.00</h5>
										</td>
										<td class="pr-remove"><a href="#" title="Remove"><i
												class="fa fa-times"></i></a></td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group">
								<input class="form-control" type="text" id="" name=""
									placeholder="Coupon code" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<button class="btn btn-round btn-g" type="submit">Apply</button>
							</div>
						</div>
						<h3 style="top: -18px; right: -150px; position: relative;">
							<strong>Total: <fmt:formatNumber type="number"
									maxFractionDigits="3" value="${gioHang.total}" /> VND 
							</strong>
						</h3>
						<div class="col-sm-3 col-sm-offset-3"></div>
					</div>
					<hr class="divider-w">
					<div class="row mt-70">
						<div class="col-sm-6 col-sm-offset-3">
							<h3 style="text-align: center;">Thông tin khách hàng</h3>
							<form:form action="reviewOrder.htm" method="post"
								modelAttribute="Order">
								<%-- <input id="order_owner" type="hidden" name="order_owner" value="${LoginInfo.users_id}"/> --%>
								<div class="form-group">
									<label>Name</label> <input class="form-control"
										id="order_ownername" type="text" name="order_ownername"
										placeholder="Tên khách hàng" required />
										<input id="order_owner" type="hidden" name="order_owner" value="${LoginInfo.users_id}"/>
								</div>
								<div class="form-group">
									<label>Address</label> <input class="form-control"
										id="order_address" type="text" name="order_address"
										placeholder="Địa chỉ nhận hàng" required />
								</div>
								<div class="form-group">
									<label>Phone number</label> <input class="form-control"
										id="order_phone" type="tel" name="order_phone"
										pattern="[0][0-9]{9}" placeholder="Số điện thoại" required
										title="Vui lòng nhập số điện thoại hợp lệ" />
								</div>

								<div class="form-group">
									<label>Email</label> <input class="form-control"
										id="order_email" type="email" name="order_email"
										placeholder="Email" pattern="[A-Za-z0-9_-.-]{1,50}@gmail.com"
										required title="Vui lòng nhập 'gmail' hợp lệ" />
								</div>

								<div>
									<input name="order_items" id="order_items" value="${gioHang.itemName }"
										type="hidden" />
								</div>

								<div class="form-group">
									<label>Note</label>
									<textarea class="form-control" id="order_note"
										name="order_note" placeholder="Ghi chú"></textarea>
								</div>

								<div style="position: relative; left: 200px;" class="form-group">
									<button class="btn btn-round btn-b">Đặt hàng</button>
								</div>

							</form:form>
						</div>
					</div>
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















<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
					<h2>Your cart</h2>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-border checkout-table">
								<tbody>
									<tr>
										<th class="hidden-xs">Item</th>
										<th>Description</th>
										<th class="hidden-xs">Price</th>
										<th>Quantity</th>
										<th>Sub Total</th>
									</tr>
									<c:forEach var="item" items="${gioHang.items}">

										<tr>
											<td class="hidden-xs"><a href="#"><img
													src="assets/images/shop/${item.prod.product_images}"
													alt="Accessories Pack" /></a></td>
											<td>
												<h5 class="product-title font-alt">
													${item.prod.product_name}</h5>
											</td>
											<td class="hidden-xs">
												<h5 class="product-title font-alt">
													<c:if test="${ item.prod.product_discount > 0 }">
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${ item.prod.product_price - item.prod.product_discount}" />
																		VND
																</c:if>
												<c:if test="${ item.prod.product_discount == 0 }">
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${item.prod.product_price}" /> VND
																</c:if>	
														
														
														
														
												</h5>
											</td>

											<td class="hidden-xs">
												<h5 class="product-title font-alt">${item.quantity}</h5>
											</td>
											<td>
												<h5 class="product-title font-alt">
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${item.subTotal}" />
													VND
												</h5>
											</td>
										</tr>
									</c:forEach>
									<!-- <tr>
										<td class="hidden-xs"><a href="#"><img
												src="assets/images/shop/product-13.jpg"
												alt="Men’s Casual Pack" /></a></td>
										<td>
											<h5 class="product-title font-alt">Men’s Casual Pack</h5>
										</td>
										<td class="hidden-xs">
											<h5 class="product-title font-alt">£20.00</h5>
										</td>
										<td><input class="form-control" type="number" name=""
											value="1" max="50" min="1" /></td>
										<td>
											<h5 class="product-title font-alt">£20.00</h5>
										</td>
										<td class="pr-remove"><a href="#" title="Remove"><i
												class="fa fa-times"></i></a></td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group">
								<input class="form-control" type="text" id="" name=""
									placeholder="Coupon code" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<button class="btn btn-round btn-g" type="submit">Apply</button>
							</div>
						</div>
						<h3 style="top: -18px; right: -150px; position: relative;">
							<strong>Total: <fmt:formatNumber type="number"
									maxFractionDigits="3" value="${gioHang.total}" /> VND
							</strong>
						</h3>
						<div class="col-sm-3 col-sm-offset-3"></div>
					</div>
					<hr class="divider-w">
					<div class="row mt-70">
						<div class="col-sm-6 col-sm-offset-3">
							<h3 style="text-align: center;">Thông tin khách hàng</h3>
							<form:form action="reviewOrder.htm" method="post"
								modelAttribute="Order">
								<input id="order_owner" name="order_owner" type="hidden" value="${LoginInfo.users_id}"/>
								<div class="form-group">
									<label>Name</label> <input class="form-control"
										id="order_ownername" type="text" name="order_ownername"
										placeholder="Tên khách hàng" required />
								</div>
								<div class="form-group">
									<label>Address</label> <input class="form-control"
										id="order_address" type="text" name="order_address"
										placeholder="Địa chỉ nhận hàng" required />
								</div>
								<div class="form-group">
									<label>Phone number</label> <input class="form-control"
										id="order_phone" type="tel" name="order_phone"
										pattern="[0][0-9]{9}" placeholder="Số điện thoại" required
										title="Vui lòng nhập số điện thoại hợp lệ" />
								</div>

								<div class="form-group">
									<label>Email</label> <input class="form-control"
										id="order_email" type="email" name="order_email"
										placeholder="Email" pattern="[A-Za-z0-9]{1,50}@gmail.com"
										required title="Vui lòng nhập 'gmail' hợp lệ" />
								</div>

								<div>
									<input name="order_items" value="${gioHang.itemName }"
										type="hidden" />
										<input name="total" value="${gioHang.total }"
										type="hidden" />
									
								</div>

								<div class="form-group">
									<label>Note</label>
									<textarea class="form-control" id="order_note"
										name="order_note" placeholder="Ghi chú"></textarea>
								</div>

								<div style="position: relative; left: 200px;" class="form-group">
									<button class="btn btn-round btn-b">Đặt hàng</button>
								</div>

							</form:form>
						</div>
					</div>
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
</html> --%>