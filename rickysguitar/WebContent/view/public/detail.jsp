<%@page import="model.bean.rating"%>
<%@page import="utils.StringUtil"%>
<%@page import="model.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>

<!-- end header -->


<!-- start main content -->
<main class="main-container">
<section class="product_content_area pt-40">
	<!-- start of page content -->

	<div class="lookcare-product-single container">

		<div class="row">

			<div class="main col-xs-12" role="main">

				<div class=" product">

					<div class="row">

						<div class="col-md-5 col-sm-6 summary-before ">

							<%
							int reviews = (int) request.getAttribute("listreview");
							float productratingaverage = (Float) request.getAttribute("productratingaverage");
							Product productbyid = (Product) request.getAttribute("productbysid");
							ArrayList<String> listpicture1 = StringUtil.getFileName(productbyid.getPicture());

							%>
							<div class="product-slider product-shop">
								<span class="onsale">Sale!</span>
								<ul class="slides">
								<%
								for(String picture:listpicture1){
									
								%>
									<li data-thumb="<%=request.getContextPath() %>/files/<%=picture%>">
										<a href="<%=request.getContextPath() %>/files/<%=picture%>" data-imagelightbox="gallery" class="hoodie_7_front">
											<img  style="width:400px; height: 400px;" src="<%=request.getContextPath() %>/files/<%=picture%>" class="attachment-shop_single" alt="image">
										</a>
									</li>
								<%} %>
									

								</ul>
							</div>
						</div>

						<div class="col-sm-6 col-md-7 product-review entry-summary">

							<h1 class="product_title"><%=productbyid.getName() %></h1>

							<div class="woocommerce-product-rating">
								<div class="star-rating" title="Rated 4.00 out of 5">
								<input disabled="disabled" id="rating" name="rating" class="rating rating-loading" data-min="0" data-max="5" data-step="0.5" value="<%=productratingaverage%>">
								</div>
								<a href="#reviews" class="woocommerce-review-link">(<span class="count"><%=reviews %></span> customer reviews)</a>
							</div>

							<div>
								<p class="price"><del><span class="amount"><%=productbyid.getSale() %></span></del>
									<ins><span style="color:red" class="amount"><%=productbyid.getPrice() %> VND</span></ins></p>
							</div>

							<p><%=productbyid.getDetail() %></p>


							<form class="variations_form cart" action="">
 							<span class="sku_wrapper">Quantity:<span class="sku"></span>.</span>
							
								<div class="quantity">
									<button onclick="getQuantity(0)" type="button" class="cart-button" >-</button>
									 <span id="quantitydisplay"><input type="number" step="1" id="quantity" value="1" title="Qty" class="input-text qty text" size="4" min="1"></span> 
									<button onclick="getQuantity(1)" type="button" class="cart-button" >+</button>
								</div>

								<button  onclick="return getCart(<%=productbyid.getId() %>)" type="button" class="cart-button">Add to cart</button>
								
							</form>


							<div class="product_meta">



								<span class="sku_wrapper">View:  <%=productbyid.getView() %> <span class="sku"></span>.</span>


								<span class="posted_in">Categories: <a href="<%=request.getContextPath() %>/public-cat?cid=<%=productbyid.getCat().getId() %>" rel="tag"><%=productbyid.getCat().getName() %></a></span>


							</div>

							<div class="share-social-icons">

								<a href="#" target="_blank" title="Share on Facebook">
									<i class="fa fa-facebook"></i>
								</a>
								<a href="#" target="_blank" title="Share on Twitter">
									<i class="fa fa-twitter"></i>
								</a>
								<a href="#" target="_blank" title="Pin on Pinterest">
									<i class="fa fa-pinterest"></i>
								</a>
								<a href="#" target="_blank" title="Share on Google+">
									<i class="fa fa-google-plus"></i>
								</a>
							</div>

						</div>
						<!-- .summary -->

					</div>

					<div class="wrapper-description">

						<ul class="tabs-nav clearfix">
							<li class="active">Description</li>
							<li>Review</li>
						</ul>
						<div class="tabs-container product-comments">

							<div class="tab-content">
								<section class="related-products">


									<h3 class="section-title">Related Products</h3>

									<div class="related-products-wrapper">

										<div class="related-products-carousel">

											<div class="product-control-nav">
												<a class="prev"><i class="fa fa-angle-left"></i></a>
												<a class="next"><i class="fa fa-angle-right"></i></a>
											</div>

											<div class="products-top"></div>
											<div class="row product-listing">
												<div id="product-carousel" class="product-listing">


													<%
													if(request.getAttribute("listrandproduct")!=null){
													@SuppressWarnings("unchecked")
													ArrayList<Product> listrandproduct = (ArrayList<Product>) request.getAttribute("listrandproduct");
													if(listrandproduct.size() > 0){
														for(Product randproduct: listrandproduct){
															ArrayList<String> listpicture2 = StringUtil.getFileName(randproduct.getPicture());

													%>
													<div class="product  item first ">

														<article>


															<figure>
															<p id="demo"></p>
																<a href="<%=request.getContextPath() %>/public-detail?sid=<%=randproduct.getId()%>">
																	<img  style="width:300px; height: 250px;" src="<%=request.getContextPath() %>/files/<%=listpicture2.get(0) %>" class="img-responsive" alt="T_2_front">
																</a>
																<figcaption><span class="amount"><%=randproduct.getPrice() %></span></figcaption>
															</figure>

															<h4 class="title"><a href="<%=request.getContextPath() %>/public-detail?sid=<%=randproduct.getId()%>"><%=randproduct.getName()%></a></h4>


															<a href="javascript:void(0)" onclick="return getCart(<%=randproduct.getId() %>)"  class="button-add-to-cart">Add to cart</a>
														</article>

													</div>
												<%}}} %>
									
												</div>

											</div>
										</div>

									</div>

								</section>
							</div>



							<div class="tab-content">

								<div class="panel entry-content">

									<div id="reviews">
										<div class="row">
											<div class="col-md-6">
											<%
											if(request.getAttribute("listrating")!=null){
												@SuppressWarnings("unchecked")
												ArrayList<rating> listrating = (ArrayList<rating>) request.getAttribute("listrating");
												if(listrating.size()>0){
											%>
												<div id="comments">
													<ol id="commentlist">
													<%
													for(rating rating: listrating){
													%>
														<li class="comment depth-1">
															<div class="comment_container">
																<img alt="gravatar" src="<%=request.getContextPath() %>/templates/public/img/temp-images/Lara_Fabian_2012.jpeg" class="avatar photo">
																<div class="comment-text">
																	<p class="meta">
                                                                        <div class="container">
																	    <input disabled="disabled" id="ratinglist" name="ratinglist" class="rating rating-loading" data-min="0" data-max="5" data-step="0.5" value="<%=rating.getRating()%>">
 																   </div>
																		<strong><%=rating.getFullname() %></strong> – <time datetime="2013-06-07T13:03:29+00:00"><%=rating.getDatepost() %></time>:
																	</p>
																	<div class="description">
																		<p><%=rating.getContent() %></p>
																	</div>
																</div>
															</div>
														</li>
														<%}}else{ %>
															<h3>Chưa có đánh giá nào. Hãy là người đánh giá đầu tiên nào! </h3>
														
														<%}}%>
														<!-- #comment-## -->
													</ol>
												</div>

												</div>
											<div class="col-md-6">
												<div id="review_form_wrapper">
													<div id="review_form">
														<div id="respond" class="comment-respond">
															
															
															<%
															if(session.getAttribute("userLogin")!=null){
																User user = (User) session.getAttribute("userLogin");
															%>
															<h3 class="comment-reply-title">Add a review </h3>
															
															<form action="" class="comment-form" >
															
																 <div class="container">
																 <label>Đánh giá</label><br>
 																	    <input id="star" name="star" class="rating rating-loading" data-min="0" data-max="5" data-step="0.5" value="">
																	   </div>
																<p class="comment-form-comment"><label for="comment">Your Review</label>
																<textarea id="content"  cols="45" rows="8" aria-required="true"></textarea></p>
																<p class="form-submit">
																	<button  onclick="return getRating(<%=productbyid.getId()%>)" class="button-add-to-cart name="  >SUBMIT</button>
																</p>
															</form>
															<%}else{ %>
															
															<a href="<%=request.getContextPath()%>/public-login?sid=<%=productbyid.getId()%>"><h3 class="comment-reply-title">Sign in to post review !</h3></a>
															<%} %>
														</div>
														<!-- #respond -->
													</div>
												</div>
											</div>
										</div>

										<div class="clear"></div>
									</div>
								</div>
							</div>

						</div>

					</div>





				</div>
				<!-- #product-293 -->



			</div>
			<!-- end of main -->

		</div>
		<!-- end of .row -->

	</div>

	<!-- end of page content -->
</section>

<!-- service area -->
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
<!-- end service area -->
</main>
<!-- end main content -->
<%@ include file="/templates/public/inc/footer.jsp" %>
<script type="text/javascript">
	 	 function getCart(idproduct) {
			var quantity = $('#quantity').val();
			$.ajax( {
                url:'<%=request.getContextPath()%>/public-cart',
                type : 'get',
                data : {
					aidproduct : idproduct,
					aquantity : quantity
				},
                success:function(data) {
                   $('#itemquantity').html(data);
                   alert("Đã thêm vào giỏ hàng.");
                },
                error : function() {
					alert("Đã có lỗi trong quá trình xử lý.");
				}
             });

		};
	
		 function getRating(idproduct) {
			var content = $('#content').val();
			var star = $('#star').val();
			alert("Đã đăng bình luận.")
			$.ajax({
				url : '<%=request.getContextPath()%>/public-rating',
				type : 'POST',
				cache : false,	
				data : {
					astar :star,
					aidproduct : idproduct,
					acontent : content
				},
				success : function(data) {
					$('#commentlist').html(data);
					//alert("Comment thanh cong");
				},
				error : function() {
					alert("Đã có lỗi trong quá trình xử lý review.");
				}
			});
			return false; //return false để ko chạy action của form mà chạy onclick cùa button.	
		};
		 function getQuantity(trangthai) {
			 var quantity = $('#quantity').val();
			//alert(quantity);
			$.ajax({
				url : '<%=request.getContextPath()%>/public-detail',
				type : 'POST',
				cache : false,	
				data : {
					aquantity :quantity,
					atrangthai :trangthai
				},
				success : function(data) {
					$('#quantitydisplay').html(data);
					//alert("Comment thanh cong");
				},
				error : function() {
					alert("Đã có lỗi trong quá trình xử lý review.");
				}
			});

		};
		
	</script>
	
<script type="text/javascript">
	/*-----------------------------------------------------------------------------------*/
	/* Flex Slider
	 /*-----------------------------------------------------------------------------------*/
	/* if (jQuery().flexslider) {

		// Product Page Flex Slider
		$('.product-slider').flexslider({
			animation: "slide",
			animationLoop: false,
			slideshow: false,
			prevText: '<i class="fa fa-angle-left"></i>',
			nextText: '<i class="fa fa-angle-right"></i>',
			animationSpeed: 250,
			controlNav: "thumbnails"
		});

	}


	/*-----------------------------------------------------------------------------------*/
	/* Product Carousel
	 /*-----------------------------------------------------------------------------------*/
	if (jQuery().owlCarousel) {
		var productCarousel = $("#product-carousel");
		productCarousel.owlCarousel({
			loop: true,
			dots: false,
			responsive: {
				0: {
					items: 1
				},
				480: {
					items: 2
				},
				900: {
					items: 3
				},
				1100: {
					items: 4
				}
			}
		});

		// Custom Navigation Events
		$(".product-control-nav .next").on("click", function() {
			productCarousel.trigger('next.owl.carousel');
		});

		$(".product-control-nav .prev").on("click", function() {
			productCarousel.trigger('prev.owl.carousel');
		});
	}



	$(function() {
		var $tabsNav = $('.tabs-nav'),
				$tabsNavLis = $tabsNav.children('li');

		$tabsNav.each(function() {
			var $this = $(this);
			$this.next().children('.tab-content').stop(true, true).hide()
					.first().show();
			$this.children('li').first().addClass('active').stop(true, true).show();
		});

		$tabsNavLis.on('click', function(e) {
			var $this = $(this);
			$this.siblings().removeClass('active').end()
					.addClass('active');
			var idx = $this.parent().children().index($this);
			$this.parent().next().children('.tab-content').stop(true, true).hide().eq(idx).fadeIn();
			e.preventDefault();
		});

	});


	$('.footer .tabbed .tabs li:first-child, .tabbed .tabs li:first-child').addClass('current');
	$('.footer .block:first, .tabbed .block:first').addClass('current');


	$('.tabbed .tabs li').on("click", function() {
		var $this = $(this);
		var tabNumber = $this.index();

		$this.siblings('li').removeClass('current');
		$this.addClass('current');

		$this.parent('ul').siblings('.block').removeClass('current');
		$this.closest('.tabbed').children('.block:eq(' + tabNumber + ')').addClass('current');
	});



	if (jQuery().imageLightbox) {


		var activityIndicatorOn = function() {
					$('<div id="imagelightbox-loading"><div></div></div>').appendTo('body');
				},
				activityIndicatorOff = function() {
					$('#imagelightbox-loading').remove();
				},


		// OVERLAY

				overlayOn = function() {
					$('<div id="imagelightbox-overlay"></div>').appendTo('body');
				},
				overlayOff = function() {
					$('#imagelightbox-overlay').remove();
				},


		// CLOSE BUTTON

				closeButtonOn = function(instance) {
					$('<button type="button" id="imagelightbox-close" title="Close"></button>').appendTo('body').on('click touchend', function() {
						$(this).remove();
						instance.quitImageLightbox();
						return false;
					});
				},
				closeButtonOff = function() {
					$('#imagelightbox-close').remove();
				},

		// ARROWS

				arrowsOn = function(instance, selector) {
					var $arrows = $('<button type="button" class="imagelightbox-arrow imagelightbox-arrow-left"></button><button type="button" class="imagelightbox-arrow imagelightbox-arrow-right"></button>');

					$arrows.appendTo('body');

					$arrows.on('click touchend', function(e) {
						e.preventDefault();

						var $this = $(this),
								$target = $(selector + '[href="' + $('#imagelightbox').attr('src') + '"]'),
								index = $target.index(selector);

						if ($this.hasClass('imagelightbox-arrow-left')) {
							index = index - 1;
							if (!$(selector).eq(index).length)
								index = $(selector).length;
						} else {
							index = index + 1;
							if (!$(selector).eq(index).length)
								index = 0;
						}

						instance.switchImageLightbox(index);
						return false;
					});
				},
				arrowsOff = function() {
					$('.imagelightbox-arrow').remove();
				};

		// Lightbox for individual image
		var lightboxInstance = $('a[data-imagelightbox="lightbox"]').imageLightbox({
			onStart: function() {
				overlayOn();
				closeButtonOn(lightboxInstance);
			},
			onEnd: function() {
				closeButtonOff();
				overlayOff();
				activityIndicatorOff();
			},
			onLoadStart: function() {
				activityIndicatorOn();
			},
			onLoadEnd: function() {
				activityIndicatorOff();
			}
		});

		// Lightbox for product gallery
		var gallerySelector = 'a[data-imagelightbox="gallery"]';
		var galleryInstance = $(gallerySelector).imageLightbox({
			quitOnDocClick: false,
			onStart: function() {
				overlayOn();
				closeButtonOn(galleryInstance);
				arrowsOn(galleryInstance, gallerySelector);
			},
			onEnd: function() {
				overlayOff();
				closeButtonOff();
				arrowsOff();
				activityIndicatorOff();
			},
			onLoadStart: function() {
				activityIndicatorOn();
			},
			onLoadEnd: function() {
				activityIndicatorOff();
				$('.imagelightbox-arrow').css('display', 'block');
			}
		});

	}
 


</script>
	
<!-- <script type="text/javascript">
	CKEDITOR.replace('content');
</script> -->
<!-- <script type="text/javascript">
		$(document).ready(function() {
			$('#commentform').validate({
				rules : {
					"content" : {
						required : true,
					},
				},
				messages : {
					"content" : {
						required : "Vui lòng nhập chi tiết",
					},
				}
			});
		});
</script> -->

<!-- start footer area -->

</body>
</html>
