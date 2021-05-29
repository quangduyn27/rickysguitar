<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<!-- end header -->

<!-- start main content -->
<main class="main-container">
<!--Checkout Area Start-->
<section class="checkout-area area-padding ptb-40">
	<!-- Begin checkout -->
	<div class="ld-subpage-content">

		<div class="checkout-content">

			<!-- Begin checkout section -->
			<section class="checkout">



				<section class="checkout-section">

					<div class="ld-checkout-inner">

						<div class="xs-margin"></div>

						<div class="accordion" id="collapse">

							<div class="accordion-group panel darkerbg">
							

								<div class="container">
									<h2 class="accordion-title">
									${success }

                <span>1. Billing Informations
                </span> <a class="accordion-btn open" data-toggle="collapse" href="#collapse-two"></a></h2>

									<div class="accordion-body collapse in" id="collapse-two">

										<div class="row accordion-body-wrapper">

											<form action="<%=request.getContextPath()%>/public-checkout" method="post">

												<div class="col-sm-6 padding-right-md">
													<h3 class="subtitle">Your Personal Details</h3>

													<div class="xs-margin half">
													</div>

													<div class="form-group">
														<label for="name" class="form-label">Enter your first name

                                                                <span class="required">*
                </span>
														</label>
														<input type="text" name="name" id="name" class="form-control input-lg" required>
													</div>

													<div class="form-group">
														<label for="email" class="form-label">Enter your e-mail

                                                                <span class="required">*
                </span>
														</label>
														<input type="email" name="email" id="email" class="form-control input-lg" required>
													</div>

													<div class="form-group">
														<label for="telephone" class="form-label">Enter your telephone

                                                                <span class="required">*
                </span>
														</label>
														<input type="text" name="telephone" id="phone" class="form-control input-lg" required>
													</div>
													
													
													<div>
													<%
													if(session.getAttribute("listcart")!=null){
														@SuppressWarnings("unchecked")
														ArrayList<Product> listpr = (ArrayList<Product>)session.getAttribute("listcart");
													%>
													
													
													<table class="table checkout-table">
													<thead>
													<tr>
														<th class="table-title">Product Name
														</th>
														<th class="table-title">Product Code
														</th>
														<th class="table-title">Unit Price
														</th>
														<th class="table-title">Quantity
														</th>
														<th class="table-title">SubTotal
														</th>
														<th>

                                                                    <span class="close-button disabled">
                </span>
														</th>
													</tr>
													</thead>
											
													<tbody>
													<%
													int thanhtien=0;
														for(Product productcart: listpr){
															thanhtien += (productcart.getQuantity() * productcart.getPrice());
															ArrayList<String> listpicture2 = StringUtil.getFileName(productcart.getPicture());
													%>
													<tr>
														<td class="product-name-col">
															<figure>
																<a href="#"><img src="<%=request.getContextPath() %>/files/<%=listpicture2.get(0) %>" alt="White linen sheer dress"></a>
															</figure>
															<h3 class="product-name"><a href="#"><%=productcart.getName() %></a></h3>
															<ul>
																<li>Color: White</li>
																<li>Size: SM</li>
															</ul>
														</td>
														<td class="product-code"><%=productcart.getId() %>
														</td>
														<td class="product-price-col">

                                                                    <span class="product-price-special"><%=productcart.getPrice() %>
                </span>
														</td>
														<td>

															<div class="custom-quantity-input">
																<span class="product-price-special"><%=productcart.getQuantity()%></span>
															</div>
														</td>
														<td class="product-total-col">

                                                                    <span class="product-price-special"><%=productcart.getQuantity()* productcart.getPrice() %>
                </span>
														</td>
														<td>
															<a href="#" class="close-button"></a>
														</td>
													</tr>
													<%} %>
													</tbody>
													<tfoot>
													<tr>
														<td class="checkout-total-title" colspan="4">

                                                                    <span>TOTAL:
                </span>
														</td>
														<td id="thanh-tien" class="checkout-total-price cart-total" colspan="2"><%=thanhtien %>
														</td>
													</tr>
													</tfoot>
												</table>
												<%} %>
												<input type="submit" name="submit" class="btn btn-custom btn-lg min-width-md" value="Continue">
												
													</div>

													<div class="top-10px">
													</div>

												</div>

												<div class="md-margin visible-xs clearfix">
												</div>

												<div class="col-sm-6 padding-left-md">
													<h3 class="subtitle">Your Address</h3>

													<div class="xs-margin half">
													</div>

													<div class="form-group">
														<label for="address2" class="form-label">Enter your address 
														</label>
														<input type="text" name="address" id="address" class="form-control input-lg">
													</div>

													<div class="form-group">
														<label for="country" class="form-label">Enter your paymentmethod

                                                                <span class="required">*
                </span>
														</label>

														<div class="large-selectbox clearfix">
															<select id="paymentmethod" name="paymentmethod" class="selectbox">


																<option value="Cash">Cash</option>

																<option value="Momo">Momo</option>

																<option value="ATM">ATM</option>

															</select>
														</div>
													</div>

													<div class="top-5px">
													</div>

													<div class="xs-margin">
													</div>
												</div>
											</form>
											<div id="paypal-button-container">
											<script src="https://www.paypal.com/sdk/js?client-id=test"></script>
											 <script>paypal.Buttons().render('body');</script>
											</div>
												
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="xlg-margin">
						</div>

					</div>

				</section>


			</section>
			<!-- End checkout section -->


		</div>
		<!-- /.checkout-content -->
	</div>
	<!-- /.ld-subpage-content -->
	<!-- End checkout -->
</section>
<!--End of Checkout Area-->


</main>
<!-- end main content -->

<!-- start footer area -->
<%@ include file="/templates/public/inc/footer.jsp" %>
<script type="text/javascript">
	function convertCurrency(vnd) {
		var usd = vnd / 23000;
		return Math.round(usd * 100) / 100;
	}

	var thanhTien = $("#thanh-tien").html();
	thanhTien = convertCurrency(thanhTien);
	paypal.Button.render({
		
		env: 'sandbox',
		
		// sandbox: thay bằng clientID trong app của paypal
		client: {
			sandbox: 'AXz1OHBg2C3IRNRjcmraLKoUp6IfhMt_wo16qBsIaNPwTQXYwOq9zRGoIAdVA34CxiAuxPBAe9i-XSLi',
			production: '<insert production client id>'
		},
		
		commit: true,
		
		payment: function(data, actions) {
			return actions.payment.create({
				payment: {
					transactions: [
						{
							amount: {total: thanhTien, currency: 'USD'} // 1.23 là số tiền (USD)
						}
					]
				}
			});
		},
		
		onAuthorize: function(data, actions) {
			return actions.payment.execute().then(function() {
				window.alert('Payment Complete!');
			});
		}
    }, '#paypal-button-container');
</script>
</body>
</html>
