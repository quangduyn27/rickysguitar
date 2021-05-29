<%@page import="utils.StringUtil"%>
<%@page import="model.bean.Product"%>
<%@page import="model.bean.User"%>
<%@page import="model.bean.Cat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Single Product | LookCare</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Fav icon -->
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/templates/public/img/favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Lato:400,400italic,900,700,700italic,300' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700%7CDancing+Script%7CMontserrat:400,700%7CMerriweather:400,300italic%7CLato:400,700,900' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Cantata+One' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700,600' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu:400,300,500,700' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/bootstrap.min.css">

		<link href="<%=request.getContextPath() %>/templates/public/css/magnific-popup.css" rel="stylesheet"> 
	
	<!--flex slider stylesheet-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/flexslider.css" />
	<!--lightbox stylesheet-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/image-light-box.css" />


	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/skin-lblue.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/normalize.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/skin-lblue.css">
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/ecommerce.css">

	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/layerslider/css/layerslider.css" type="text/css"><!-- Layer Slider -->
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/owl.carousel.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/main.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/rating/rating.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/revolutionslider_settings.css" media="screen" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/setting.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/public/css/responsive.css">
	<script src="<%=request.getContextPath() %>/templates/public/js/vendor/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/rating/rating.js"></script>
	<script src="https://www.paypalobjects.com/api/checkout.js"></script>
	
	
</head>

<body class="body">
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->


<!-- Start Loading -->
<section class="loading-overlay">
	<div class="Loading-Page">
		<h1 class="loader">Loading...</h1>
	</div>
</section>
<!-- End Loading  -->

<!-- start header -->
<header>
	<!-- Top bar starts -->
	<div class="top-bar">
		<div class="container">

			<!-- Contact starts -->
			<div class="tb-contact pull-left">
				<!-- Email -->
				<i class="fa fa-envelope color"></i> &nbsp; <a href="mailto:contact@domain.com">contact@domain.com</a>
				&nbsp;&nbsp;
				<!-- Phone -->
				<i class="fa fa-phone color"></i> &nbsp; +1 (342)-(323)-4923
				
			</div>
			<!-- Contact ends -->

			<!-- Shopping kart starts -->
			<div id="itemquantity" class="tb-shopping-cart pull-right">
				<!-- Link with badge -->
				<%
				
				if(session.getAttribute("listcart")!= null){
					 @SuppressWarnings("unchecked")
					 ArrayList<Product> listproductcart = (ArrayList<Product>) session.getAttribute("listcart");
				
				%>
			
				<a href="<%=request.getContextPath() %>/public-checkout" class="btn btn-white btn-xs b-dropdown"><i class="fa fa-shopping-cart"></i> <i class="fa fa-angle-down color"></i> <span id="cartquantity" class="badge badge-color"><%=listproductcart.size()%></span></a>
				<div  class="b-dropdown-block">
					<h4><i class="fa fa-shopping-cart color"></i> Your Items</h4>
					<ul id="cartitem" class="list-unstyled">
					<%
					for(Product productcart: listproductcart){
						ArrayList<String> listpicture = StringUtil.getFileName(productcart.getPicture());
					%>
					
						<li>
							<div class="cart-img">
								<a href="<%=request.getContextPath()%>/public-detail?sid=<%=productcart.getId()%>"><img src="<%=request.getContextPath() %>/files/<%=listpicture.get(0) %>" alt="" class="img-responsive" /></a>
							</div>
							<div class="cart-title">
								<h5><a href="<%=request.getContextPath()%>/public-detail?sid=<%=productcart.getId()%>"><%=productcart.getName()%></a></h5>
								<span class="label label-color label-sm"><%=productcart.getPrice() %></span>
							</div>
							<div class="clearfix"></div>
						</li>
						<%}%>
					</ul>
					<a href="<%=request.getContextPath() %>/public-cart2" class="btn btn-white btn-sm">View Cart</a> &nbsp; 
					 <a href="<%=request.getContextPath() %>/public-checkout" class="btn btn-color btn-sm">Checkout</a>
					
				</div>
				<%}else{ %>
				<a href="#" class="btn btn-white btn-xs b-dropdown"><i class="fa fa-shopping-cart"></i> <i class="fa fa-angle-down color"></i> <span id="cartquantity" class="badge badge-color">0</span></a>
				<div  class="b-dropdown-block">
					<h4><i class="fa fa-shopping-cart color"></i> Your Items</h4>
						<span>Chưa có sản phẩm nào.</span> 
				</div>
				<%} %>
			</div>
			
			<!-- Shopping kart ends -->

			<!-- Langauge starts -->
			<div class="tb-language dropdown pull-right">
			<%
			if(session.getAttribute("userLogin")!=null){
				User user = (User) session.getAttribute("userLogin");
			%>
			<div>
				<span style="color:white">Welcome!  <%=user.getFullname() %>  </span>
				</div>
			<%} %>
			</div>
			<!-- Language ends -->

			<!-- Search section for responsive design -->
			<div class="tb-search pull-left">
				<a href="#" class="b-dropdown"><i class="fa fa-search square-2 rounded-1 bg-color white"></i></a>
				<div class="b-dropdown-block">
					<form>
						<!-- Input Group -->
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Type Something">
									<span class="input-group-btn">
										<button class="btn btn-color" type="button">Search</button>
									</span>
						</div>
					</form>
				</div>
			</div>
			<!-- Search section ends -->

			<!-- Social media starts -->
			<div class="tb-social pull-right">
				<div class="brand-bg text-right">
					<!-- Brand Icons -->
					<a href="#" class="facebook"><i class="fa fa-facebook square-2 rounded-1"></i></a>
					<a href="#" class="twitter"><i class="fa fa-twitter square-2 rounded-1"></i></a>
					<a href="#" class="google-plus"><i class="fa fa-google-plus square-2 rounded-1"></i></a>
				</div>
			</div>
			<!-- Social media ends -->

			<div class="clearfix"></div>
		</div>
	</div>

	<!-- Top bar ends -->

	<!-- Header One Starts -->
	<div class="header-1">

		<!-- Container -->
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<!-- Logo section -->
					<div class="logo">
						<h1><a href="<%=request.getContextPath() %>/public-index"><img width="90px" alt="" src="<%=request.getContextPath() %>/templates/public/img/RG.png">  Ricky's Guitar</a></h1>
					</div>
				</div>
				<div class="col-md-6 col-md-offset-2 col-sm-5 col-sm-offset-3 hidden-xs">
					<!-- Search Form -->
					
					<div class="header-search">
					<form action="<%=request.getContextPath()%>/public-index" method="get">
							<div>
								<select name="category" class="form-control">
									<option value="0">All categories</option>
									<%
									/* String search = "";
									if (request.getAttribute("search") != null) {
										search = (String) request.getAttribute("search");
									} */
									CatDAO catDaoSearch = new CatDAO();
									ArrayList<Cat> listcatsearch = catDaoSearch.getCatListHeader();
									for (Cat cat : listcatsearch) {
									%>
									<option value="<%=cat.getId()%>"
										<%if (request.getAttribute("category") != null && (cat.getId() == (Integer) request.getAttribute("category"))) {
												out.print("selected");
											}%>>
										<%=cat.getName()%></option>
									<%
									}
									%>
								</select> 
							</div>
						
							<!-- Input Group -->
							<div class="input-group">
								<input name="timkiem" value="${search }" type="text" class="form-control" placeholder="Type Something">
										<span class="input-group-btn">
											<button type="submit" name="submit"  class="btn btn-color">Search</button>
										</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Navigation starts -->

		<div class="navi">
			<div class="container">
				<div class="navy">
					<ul>
						<!-- Main menu -->
						<li><a href="<%=request.getContextPath()%>/public-index">Home</a></li>

						
						<li><a href="#">Category</a>
						<ul>
						<%
						CatDAO catDao = new CatDAO();
						ArrayList<Cat> listcatparent = catDao.getCatList();
						for(Cat cat: listcatparent){
						%>
						<li><a href="<%=request.getContextPath()%>/<%=StringUtil.makeSlug(cat.getName())%>-<%=cat.getId()%>"><%=cat.getName() %></a>
						<%
						catDao.CreateChildMenu(cat.getId(), out, request);
						}
						%>
						</ul>
						</li>
									
						<li><a href="#">Blog</a>
							<ul>
								<li><a href="blog.html"><span>Blog Default</span></a></li>
								<li><a href="blog-masonry.html"><span>Blog Masonry</span></a></li>
								<li><a href="blog-full-width.html"><span>Blog Full Width</span></a></li>
								<li><a href="single-post.html"><span>Single Page 1</span></a></li>
								<li><a href="single-post-v2.html"><span>Single Page 2</span></a></li>
							</ul>
						</li>

						<li><a href="<%=request.getContextPath()%>/view/public/about.jsp">About Us</a></li>
						<li><a href="<%=request.getContextPath()%>/public-contact">Contact Us</a></li>
						<%
							if(session.getAttribute("userLogin")==null){
							%>
						<li><a href="<%=request.getContextPath()%>/public-login">Sign in</a></li>
						<%}else{ %>
						
						<li><a href="<%=request.getContextPath()%>/public-favorite">Wishlist</a></li>
						<li><a href="<%=request.getContextPath()%>/public-logout">Sign out</a></li>
						
						<%} %>
					</ul>
				</div>
			</div>
		</div>

		<!-- Navigation ends -->

	</div>

	<!-- Header one ends -->

</header>