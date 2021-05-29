<%@page import="utils.StringUtil"%>
<%@page import="model.bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<!-- end header -->

<!-- start main content -->
<main class="main-container">

	<!-- new collection directory -->
	<section class="block no-padding">


					<div class="main-slider overlape">
						<div id="full-slider-wrapper">
							<div id="layerslider" style="width:100%;height:450px; ">

								<div class="ls-slide" data-ls="transition3d:all; timeshift:-1000; slidedelay: 7000;">

									<img  src="<%=request.getContextPath() %>/templates/public/img/guitar-wallpaper-147-154-hd-wallpapers.jpeg" class="ls-bg" alt="Slide background"/>

									<div class="ls-slide" style=" font-size:45px; font-weight:900; top:175px; left:30px; text-transform:uppercase; color:#ffffff;" data-ls="easingin:easeOutBack;  delayin:2000; rotatexin:90; durationin:2000;">top brands 2021</div>

									<div class="ls-slide" style=" font-size:14px; top:230px; left:70px; color:#ffffff;" data-ls="easingin:easeOutExpo; delayin:2500; rotatexin:90; durationin:2000;">Hi, let's find out exclusive deal in Ricky's Guitar</div>

									<a href="#" title="" class="ls-slide bg-color" style="padding:11px 13px; color:#ffffff; border-radius:3px; font-family:Lato; font-size:13px; top:270px; left:135px;" data-ls="easingin:easeOutBack; delayin:2000; offsetxin:bottom; rotatexin:90; durationin:2000;">More Know</a>

									<a href="#" title="" class="ls-slide text-color border-color" style="padding:9px 13px; border-radius:3px; border:2px solid #ffffff; color: #ffffff;  font-size:13px; top:270px; left:235px;" data-ls="easingin:easeOutBack; delayin:2500; offsetxin:bottom; rotatexin:90; durationin:2000;">Buy Now</a>

								</div>
								<!-- Slide 1 -->

								<div class="ls-slide" data-ls="transition3d:all; timeshift:-1000; slidedelay: 7000;">

									<img  src="<%=request.getContextPath() %>/templates/public/img/2589217.jpg" class="ls-bg" alt="Slide background"/>

									<i class="ls-slide fa fa-shopping-bag " style=" font-family:fontawesome; font-size:220px; color:#e9e9eb; top:100px; left:800px;" data-ls="easingin:easeOutBack; delayin:500; offsetxin:right; durationin:2000;"></i>

									<div class="ls-slide" style=" font-size:15px; font-weight:300; color:#333333; letter-spacing:3px; top:180px; font-style:italic; left:750px;" data-ls="easingin:easeOutBack; delayin:1000; offsetxin:top; scalexin:1.3; durationin:2000;">Hi, let's find out exclusive deal in Ricky's Guitar</div>

									<h4 class="ls-slide" style="font-size:40px;  font-weight:900; top:205px; text-transform:uppercase; left:660px; color:#1c1c1c;" data-ls="easingin:easeOutElastic; offsetxin:-100px; rotatexin:90; delayin:1500; durationin:2000;">Amazing Online store</h4>

									<a href="#" title="" class="ls-slide bg-color" style="padding:11px 13px; color:#ffffff; border-radius:3px; font-family:Lato; font-size:13px; top:280px; left:817px;" data-ls="easingin:easeOutBack; delayin:2000; offsetxin:bottom; rotatexin:90; durationin:2000;">More Know</a>

									<a href="#" title="" class="ls-slide" style="padding:9px 13px; color:#333333; border-radius:3px; border:2px solid #555555; font-family:Lato; font-size:13px; top:280px; left:917px;" data-ls="easingin:easeOutBack; delayin:2500; offsetxin:bottom; rotatexin:90; durationin:2000;">Buy Now</a>
								</div>
								<!-- Slide 2 -->

								<div class="ls-slide" data-ls="transition3d:all; timeshift:-1000; slidedelay: 6000;">

									<img  src="<%=request.getContextPath() %>/templates/public/img/1078883.jpg" class="ls-bg" alt="Slide background"/>

									<div class="ls-slde" style="color:#333333; font-family:lato; font-size:15px; font-weight:300; top:160px; left:50px; text-transform:uppercase;" data-ls="rotatexin:90; offsetxin:0; delayin:1000; easingin:easeOutElastic; fadein:false; fadeout:false; durationin:2000;">Great Collection</div>

									<div class="ls-slide" style=" font-size:40px; font-weight:900; top:180px; left:50px; text-transform:uppercase; color:#ffffff;" data-ls="rotateyin:45; offsetyin:100px; delayin:1500; easingin:easeOutExpo; durationin:2000;">top brands 2021</div>

									<div class="ls-slide bg-color" style=" top:225px; left:50px; font-size:13px; text-transform:uppercase; color:#ffffff; padding:5px 20px;" data-ls="offsetyin:left; easingin:easeOutElastic; delayin:2000; durationin:2000;">Smarter Shopping,Better Living!</div>
								</div>
								<!-- Slide 3 -->

							</div>
						</div>
					</div><!-- Main Slider -->


	</section>

	<section class="block gray no-padding">
		<!-- prefooter -->
		<div class="lookcare-slider-bottom-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-xs-6 look-offer">
						<div class="offer-details">
							<h3>Sale up to 40%</h3>
							<p>Vivamus consequat, felis at aliquam elementum</p>
							<a href="#" class="btn btn-min btn-solid">Take a Look</a>
						</div>
					</div>
					<%
				if(request.getAttribute("listproduct3")!=null){
					@SuppressWarnings("unchecked")
				ArrayList<Product> listproduct4= (ArrayList<Product>)request.getAttribute("listproduct3");
					for(Product productindex4:listproduct4 ){
						ArrayList<String> listpicture = StringUtil.getFileName(productindex4.getPicture());

					%>
					
					<div class="col-md-3 col-xs-6 helix-product clearfix">
						<div class="img-wrapper">
							<img style="width:180px; height:150px;" src="<%=request.getContextPath() %>/files/<%=listpicture.get(0) %>" alt="" class="img-responsive">
						</div>
						<div class="product-detail">
							<h3><a href="<%=request.getContextPath()%><%=StringUtil.makeSlug(productindex4.getCat().getName())%>/<%=StringUtil.makeSlug(productindex4.getName())%>-<%=productindex4.getId()%>.html"><%=productindex4.getName() %></a></h3>
							<h4><%=productindex4.getPrice() %> VND</h4>
							<a href="#" class="link-btn">Shop Now<i class="ion-arrow-right-c"></i></a>
						</div>
					</div>
					<%}} %>
				</div>
			</div>
		</div>
	</section>
	<!-- end new collection directory -->





	<!-- Shop Filter
    ============================================= -->
	<section id="shop" class="shop-4 pt-0">
		<div class="container">
			<div class="row">
				<!-- Projects Filter
                ============================================= -->
				<div class="col-xs-12 col-sm-12 col-md-12 shop-filter">
				<%
				Cat cat = (Cat) request.getAttribute("cat");
				%>
					<ul class="list-inline">
						<li>
							<a class="active-filter" href="<%=request.getContextPath() %>/public-cat?cid=<%=cat.getId() %>" data-filter="*"><%=cat.getName() %></a>
						</li>
					</ul>
				</div>
				<!-- .projects-filter end -->
			</div>
			<!-- .row end -->
			<!-- Projects Item
            ============================================= -->
			<div id="shop-all" class="row">
				<!-- Product Item #1 -->
				<%
				if(request.getAttribute("listproductbycid")!=null){
					@SuppressWarnings("unchecked")
				ArrayList<Product> listproductbycid= (ArrayList<Product>)request.getAttribute("listproductbycid");
				if(listproductbycid.size()>0){
				for(Product productbycid:listproductbycid ){
					String giaca = Integer.toString(productbycid.getPrice());
					
				String price = giaca.replaceFirst("(\\d{4})(\\d{3})(\\d+)", ".");
				ArrayList<String> listpicture1 = StringUtil.getFileName(productbycid.getPicture());

				%>
				<div class="col-xs-12 col-sm-6 col-md-3 product-item filter-best">
					<div class="product-img">
						<img style="width:250px; height: 290px;text-align:center;" src="<%=request.getContextPath() %>/files/<%=listpicture1.get(0) %>" alt="<%=productbycid.getName() %>">
						<div class="product-hover">
							<div class="product-cart">
								<a class="btn btn-secondary btn-block" href="<%=request.getContextPath()%>/<%=StringUtil.makeSlug(productbycid.getCat().getName())%>/<%=StringUtil.makeSlug(productbycid.getName())%>-<%=productbycid.getId()%>.html"><i class="fa fa-eye"></i> View</a>
							<%
							if(session.getAttribute("userLogin")!=null){
							%>
								<a class="btn btn-secondary btn-block" href="<%=request.getContextPath()%>/public-favorite?sid=<%=productbycid.getId()%>"><i class="fa fa-thumbs-up"></i> Like</a>
								
								<%} %>
								<a class="btn btn-secondary btn-block" href="#">Add To Cart</a>
							</div>
						</div>
					</div>
					<!-- .product-img end -->
					<div class="product-bio">
						<h4>
							<a href="<%=request.getContextPath()%>/<%=StringUtil.makeSlug(productbycid.getCat().getName())%>/<%=StringUtil.makeSlug(productbycid.getName())%>-<%=productbycid.getId()%>.html"><%=productbycid.getName() %></a>
							
						</h4>
						<p class="product-price"><%=price %> VND</p>
					</div>
					<!-- .product-bio end -->

				</div>
				<%}}else{%>
				
				<p style="text-align: center">Không có sản phẩm </p>
				<%} }%>
				<!-- .product-item end -->

				<!-- Product Item #2 -->
				<!-- .product-item end -->
			</div>
			<!-- .row end -->
		<%-- 	<%
			if(request.getAttribute("more1")!=null){
			%>
							 <%	
                               int currentPage = (Integer) request.getAttribute("currentPage");
                               int numberOfPages = (Integer) request.getAttribute("numberOfPages");
                               %>		
			
								<div class="shopping-pagination">
							       <ul class="pagination pull-right">
                                               <%
                                        String active, disabled= "";
                                        int pagePrevious = currentPage - 1;
                                           if (currentPage == 1) {
                                          pagePrevious = currentPage;
                                          disabled ="disabled";
                                           }
                                          %>
                                        
                                            <li class="paginate_button previous <%=disabled %>" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                                            
                                            	<a href="<%=request.getContextPath()%>/admin-contact?page=<%=pagePrevious%>">Trang trước</a>
                                            </li>
                                            <%
                                            if(numberOfPages<8){
                                            	 for(int i =1; i<=numberOfPages; i++){
                                                 	if(currentPage==i){
                                                 	active = "active";
                                                 	}else{
                                                 	active = "";
                                                 	}
                                                 %>
                                                 <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-contact?page=<%=i%>"><%=i %></a></li>
     											<%} 
                                            }
                                            
                                      if(numberOfPages >=8){
                                          	 if(currentPage <4){
                                            for(int i =1; i<=4; i++){
                                            	if(currentPage==i){
                                            	active = "active";
                                            	}else{
                                            	active = "";
                                            	}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-contact?page=<%=i%>"><%=i %></a></li>
											<%} 
                                            %>
											 <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="">...</a></li>

                                            <%
                                            for(int i = numberOfPages-1 ; i<=numberOfPages; i++){
                                            	if(currentPage==i){
                                            	active = "active";
                                            	}else{
                                            	active = "";
                                            	}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-contact?page=<%=i%>"><%=i %></a></li>
											<%} 
                                           		}%>
                                            <%
                                            if(currentPage >= 4 && currentPage <= numberOfPages-3){
                                            	
                                            	if(currentPage >= numberOfPages/2 && currentPage <= (numberOfPages/2 + 1)){
                                                       for(int i =1; i<=2; i++){
                                                       	if(currentPage==i){
                                                       	active = "active";
                                                       	}else{
                                                       	active = "";
                                                       	}
                                                       %>
                                                       <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-contact?page=<%=i%>"><%=i %></a></li>
           											<%}%> 	
       											<li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="">...</a></li>
           											
                                                 <%      
                                    	        for(int i =currentPage-1; i<=currentPage+1; i++){
                                            	if(currentPage==i){
                                            	active = "active";
                                            	}else{
                                            	active = "";
                                            	}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-contact?page=<%=i%>"><%=i %></a></li>
											<%}%>
											<li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="">...</a></li>
											
											<%
											for(int i = numberOfPages-1; i<= numberOfPages; i++){
                                                 	if(currentPage==i){
                                                 	active = "active";
                                                 	}else{
                                                 	active = "";
                                                 	}
                                                 %>
                                                 <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-contact?page=<%=i%>"><%=i %></a></li>
                                                 
     									<%}}else{%>
     											<li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="">...</a></li>

     										<%
                                    	        for(int i =currentPage-2; i<=currentPage+2; i++){
                                            	if(currentPage==i){
                                            	active = "active";
                                            	}else{
                                            	active = "";
                                            	}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-contact?page=<%=i%>"><%=i %></a></li>
											<%}%>
											
                                            <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="">...</a></li>
                                            
                                           <%}} %>
											
                                            <%
                                            if (currentPage > numberOfPages-3 ){
                                            %>
                                            
                                            <%
                                            for(int i =1; i<=2; i++){
                                            	if(currentPage==i){
                                            	active = "active";
                                            	}else{
                                            	active = "";
                                            	}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-contact?page=<%=i%>"><%=i %></a></li>
											<%} 
                                            %>
                                             <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="">...</a></li>
                                            
                                            <%
                                            for(int i = currentPage-2; i<=numberOfPages; i++){
                                            	if(currentPage==i){
                                            	active = "active";
                                            	}else{
                                            	active = "";
                                            	}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-contact?page=<%=i%>"><%=i %></a></li>
											<%}}} %>
                                          
                                            	<%
                                            		int pageNext = currentPage + 1;
													 disabled= "";
                                            		if(currentPage == numberOfPages) {
                                            			pageNext = currentPage;
                                            			disabled = "disabled";
                                            		}
                                            	%>
                                            <li class="paginate_button next <%=disabled %>" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                            <a href="<%=request.getContextPath()%>/admin-contact?page=<%=pageNext%>">Trang tiếp</a></li>
                                         <%} %>   
                                        </ul>
                                    </div> --%>
			
								<!-- <div class="shopping-pagination">
									<ul class="pagination pull-right">
										<li class="disabled"><a href="#">&laquo;</a></li>
										<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clearfix"></div>
								</div>
			 -->
			
				<!-- .col-md-12 end -->
			</div>
	</section>


	<!-- End Our Clients  -->


	<section class="block gray no-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content-box no-margin go-simple">
						<div class="mini-service-sec">
							<div class="row">
								<div class="col-md-3">
									<div class="mini-service">
										<i  class="fa fa-paper-plane"></i>
										<div class="mini-service-info">
											<h3>Worldwide Delivery</h3>
											<p>unc tincidunt, on cursusau gmetus, lorem Hore</p>
										</div>
									</div><!-- Mini Service -->
								</div>
								<div class="col-md-3">
									<div class="mini-service">
										<i  class="fa  fa-newspaper-o"></i>
										<div class="mini-service-info">
											<h3>Worldwide Delivery</h3>
											<p>unc tincidunt, on cursusa ugmetus, lorem Hore</p>
										</div>
									</div><!-- Mini Service -->
								</div>
								<div class="col-md-3">
									<div class="mini-service">
										<i  class="fa fa-medkit"></i>
										<div class="mini-service-info">
											<h3>Friendly Stuff</h3>
											<p>unc tincidunt, on cursusau gmetus, lorem Hore</p>
										</div>
									</div><!-- Mini Service -->
								</div>
								<div class="col-md-3">
									<div class="mini-service">
										<i  class="fa  fa-newspaper-o"></i>
										<div class="mini-service-info">
											<h3>24/h Support</h3>
											<p>unc tincidunt, on cursusa ugmetus, lorem Hore</p>
										</div>
									</div><!-- Mini Service -->
								</div>
							</div>
						</div><!-- Mini Service Sec -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="clearfix"></div>

</main>
<!-- end main content -->





<!-- start footer area -->
<%@ include file="/templates/public/inc/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {

		"use strict";

		//** Slider  **//
		jQuery("#layerslider").layerSlider({
			responsive: true,
			responsiveUnder: 1170,
			layersContainer: 1170,
			skin: 'v5',
			hoverPrevNext: true,
			navPrevNext: true,
			navStartStop: false,
			navButtons: false,
			skinsPath: 'layerslider/skins/'
		});


		/*=================== Parallax ===================*/
		$('.parallax').scrolly({bgParallax: true});


		/* Owl carousel */
		$(".owl-carousel").owlCarousel({
			slideSpeed : 500,
			rewindSpeed : 1000,
			mouseDrag : true,
			stopOnHover : true
		});
		/* Own navigation */
		$(".owl-nav-prev").click(function(){
			$(this).parent().next(".owl-carousel").trigger('owl.prev');
		});
		$(".owl-nav-next").click(function(){
			$(this).parent().next(".owl-carousel").trigger('owl.next');
		});


	});
</script>



</body>


</html>