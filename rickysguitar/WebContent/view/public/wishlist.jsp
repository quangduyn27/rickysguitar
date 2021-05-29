<%@page import="utils.StringUtil"%>
<%@page import="model.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<!-- end header -->

<!-- start main content -->
<main class="main-container">
<!-- compare content -->
	<!-- Main content starts -->

	<div class="main-block">



		<div class="container">

			<!-- Actual content -->
			<div class="ecommerce pt-40">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<!-- Shopping items content -->
						<div class="shopping-content">
							<!-- Block Title -->
							<%
							ArrayList<Product> listproduct= null;
							if(request.getAttribute("listproduct")!=null){
								listproduct = (ArrayList<Product>)request.getAttribute("listproduct");
								if(listproduct.size()>0){
							%>
						
							<!-- Shopping Edit Profile -->
							<div class="shopping-wishlist">
								<!-- Recent Purchase Table -->
								<div class=" table-responsive">
									<table class="table table-bordered">	
										<!-- Table Header -->
										<thead>
										<tr>
											<th>#</th>
											<th>Image</th>
											<th>Name</th>
											<th>Category</th>
											<th>Price</th>
											<th>Action</th>
										</tr>
										</thead>
										<tbody id="listwish">
										<%
										int stt=0;
										for(Product product: listproduct){
											ArrayList<String> listpicture = StringUtil.getFileName(product.getPicture());
										
										%>
										<tr>
											<td><%=++stt %></td>
											<!-- Product image -->
											<td>
												<a href="<%=request.getContextPath() %>/public-detail?sid=<%=product.getId()%>">
													<img style="width:90px" src="<%=request.getContextPath() %>/files/<%=listpicture.get(0) %>" alt="" class="img-responsive"/>
												</a>
											</td>
											<td><a href="<%=request.getContextPath() %>/public-detail?sid=<%=product.getId()%>"><%=product.getName() %></a></td>
											<td><%=product.getCat().getName() %></td>
											<td><%=product.getPrice() %></td>
											<td>
												<div class="btn-group btn-group-xs">
													<a  class="btn btn-primary"><i class="fa fa-money"></i>  Checkout</a>
													<button  onclick="return getDel(<%=product.getId()%>)" class="btn btn-danger"><i class="fa fa-trash-o"></i> Delete</button>
 											</div>
											</td>
										</tr>
										<%}}else %>
										<span>Chưa có sản phẩm nào.</span> 
										<%} %>
<%-- 										<a href="<%=request.getContextPath() %>/public-favorite?del=1&sid=<%=product.getId()%>" class="btn btn-danger"><i class="fa fa-trash-o"></i> Delete</a>
 --%>										</tbody>
									</table>
								</div>
								
								 <%
                               int currentPage = (int) request.getAttribute("currentpage");
                               int numberOfPages = (int) request.getAttribute("numberOfPages");
                               if(listproduct.size()>0){
                               %>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:21px"></div>
                                    <div style="text-align: left" class="col-sm-6"><a href="<%=request.getContextPath() %>/public-index" class="btn btn-primary"><i class="fa fa-left-arrow"></i>  Back to shop</a></div>
	                                    
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
                                            
                                            	<a href="<%=request.getContextPath()%>/public-favorite?page=<%=pagePrevious%>">Previous</a>
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
                                                 <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-favorite?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-favorite?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-favorite?page=<%=i%>"><%=i %></a></li>
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
                                                       <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-favorite?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-favorite?page=<%=i%>"><%=i %></a></li>
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
                                                 <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-favorite?page=<%=i%>"><%=i %></a></li>
                                                 
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-favorite?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-favorite?page=<%=i%>"><%=i %></a></li>
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
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/public-favorite?page=<%=i%>"><%=i %></a></li>
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
                                            <a href="<%=request.getContextPath()%>/public-favorite?page=<%=pageNext%>">Next</a></li>
                                         <%} %>   
                                        </ul>
                                    </div>
                                </div>
                            </div>
								<!-- Pagination -->
								<!-- <div class="shopping-pagination">
									<ul class="pagination pull-right">
										<li class="disabled"><a href="#">&laquo;</a></li>
										<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clearfix"></div>
								</div> -->
								<!-- Pagination end-->
							</div>
						</div>
					</div>
				</div>
				<br />



			</div>
		</div>
	</div>

	<!-- Main content ends -->
<!-- end compare content -->

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

<!-- start footer area -->
<%@ include file="/templates/public/inc/footer.jsp" %>
<script type="text/javascript">
		function getDel(idproduct) {
			$.ajax({
				url : './public-favorite',
				type : 'post',
				cache : false,
				data : {
					aidproduct: idproduct 
				},
				success : function(data) {
					$('#listwish').html(data);
					//console.log(data);
					//var json = JSON.parse(data);
					//console.log(json.status);
					//console.log(json.code);
					//location.reload();
				},
				error : function() {
					alert("Đã có lỗi trong quá trình xử lý.");
				}
			});
		}
	</script>
</body>
</html>
