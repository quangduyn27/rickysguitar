<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>

<!-- end header -->

<!-- start main content -->
<main class="main-container ptb-40">

	<!-- Begin Blog -->
	<div class="ld-subpage-content">
		<div class="ld-blog">



			<!-- Blog / Srart
          ================================================== -->
			<section class="blog">
				<div class="container">

					<div class="row">

						<div class="col-md-12">

							<!-- Post Start -->
							<article class="post">

								<div class="main-info pull-left">
									<!-- Date -->
									<div class="date">
										<span class="month">May</span>
										<span class="day">31</span>
									</div>

									<!-- Comments Number -->
									<a href="#" class="commentsnumber">
										<span>14</span> comments
									</a>
								</div>

								<div class="post-content">

									<!-- Thumbnail -->
									<a href="#"><img src="<%=request.getContextPath() %>/templates/public/img/blog/blog-04.png" alt=""></a>

									<!-- Title -->
									<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus neque vitae felis efficitur interdum</a></h2>

									<!-- Meta -->
									<div class="meta clearfix">

                                            <span>
                                  <img src="<%=request.getContextPath() %>/templates/public/img/icons/user.png" alt="author">posted by Admin,
                              </span>
                                            <span>
                                  <img src="<%=request.getContextPath() %>/templates/public/img/icons/ribbon.png" alt="author">
                                </span><span>in <a href="#">Technology</a>, <a href="#">Devices</a>.</span>

									</div>

									<!-- Content -->
									<p>
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus neque vitae felis efficitur interdum. Praesent quis auctor ipsum. Phasellus rhoncus tincidunt nunc vitae congue. Integer sodales diam tincidunt faucibus imperdiet. Integer ultricies varius volutpat. Phasellus nec rutrum nisi. Quisque imperdiet odio auctor mollis ultrices....
									</p>

									<!-- Read More -->
									<a href="#" class="btn continue">Read More</a>

								</div>

							</article>
							<!-- Post End -->

							<!-- Post Start -->
							<article class="post">

								<div class="main-info pull-left">
									<!-- Date -->
									<div class="date">
										<span class="month">Feb</span>
										<span class="day">21</span>
									</div>

									<!-- Comments Number -->
									<a href="#" class="commentsnumber">
										<span>7</span> comments
									</a>
								</div>

								<div class="post-content">

									<!-- Thumbnail -->
									<a href="#"><img src="<%=request.getContextPath() %>/templates/public/img/blog/blog-05.png" alt=""></a>

									<!-- Title -->
									<h2><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit. </a></h2>

									<!-- Meta -->
									<div class="meta clearfix">
										<img src="<%=request.getContextPath() %>/templates/public/img/icons/user.png" alt="author"><span>posted by Admin,</span>
										<img src="<%=request.getContextPath() %>/templates/public/img/icons/ribbon.png" alt="author"> <span>in <a href="#">Technology</a>, <a href="#">Devices</a>.</span>
									</div>

									<!-- Content -->
									<p>
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus neque vitae felis efficitur interdum. Praesent quis auctor ipsum. Phasellus rhoncus tincidunt nunc vitae congue. Integer sodales diam tincidunt faucibus imperdiet. Integer ultricies varius volutpat. Phasellus nec rutrum nisi. Quisque imperdiet odio auctor mollis ultrices. pro...
									</p>

									<!-- Read More -->
									<a href="#" class="btn continue">Read More</a>



								</div>




							</article>
							<!-- Post End -->
						</div>

					</div>
					<!-- /.row -->
					<div class="row">
						<div class="col-md-12">
							<div class="pagination_area pull-right">
								<nav>
									<ul class="pagination">
										<li>
											<a href="#" aria-label="Previous">
												<i class="fa fa-caret-left"></i>
											</a>
										</li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li>
											<a href="#" aria-label="Next">
												<i class="fa fa-caret-right"></i>
											</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
					</div>

				</div>

			</section>
			<!-- Blog / End
          ================================================== -->





		</div>
		<!-- /.life-style-blog -->
	</div>

</main>
<!-- end  main content -->

<!-- start footer area -->
<%@ include file="/templates/public/inc/footer.jsp" %>
</body>
</html>