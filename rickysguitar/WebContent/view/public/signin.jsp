<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>

<!-- end header -->

<!-- start main content -->
<main class="container">

	<section>

		<div class="signinpanel">

			<div class="row">

				<div class="col-md-5 col-md-offset-1">
				

					<form method="post" class="signinform" action="">
					<%
				if(request.getParameter("msg")!=null){
					out.print("<p style='color:red'>Tài khoản hoặc mật khẩu không đúng.</p>");
				}
				%>
						<h4 class="nomargin">Sign In</h4>
						<p class="mt5 mb20">Login to access your account.</p>

						<input name="username" type="text" class="form-control uname" placeholder="Username" />
						<input name="password" type="password" class="form-control pword" placeholder="Password" />
						<a href="#"><small>Forgot Your Password?</small></a>
						<button class="btn btn-success btn-block">Sign In</button>

					</form>
				</div><!-- col-sm-5 -->

				<div class="col-md-5 col-md-push-1">

					<div class="signin-info">
						<div class="logopanel">
							<h1><span>[</span> Ricky's Guitar <span>]</span></h1>
						</div><!-- logopanel -->

						<div class="mb20"></div>

						<h5><strong>Welcome to Ricky's Guitar Shop!</strong></h5>
						<ul>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> Fully Responsive Layout</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> HTML5/CSS3 Valid</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> Ecommerce Template</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> Easy Customize</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> and much more...</li>
						</ul>
						<div class="mb20"></div>
						<strong>Not a member? <a href="<%=request.getContextPath()%>/public-signup">Sign Up</a></strong>
					</div><!-- signin0-info -->

				</div><!-- col-sm-7 -->



			</div><!-- row -->


		</div><!-- signin -->

	</section>
</main>
<!-- end  main content -->

<!-- start footer area -->
<%@ include file="/templates/public/inc/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$('.signinform').validate({
			rules:{
				
				username:{
					required: true,
				},
				password:{
					required: true,
				}

			},
			messages:{
				
				username:{
					required: "Vui lòng nhập tên.",
				
				},
				password:{
					required: "Vui lòng nhập mật khẩu.",
				},
				
			},

		});
	});

</script>
<style>
.error{
color: red;
}
</style>

</body>
</html>
