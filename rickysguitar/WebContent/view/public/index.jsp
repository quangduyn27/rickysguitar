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
							<h3><a href="<%=request.getContextPath() %>/<%=StringUtil.makeSlug(productindex4.getCat().getName())%>/<%=StringUtil.makeSlug(productindex4.getName())%>-<%=productindex4.getId()%>.html"><%=productindex4.getName() %></a></h3>
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
					<ul class="list-inline">
						<li>
							<a class="active-filter" href="#" data-filter="*">All Products</a>
						</li>
						<li>
							<a href="#" data-filter=".filter-best">Best Selling</a>
						</li>
						<li>
							<a href="#" data-filter=".filter-featured">Featured</a>
						</li>
						<li>
							<a href="#" data-filter=".filter-sale">On Sale</a>
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
				ArrayList<Product>  listproduct = null;
				if(request.getAttribute("listproduct")!=null){
				  listproduct= (ArrayList<Product>)request.getAttribute("listproduct");
				if(listproduct.size()>0){
				for(Product productindex:listproduct ){
					String giaca = Integer.toString(productindex.getPrice());
					
				String price = giaca.replaceFirst("(\\d{4})(\\d{3})(\\d3)", "$1.$2.$3");
				ArrayList<String> listpicture1 = StringUtil.getFileName(productindex.getPicture());

				if(productindex.getSale()==0){
				%>
				<div class="col-xs-12 col-sm-6 col-md-3 product-item filter-best">
					<div class="product-img">
						<img style="width:250px; height: 290px;text-align:center;" src="<%=request.getContextPath() %>/files/<%=listpicture1.get(0) %>" alt="<%=productindex.getName() %>">
						<div class="product-hover">
							<div class="product-cart">
								<a class="btn btn-secondary btn-block" href="<%=request.getContextPath()%>/<%=StringUtil.makeSlug(productindex.getCat().getName())%>/<%=StringUtil.makeSlug(productindex.getName())%>-<%=productindex.getId()%>.html"><i class="fa fa-eye"></i> View</a>
								<%
							if(session.getAttribute("userLogin")!=null){
							%>
								<a class="btn btn-secondary btn-block" href="<%=request.getContextPath()%>/public-favorite?sid=<%=productindex.getId()%>"><i class="fa fa-thumbs-up"></i> Like</a>
								
								<%} %>
								<a class="btn btn-secondary btn-block" onclick=" getCart(<%=productindex.getId()%>)" href="javascript:void(0)"><i class="fa fa-shopping-cart"></i> Add To Cart</a>
							</div>
						</div>
					</div>
					<!-- .product-img end -->
					<div class="product-bio">
						<h4>
							<a href="<%=request.getContextPath()%>/public-detail?sid=<%=productindex.getId()%>"><%=productindex.getName() %></a>
						</h4>
						<p class="product-price"><%=price %> VND</p>
					</div>
				</div>
				<%
				}else{
				%>
				
				
				<div class="col-xs-12 col-sm-6 col-md-3 product-item filter-sale">
					<div class="product-img">
						<img style="width:250px; height: 290px;text-align:center;" src="<%=request.getContextPath() %>/files/<%=listpicture1.get(0) %>" alt="<%=productindex.getName() %>">
						<div class="product-hover">
							<div class="product-cart">
								<a class="btn btn-secondary btn-block" href="<%=request.getContextPath()%>/<%=StringUtil.makeSlug(productindex.getCat().getName())%>/<%=StringUtil.makeSlug(productindex.getName())%>-<%=productindex.getId()%>.html"><i class="fa fa-eye"></i> View</a>
								<%
							if(session.getAttribute("userLogin")!=null){
							%>
								<a class="btn btn-secondary btn-block" href="<%=request.getContextPath()%>/public-favorite?sid=<%=productindex.getId()%>"><i class="fa fa-thumbs-up"></i> Like</a>
								
								<%} %>
								<a class="btn btn-secondary btn-block" onclick=" getCart(<%=productindex.getId()%>)" href="javascript:void(0)"><i class="fa fa-shopping-cart"></i> Add To Cart</a>
							</div>
						</div>
					</div>
					<!-- .product-img end -->
					<div class="product-bio">
						<h4>
							<a href="<%=request.getContextPath()%>/<%=StringUtil.makeSlug(productindex.getCat().getName())%>/<%=StringUtil.makeSlug(productindex.getName())%>-<%=productindex.getId()%>.html"><%=productindex.getName() %></a>
						</h4>
						<p class="product-price"><%=price %> VND</p>
					</div>
				</div>
				<%}} }else{%>
				
					<span style="color:red"> Kh??ng c?? s???n ph???m.</span>
				<%}}%>
				<!-- all-product end here -->
				
				
				</div>
				<!-- shop ends here -->
					<!-- Ph??n trang-->
							<%
                               int currentPage = (int) request.getAttribute("currentpage");
                               int numberOfPages = (int) request.getAttribute("numberOfPages");
                               if(listproduct.size()>0){
                               %>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px"></div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
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
                                            
                                            	<a href="<%=request.getContextPath()%>/public-index?page=<%=pagePrevious%>">Previous</a>
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
                                                 <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-index?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-index?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-index?page=<%=i%>"><%=i %></a></li>
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
                                                       <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-index?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-index?page=<%=i%>"><%=i %></a></li>
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
                                                 <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-index?page=<%=i%>"><%=i %></a></li>
                                                 
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-index?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-index?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-index?page=<%=i%>"><%=i %></a></li>
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
                                            <a href="<%=request.getContextPath()%>/public-index?page=<%=pageNext%>">Next</a></li>
                                         <%} %>   
                                        </ul>
                                    </div>
                                </div>
                            </div>	
				
			
		</div>
		<!-- .container end -->
	</section>


	<!-- Start Our Shop Items -->

	<!-- recommend  items Starts -->
	<section id="recent-product">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="recent-items">

						<!-- Block heading two -->
						<div class="block-heading-two">
							<h3><span>Recommended Items</span></h3>
						</div>

						<!-- Owl carousel block starts -->
						<!-- Change values of data-items, data-auto-play, data-pagination & data-single-item based on your needs -->
						<div class="owl-carousel" data-items="5" data-auto-play="true" data-pagination="true" data-single-item="false">
							<!-- Carousel item -->
							<%
				if(request.getAttribute("listrecommend")!=null){
					@SuppressWarnings("unchecked")
					ArrayList<Product> listrecommend = (ArrayList<Product>) request.getAttribute("listrecommend");
					for(Product productrecommend: listrecommend){
						ArrayList<String> listpicture1 = StringUtil.getFileName(productrecommend.getPicture());

				%>
						<!-- Owl carousel block starts -->
						<!-- Change values of data-items, data-auto-play, data-pagination & data-single-item based on your needs -->
							<!-- Carousel item -->
							<div class="owl-content">
								<!-- Product Item #8 -->
								<div class=" product-item filter-best">
									<div class="product-img">
										<img height="250px" src="<%=request.getContextPath() %>/files/<%=listpicture1.get(0) %>" alt="product">
										<div class="product-hover">
											<div class="product-cart">
												<a class="btn btn-secondary btn-block" href="<%=request.getContextPath()%>/<%=StringUtil.makeSlug(productrecommend.getCat().getName())%>/<%=StringUtil.makeSlug(productrecommend.getName())%>-<%=productrecommend.getId()%>.html"><i class="fa fa-eye"></i> View</a>
													<%
												if(session.getAttribute("userLogin")!=null){
												%>
													<a class="btn btn-secondary btn-block" href="<%=request.getContextPath()%>/public-favorite?sid=<%=productrecommend.getId()%>"><i class="fa fa-thumbs-up"></i> Like</a>
													
													<%} %>
												<a class="btn btn-secondary btn-block" onclick="getCart(<%=productrecommend.getId() %>)" href="javascript:void(0)">Add To Cart</a>
											</div>
										</div>
									</div>
									<!-- .product-img end -->
									<div class="product-bio">
										<h4>
											<a href="<%=request.getContextPath()%>/public-detail?sid=<%=productrecommend.getId()%>"><%=productrecommend.getName() %></a>
										</h4>
										<p class="product-price"><%=productrecommend.getPrice() %></p>
									</div>
									<!-- .product-bio end -->
								</div>
								<!-- .product-item end -->
							</div>
						<%}} %>
							
							<div class="owl-content">
								<!-- Product Item #8 -->
								<div class="product-item filter-best">
									<div class="product-img">
										<img width="200px" src="<%=request.getContextPath() %>/templates/public/img/shop/index3_product5.png" alt="product">
										<div class="product-hover">
											<div class="product-cart">
												<a class="btn btn-secondary btn-block" href="#">Add To Cart</a>
											</div>
										</div>
									</div>
									<!-- .product-img end -->
									<div class="product-bio">
										<h4>
											<a href="#">Keson Fiberglass</a>
										</h4>
										<p class="product-price">$550.00</p>
									</div>
									<!-- .product-bio end -->

								</div>
								<!-- .product-item end -->
							</div>
						</div>
						<!-- Owl carousel block ends -->

					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- recommend items Ends -->

	<!-- End Our Shop Items -->

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
function getCart(idproduct) {
	$.ajax( {
        url:'<%=request.getContextPath()%>/public-cart',
        data : {
			aidproduct : idproduct,
		},
        success:function(data) {
           $('#itemquantity').html(data);
           alert("Th??m gi??? h??ng th??nh c??ng.");
        },
        error : function() {
			alert("???? c?? l???i trong qu?? tr??nh x??? l??.");
		}
     });

}
</script>

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