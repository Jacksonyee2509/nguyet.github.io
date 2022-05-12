<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<%@include file="/WEB-INF/views/user/header/head.jsp"%>

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>

		<%@include file="/WEB-INF/views/user/header/header.jsp"%>

		<section class="home-section home-fade home-full-height" id="home">
			<div class="hero-slider">
				<ul class="slides">
					<li class="bg-dark-30 bg-dark shop-page-header"
						style="background-image: url(&quot;assets/images/shop/sb-2.jpg;quot;);">
						<div class="titan-caption">
							<div class="caption-content">
								<div class="font-alt mb-30 titan-title-size-1">This is
									Essential Collection sprots Shop</div>
								<div class="font-alt mb-30 titan-title-size-4">2021</div>
								<div class="font-alt mb-40 titan-title-size-4">Your online
									sports shopping destination</div>
							</div>
						</div>
					</li>
					<li class="bg-dark-30 bg-dark shop-page-header"
						style="background-image: url(&quot;assets/images/shop/bg-3.jpg;quot;);">
						<div class="titan-caption">
							<div class="caption-content">
								<div class="font-alt mb-30 titan-title-size-1">This is
									Essential Collection sports Shop</div>
								<div class="font-alt mb-30 titan-title-size-4">2021</div>
								<div class="font-alt mb-40 titan-title-size-1">Your online
									sports shopping destination</div>
							</div>
						</div>
					</li>
					<li class="bg-dark-30 bg-dark shop-page-header"
						style="background-image: url(&quot;assets/images/shop/bg-4.jpg;quot;);">
						<div class="titan-caption">
							<div class="caption-content">
								<div class="font-alt mb-30 titan-title-size-1">This is
									Essential Collection sprots Shop</div>
								<div class="font-alt mb-30 titan-title-size-4">2021</div>
								<div class="font-alt mb-40 titan-title-size-4">Your online
									sports shopping destination</div>
							</div>
						</div>
					</li>
					<li class="bg-dark-30 bg-dark shop-page-header"
						style="background-image: url(&quot;assets/images/shop/sb-1.jpg;quot;);">
						<div class="titan-caption">
							<div class="caption-content">
								<div class="font-alt mb-30 titan-title-size-1">This is
									Essential Collection sprots Shop</div>
								<div class="font-alt mb-30 titan-title-size-4">2021</div>
								<div class="font-alt mb-40 titan-title-size-4">Your online
									sports shopping destination</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</section>
		
	
		
		<div class="main">
			<section class="module-small">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">Featured Products</h2>
						</div>
					</div>
					<div class="row multi-columns-row">
						<c:forEach var="item" items="${ all_product }" begin="0" end="3"
							varStatus="loop">
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="shop-item">
									<div class="shop-item-image">
										<img src="assets/images/shop/${ item.product_images }"
											alt="Accessories Pack" />
										<div class="shop-item-detail">
											<a class="btn btn-round btn-b"
												href="addToCart/${ item.product_id }.htm"><span
												class="icon-basket">Add To Cart</span></a>
										</div>
									</div>
									<h4 class="shop-item-title font-alt">
										<a href="product/${item.product_id }.htm">${ item.product_name }</a>
									</h4>
									<c:if test="${ item.product_discount > 0 }">
										<del>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${item.product_price}" />
											VND
										</del>

										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${ item.product_price - item.product_discount}" />
															VND
													</c:if>
									<c:if test="${ item.product_discount == 0 }">
										<fmt:formatNumber type="number" maxFractionDigits="3"
											value="${item.product_price}" /> VND
													</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row mt-30">
						<div class="col-sm-12 align-center">
							<a class="btn btn-b btn-round" href="product.htm">See all
								products</a>
						</div>
					</div>
				</div>
			</section>
			<hr class="divider-w">
			<section class="module module-video bg-dark-30"
				data-background="assets/images/Screenshot-44.png">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt mb-0">Sport and health</h2>
						</div>
					</div>
				</div>
				<div class="video-player"
					data-property="{videoURL:'https://www.youtube.com/watch?v=BUvEEVq4woU', containment:'.module-video', startAt:5, mute:true, autoPlay:true, loop:true, opacity:1, showControls:false, showYTLogo:false, vol:25}"></div>
			</section>
			<hr class="divider-w">
			<section class="module" id="news">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">Featured Categorys</h2>
						</div>
					</div>
					<div class="row multi-columns-row post-columns wo-border">
						<c:forEach var="item" items="${ all_category }" begin="0" end="5"
							varStatus="loop">
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="post mb-40">
									<div class="post-header font-alt">
										<h2 class="post-title">
											<a href="category/${ item.category_id }.htm">${ item.category_name }</a>
										</h2>
									</div>
									<div class="post-entry">
										<p>A wonderful serenity has taken possession of my entire
											soul, like these sweet mornings of spring which I enjoy with
											my whole heart.</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			<hr class="divider-w">

			<!-- Logo nhà cung cấp  -->
			<section class="module-small">
				<div class="container">
					<div class="row client">
						<div class="owl-carousel text-center" data-items="6"
							data-pagination="false" data-navigation="false">
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="client-logo">
										<img src="assets/images/puma.png" alt="Client Logo" />
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="client-logo">
										<img src="assets/images/nike.png" alt="Client Logo" />
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="client-logo">
										<img src="assets/images/nb.png"
											alt="Client Logo" />
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="client-logo">
										<img src="assets/images/adidas-logo.png" alt="Client Logo" />
									</div>
								</div>
							</div>

							<div class="owl-item">
								<div class="col-sm-12">
									<div class="client-logo">
										<img src="assets/images/ea.png" alt="Client Logo" />
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="client-logo">
										<img src="assets/images/reebok.png" alt="Client Logo" />
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="client-logo">
										<img src="assets/images/under.png" alt="Client Logo" />
									</div>
								</div>
							</div>

							<div class="owl-item">
								<div class="col-sm-12">
									<div class="client-logo">
										<img src="assets/images/vans.png" alt="Client Logo" />
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="client-logo">
										<img src="assets/images/nba.png" alt="Client Logo" />
									</div>
								</div>
							</div>
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