<%@page import="utils.StringUtil"%>
<%@page import="model.bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	<%} %>
