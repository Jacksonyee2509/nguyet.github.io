<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

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
							<h4 class="font-alt">Login</h4>
							<hr class="divider-w mb-10">
							<form action="login.htm" method="post" class="form">
								<div class="form-group">
									<input class="form-control" id="username" type="text"
										name="username_login" placeholder="Username" required />
								</div>
								<div class="form-group">
									<input class="form-control" id="password" type="password"
										name="password_login" placeholder="Password" required />
								</div>
								<c:if test="${ message != null}">
									<div class="alert alert-danger" role="alert">
										${ message }
									</div>
								</c:if>
								<div class="form-group">
									<button class="btn btn-round btn-b">Đăng nhập</button>
								</div>
								<div class="form-group">
									<a href="forgetpass.htm">Quên mật khẩu?</a>
								</div>

								<!-- khi đăng nhập sai mới hiện status -->
								

							</form>
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