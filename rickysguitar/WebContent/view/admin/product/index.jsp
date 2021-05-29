<%@page import="model.bean.Cat"%>
<%@page import="model.bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý sản phẩm</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="<%=request.getContextPath()%>/admin-product-add" class="btn btn-success btn-md"><i class="fa fa-plus "></i>Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="post" action="">
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right" />
                                        <input type="search" name="timkiem" class="form-control input-sm" placeholder="Nhập tên sản phẩm" style="float:right; width: 300px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>
								 ${error }
                                <%
                               										 if(request.getParameter("msg")!=null){
                                                                	int msg =  Integer.parseInt(request.getParameter("msg"));
                                                                	if(msg==1){
                                                                		out.print("<p style='color:green'>Thêm thành công.</p>");
                                                                	}else if(msg==2){
                                                                		out.print("<p style='color:green'>Sửa thành công.</p>");
                                                                	}else if(msg==3){
                                                                		out.print("<p style='color:green'>Xoá thành công.</p>");
                                                                	}else{
                                                                		out.print("<p style='color:red'>Xử lý không thành công.</p>");
                                                                	}
                                                                }
                                %>
                                <%
                                if (request.getParameter("err") != null) {
                                %>
                                <div class="alert alert-danger" role="alert">
								  Không có quyền truy cập
								</div>
                                <%
                                }
                                                                	if (request.getParameter("msgErr") != null) {
                                %>
                                <div class="alert alert-danger" role="alert">
								 Lỗi url, số trang khong hợp lệ
								</div>
                                <%
                                }
                                %>
                                <%
                                // Cat cat = (Cat)request.getAttribute("cat");
                                                               if(request.getAttribute("listsong")!=null){
                                                                	 @SuppressWarnings("unchecked")
                                                                	 ArrayList<Product> listsong = (ArrayList<Product>)request.getAttribute("listsong");
                                                                if(listsong.size()>0){
                                %>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Danh mục</th>
                                        <th>Giá cả</th>
                                        <th>Khuyến mãi</th>
                                        <th>Số lượng</th>
                                        <th>Lượt đọc</th>
                                        <th>Hình ảnh</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <%
                                 for(Product product: listsong){
                                 %>
                                    <tr>
                                         <td><%=product.getId() %></td>
                                         <%
                                         if(request.getParameter("sid")!=null && (product.getId()==Integer.parseInt(request.getParameter("sid")))){
                                         %>
                                        <td class="center"><%="<strong style='color:red'>"+ product.getName()+ "</strong>" %></td>
                                      <%}else{ %>
                                       <td class="center"><%=product.getName() %></td>
                                      <%} %>
                                        <td class="center"><%=product.getCat().getName() %></td>
                                        <td class="center"><%=product.getPrice() %></td>
                                        <td class="center"><%=product.getSale() %></td>
                                        <td class="center"><%=product.getQuantity() %></td>
                                        <td class="center"><%=product.getView() %></td>
                                        <td class="center">
                                        <%if(product.getPicture().isEmpty()){ %>
                                        <p>Chưa có hình ảnh</p>
                                        <%}else{ %>
											<%-- <img width="200px" height="200px" src="<%=request.getContextPath() %>/files/<%=product.getPicture() %>" alt="<%=product.getName()%>"/> --%>
										 <a href="<%=request.getContextPath() %>/admin-product-picture-add?sid=<%=product.getId() %>" title="" class="btn btn-primary"><i class="fa fa-eye "></i> Xem ảnh</a>
											
											<%} %>
                                        </td>
                                        <td class="center">
                                            <a href="<%=request.getContextPath() %>/admin-product-edit?sid=<%=product.getId() %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
                                            <a href="<%=request.getContextPath() %>/admin-product-del?sid=<%=product.getId() %>" onclick = "return confirm('bạn có muốn xoá?')" title="" class="btn btn-danger"><i class="fa fa-eraser"></i> Xóa</a>
                                        </td>
                                    </tr>
                                   
                                 <%}}else{%>
                                 	<span>Không có sản phẩm </span>
                                 <%} %>
                                </tbody>
                            </table>
                            <%
                            int numberOfPages = (Integer)request.getAttribute("numberOfPages");
                            int currentPage = (Integer)request.getAttribute("currentPage");
                            if(listsong.size()>0){
                            %>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px"></div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                         <%
                                        String active, disabled= "";
                                        int pagePrevious = currentPage - 1;
                                           if (currentPage == 1) {
                                          pagePrevious = currentPage;
                                          disabled ="disabled";
                                           }
                                          %>
                                        
                                            <li class="paginate_button previous <%=disabled %>" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                                            
                                            	<a href="<%=request.getContextPath()%>/admin-product?page=<%=pagePrevious%>">Trang trước</a>
                                            </li>
                                            <%
                                            for(int i =1; i<= numberOfPages; i++){
                                            	if(currentPage==i){
                                            	active = "active";
                                            	}else{
                                            	active = "";
                                            	}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-product?page=<%=i%>"><%=i %></a></li>
											<%} %>
                                            	<%
                                            		int pageNext = currentPage + 1;
												 disabled= "";
                                            		if(currentPage == numberOfPages) {
                                            			pageNext = currentPage;
                                            			disabled = "disabled";
                                            		}
                                            	%>
                                            <li class="paginate_button next <%=disabled %>" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                            <a href="<%=request.getContextPath()%>/admin-product?page=<%=pageNext%>">Trang tiếp</a></li>
                                         <%} %>   
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <%} %>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("product").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>
