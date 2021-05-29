<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>

<!-- end header -->

<!-- start main content -->
<main class="container">

	<section>

		<div class="signuppanel">

			<div class="row">

				<div class="col-md-6">

					<div class="signup-info">
						<div class="logopanel">
							<h1><span>[</span> Ricky's Guitar <span>]</span></h1>
						</div><!-- logopanel -->

						<div class="mb20"></div>

						<h5><strong>Bootstrap 3 Ecommerce Template!</strong></h5>
						<p>Lookcare is a great theme that is perfect any browser.</p>
						<p>Below are some of the benefits you can have when purchasing this template.</p>
						<div class="mb20"></div>

						<div class="feat-list">
							<i class="fa fa-wrench"></i>
							<h4 class="text-success">Easy to Customize</h4>
							<p>Lookcare is made using Bootstrap 3 so you can easily customize any element of this template following the structure of Bootstrap 3.</p>
						</div>

						<div class="feat-list">
							<i class="fa fa-compress"></i>
							<h4 class="text-success">Fully Responsive Layout</h4>
							<p>Lookcare is design to fit on all browser widths and all resolutions on all mobile devices. Try to scale your browser and see the results.</p>
						</div>

						<div class="feat-list mb20">
							<i class="fa fa-search-plus"></i>
							<h4 class="text-success">Retina Ready</h4>
							<p>When a user load a page, a script checks each image on the page to see if there's a high-res version of that image. If a high-res exists, the script will swap that image in place.</p>
						</div>

						<h4 class="mb20">and much more...</h4>

					</div><!-- signup-info -->

				</div><!-- col-sm-6 -->

				<div class="col-md-6">
					
					<form class="signupform" method="post" action="<%=request.getContextPath()%>/public-signup">
						${error }${success }
						
						<h3 class="nomargin">Sign Up</h3>
						<p class="mt5 mb20">Already a member? <a href="signin.html"><strong>Sign In</strong></a></p>

						<label class="control-label">Name</label>
						<div class="row mb10">
							<div class="col-sm-6">
								<input name="firstname" type="text" class="form-control" placeholder="Firstname" />
							</div>
							<div class="col-sm-6">
								<input name="lastname" type="text" class="form-control" placeholder="Lastname" />
							</div>
						</div>

						<div class="mb10">
							<label class="control-label">Username</label>
							<input name="username" type="text" class="form-control" />
						</div>

						<div class="mb10">
							<label class="control-label">Password</label>
							<input name="password" type="password" class="form-control" />
						</div>

						<div class="mb10">
							<label class="control-label">Retype Password</label>
							<input name="repassword" type="password" class="form-control" />
						</div>

						<label class="control-label">Birthday</label>
						<div class="row mb10">
							<div class="col-sm-5">
								<select name="month" class="form-control chosen-select" data-placeholder="Month">
									<option value="Select">Select Month</option>
									<option value="01">January</option>
									<option value="02">February</option>
									<option value="03">March</option>
									<option value="04">April</option>
									<option value="05">May</option>
									<option value="06">June</option>
									<option value="07">July</option>
									<option value="08">August</option>
									<option value="09">September</option>
									<option value="10">October</option>
									<option value="11">November</option>
									<option value="12">December</option>
								</select>
							</div>
							<div class="col-sm-3">
								<input name="day" type="text" class="form-control" placeholder="Day" />
							</div>
							<div class="col-sm-4">
								<input name="year" type="text" class="form-control" placeholder="Year" />
							</div>
						</div>

						<div class="mb10">
							<label class="control-label">Email Address</label>
							<input name="email" type="text" class="form-control" />
						</div>
						
						<br />

						<button class="btn btn-success btn-block">Sign Up</button>
					</form>
				</div><!-- col-sm-6 -->

			</div><!-- row -->



		</div><!-- signuppanel -->

	</section>
</main>
<!-- end  main content -->

<!-- start footer area -->
<%@ include file="/templates/public/inc/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$('.signupform').validate({
			rules:{
				firstname:{
					required: true,
					minlength: 2,
					maxlength: 32,
				},
				lastname:{
					required: true,
					minlength: 2,
					maxlength: 32,
				},
				username:{
					required: true,
					minlength: 2,
					maxlength: 32,
				},
				password:{
					required: true,
					minlength: 1,
				},
				/* repassword:{
					required: true,
					equalTo: "#password",
				}, */
				
				day:{
					required: true,
					date: true,
					maxlength: 2,
				},
				month:{
					required: true,
				},
				year:{
					required: true,
					date: true,
				},
				
				email:{
					required: true,
					email: true,
				},
				

			},
			messages:{
				firstname:{
					required: "Vui lòng nhập tên.",
					minlength: "Tên phải từ 2- 32 ký tự.",
					maxlength: "Tên phải từ 2- 32 ký tự.",
				},
				lastname:{
					required: "Vui lòng nhập họ.",
					minlength: "Tên phải từ 2- 32 ký tự.",
					maxlength: "Tên phải từ 2- 32 ký tự.",
				},
				username:{
					required: "Vui lòng nhập tên.",
					minlength: "Tên phải từ 6- 32 ký tự.",
					maxlength: "Tên phải từ 6- 32 ký tự.",
				},
				password:{
					required: "Vui lòng nhập mật khẩu.",
					minlength: "Mật khẩu phải hơn 6 ký tự.",
				},
				repassword:{
					required: "Vui lòng xác nhận mật khẩu.",
					equalTo: "Phải khớp với mật khẩu ở trên.",
				},
				
				day:{
					required: "Vui lòng nhập Ngày sinh.",
					date: "Vui lòng nhập bằng số.",
				},
				month:{
					required: "Vui lòng nhập tháng sinh.",
				},
				year:{
					required: "Vui lòng nhập năm sinh.",
					date: "Vui lòng nhập bằng số.",
				},
				
				email:{
					required: "Vui lòng nhập e-mail.",
					email: "Vui lòng nhập đúng định dạng e-mail(vd: abc@gmail.com)",
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
