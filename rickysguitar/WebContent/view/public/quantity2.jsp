<%@page import="utils.StringUtil"%>
<%@page import="model.bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   									<%
   									
									if (session.getAttribute("listcart") != null) {
										 @SuppressWarnings("unchecked")
										ArrayList<Product> listproduct = (ArrayList<Product>) session.getAttribute("listcart");
										if (listproduct.size() > 0) {
									%>

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


											<tbody class="cartitem">
												<%
												int thanhtien = 0;
												for (Product product : listproduct) {
													thanhtien += product.getQuantity() * product.getPrice();
													ArrayList<String> listpicture = StringUtil.getFileName(product.getPicture());
												%>

											<tr>
												<td class="product-name-col">
													<figure>
														<a href="#"><img class="img-responsive" src="<%=request.getContextPath() %>/files/<%=listpicture.get(0) %>" alt="White linen sheer dress"></a>
													</figure>
													<h2 class="product-name"><a href="#"><%=product.getName() %></a></h2>

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
														<input type="number" id="quantity<%=product.getId() %>" name="quantity" value="<%=product.getQuantity()%>">
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
											<%}else{%>
											<p> giỏ hàng rỗng</p>
					
											<%}}%>