<%@page import="utils.StringUtil"%>
<%@page import="model.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<!-- end header -->

<!-- start main content -->
<main class="main-container">
<!-- shopping cart content -->
<section class="shopping-cart-area">
	<!-- Begin cart -->
	<div class="ld-subpage-content">

		<div class="ld-cart">

			<!-- Begin cart section -->
			<section class="ld-cart-section ptb-50">

				<div class="container">

					<div class="row">

						<div class="col-md-12">

								<%
									if (session.getAttribute("listcart") != null) {
										 @SuppressWarnings("unchecked")
										ArrayList<Product> listproduct = (ArrayList<Product>) session.getAttribute("listcart");
									
										if (listproduct.size() > 0) {
									%>
							<!-- Begin table -->
							<table id="carttable" class="table cart-table">
								<thead>
								<tr>
									<th class="table-title">Product Name</th>
									<th class="table-title">Product Code</th>
									<th class="table-title">Unit Price</th>
									<th class="table-title">Quantity</th>
									<th class="table-title">SubTotal</th>
									<th>

										<span class="close-button disabled"></span></th>
								</tr>
								</thead>


								<tbody >
									<%
									int thanhtien = 0;
									for (Product product : listproduct) {
										thanhtien += product.getQuantity() * product.getPrice();
										ArrayList<String> listpicture = StringUtil.getFileName(product.getPicture());
									%>

								<tr>
									<td class="product-name-col">
										<figure>
											<a href="<%=request.getContextPath()%>/public-detail?sid=<%=product.getId()%>"><img class="img-responsive" src="<%=request.getContextPath() %>/files/<%=listpicture.get(0) %>" alt="White linen sheer dress"></a>
										</figure>
										<h2 class="product-name"><a href="<%=request.getContextPath()%>/public-detail?sid=<%=product.getId()%>"><%=product.getName() %></a></h2>

										<ul>
											<li>Category: <%=product.getCat().getName() %></li>
										</ul>
									</td>
									<td class="product-code"><%=product.getId() %></td>
									<td class="product-price-col">
										<span class="product-price-special"><%=product.getPrice() %> VND</span>
									</td>
									<td>
										<div class="custom-quantity-input">
									<button onclick="getQuantity(0,<%=product.getId() %>)" type="button" class="cart-button" >-</button>
									<input type="number" id="quantity<%=product.getId() %>" size="4" min="1" name="quantity" value="<%=product.getQuantity()%>">
									<button onclick="getQuantity(1,<%=product.getId() %>)" type="button" class="cart-button" >+</button>
										</div>
									</td>
									<td class="product-price-special">
										<%=product.getPrice() * product.getQuantity() %> VND
									</td>
									<td>
										<a href="javascript:void(0)" onclick="getDel(<%=product.getId() %>)" class="close-button"><i class="fa fa-times"></i></a>
									</td>
								</tr>
								<%} %>
								<tr>
									<td style="text-align:right"  class="product-name-col" colspan="4">TOTAL</td>
									<td class="product-total-col" ><span class="product-price-special"><%=thanhtien %> VND</span></td>
									<td>
										<a href="#" class="close-button"></a>
									</td>
								</tr>
								</tbody>
							</table>
							<%}else{ %>
							
									<p style="color: red">Giỏ hàng rỗng.</p>
							
							<%}} %>
							<!-- End table -->

							<div class="mt-30"></div>

							<div class="row">

								<div class="col-md-8">
									<a href="<%=request.getContextPath() %>/public-index" class="btn btn-custom-6 btn-lger min-width-lg">Continue Shopping</a>
								</div>

								<div class="mt-30 visible-sm visible-xs clearfix"></div>

								<div class="col-md-4">
									<div class="text-right"><a href="<%=request.getContextPath() %>/public-checkout2" class="btn btn-custom-6 btn-lger min-width-sm">Checkout</a>
									</div>

								</div>
								<!-- /.col-md-4 -->
							</div>
							<!-- /.row -->
						</div>
					</div>
				</div>

			</section>
			<!-- /.ld-cart-section -->

		</div>
		<!-- /.ld-cart -->
	</div>
	<!-- /.ld-subpage-content -->
	<!-- End Cart -->
</section>
<!-- end shopping cart content -->

</main>

<!-- start footer area -->
<%@ include file="/templates/public/inc/footer.jsp" %>

<script type="text/javascript">
function getDel(idproduct) {
	$.ajax( {
        url:'<%=request.getContextPath()%>/public-cart2',
        type : 'post',
        data : {
			aidproduct : idproduct,
		},
        success:function(data) {
           $('#carttable').html(data);
        },
        error : function() {
			alert("Đã có lỗi trong quá trình xử lý.");
		}
     });

};
function getQuantity(trangthai,idproduct) {
	 var quantity = $('#quantity'+idproduct).val();
	$.ajax({
		url : '<%=request.getContextPath()%>/public-cart',
		type : 'POST',
		cache : false,	
		data : {
			aidproduct :idproduct,
			aquantity :quantity,
			atrangthai :trangthai,
		},
		success : function(data) {
			$('#carttable').html(data);
			//alert("Comment thanh cong");
		},
		error : function() {
			alert("Đã có lỗi trong quá trình xử lý khí thêm só lượng.");
		}
	});

};
		
	</script>
</body>
</html>
	