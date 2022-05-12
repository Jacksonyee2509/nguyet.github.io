<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/tablib.jsp"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<style>

</style>
<%@include file="/WEB-INF/views/user/header/head.jsp"%>


<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
	<section class="module">
				<div class="container">
					<div class="row">
					<h2 style="position:relative; text-align: center; top: -40px;">User profile</h2>
						
						
							<div style="margin:auto" class="col-sm-3 mb-sm-20">
								<c:if test="${LoginInfo.customer.khachhang_anh == null}">
									<a class="gallery"
									href="profile/${LoginInfo.users_id}.htm">
									<img src="assets/images/user/default-avatar.png" 
										alt="Ảnh đại diện" /></a>
								</c:if>
								<c:if test="${user.customer.khachhang_anh != null}">
									<a class="gallery"
									href="profile/${LoginInfo.users_id}.htm">
									<img style="display: block; margin-left: auto; margin-right: auto;" 
									src="assets/images/user/${user.customer.khachhang_anh}" 
										alt="Ảnh đại diện" /></a>
								</c:if>
								<form action="user/editAvatar.htm" method="post" enctype="multipart/form-data">
									<div class="form-group">
									<input name="id" id="id" value="${LoginInfo.users_id}" type="hidden" class="form-control"/>
									</div>
									<div class="col-md-12">
										<input name="user_images" type="hidden" value="${LoginInfo.customer.khachhang_anh}"/>
									</div>
									<div class="col-md-12">
						                <div style="text-align:center" class="custom-file">
						                	<label for="files" class="btn">Edit avatar</label>
						                    <input style="visibility:hidden;" onchange="form.submit()" value="submit" type="file" id="files"  class="custom-file-input" name="image" accept="image/*"/>
						                    
						                </div>
						                <!-- <button type="submit">Upload</button> -->
									</div>
								</form>
								
							</div>
							<form:form action="user/profile.htm" modelAttribute="user">
							<div class="form-group">
								<form:input path="users_id" type="hidden" class="form-control"
									placeholder="ID" readonly="true"/>
								</div>

							<div class="col-sm-6">
								<div class="form-group">
									<label>Name</label>
									<form:input path="customer.khachhang_name" type="text"
									class="form-control" placeholder="Họ và tên" />
									<form:errors path="customer.khachhang_name"/>
								</div>
								<div class="form-group">
									<label>Phone number</label> 
									<form:input path="customer.khachhang_sdt" type="tel"
									class="form-control" placeholder="Số điện thoại" pattern="[0]{1}[0-9]{9}" />
									<form:errors path="customer.khachhang_sdt"/>
								</div>

								<div class="form-group">
									<label>Email</label>
									<form:input path="users_username" type="text"
									class="form-control" placeholder="Username" />
									<form:errors path="Users_username"/>
								</div>
								
								<div class="form-group">
									<form:input path="customer.khachhang_anh" type="hidden"
									class="form-control" placeholder="Username" />
								</div>
								
								<div class="form-group">
									
									<label class="labels">Gender:</label><br> <span>Male
									</span>
									<form:radiobutton path="customer.khachhang_gioitinh"
										value="true" />
									<span>Female </span>
									<form:radiobutton path="customer.khachhang_gioitinh"
										value="false" />
								</div>
								
								<div class="col-md-12">
									<form:input path="role.role_id" type="hidden"
										class="form-control" placeholder="Role ID" readonly="true"/>
								</div>
								<div class="form-group">
									<label>Password:******** </label>
									<input name="password" id="password" type="hidden"
									class="form-control" placeholder="**********" value="${LoginInfo.users_password}" disabled="disabled" />
									<a style="text-decoration:underline" href="user/changePassword/${LoginInfo.users_id}.htm"><i>Change password</i></a>
								</div>
								
								
								
								<div class="row mb-20">
									<div class="col-sm-12">
										<div>
											<button type="submit"
												class="btn btn-lg btn-block btn-round btn-b">Update</button>
										</div>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</section>
		<%@include file="/WEB-INF/views/user/header/header.jsp"%>
		<div class="main">
		
		
		<%@include file="/WEB-INF/views/user/footer/footer.jsp"%>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
    <script type="text/javascript">
    $("#files").change(function() {
    	  filename = this.files[0].name
    	  console.log(filename);
    	});
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    
	<%@include file="/WEB-INF/views/user/js/js.jsp"%>
</body>
</html>