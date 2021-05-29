<%@page import="com.mysql.cj.x.protobuf.MysqlxCrud.Order"%>
<%@page import="model.bean.Orderdetail"%>
<%@page import="model.bean.Orders"%>
<%@page import="model.bean.Cat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý đơn hàng</h2>
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
      	                          </div>
                                <div class="col-sm-6" style="text-align: right;">
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
                                Orders order = (Orders) request.getAttribute("order");
                                %>
                                <p>
                                <strong>Khách hàng:</strong><span> <%=order.getName() %></span><br>
                                <strong>Địa chỉ:   </strong> <%=order.getAddress() %><br>
                                <strong>Email:     </strong> <%=order.getEmail() %><br>
                                <strong>Phone:     </strong> <%=order.getPhone() %>
                                </p>
                                <%
                                                               if(request.getAttribute("listod")!=null){
                                                                	 @SuppressWarnings("unchecked")
                                                                	 ArrayList<Orderdetail> listod = (ArrayList<Orderdetail>)request.getAttribute("listod");
                                                                if(listod.size()>0){
                                %>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên sản phẩm </th>
                                        <th>Số lượng</th>
                                        <th>Đơn giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <%
                                	int thanhtien = 0;
                                 for(Orderdetail Orderdetail: listod){
                                	 thanhtien += Orderdetail.getQuantity() * Orderdetail.getPrice();
                                 %>
                                    <tr>
                                         <td><%=Orderdetail.getIddetail() %></td>
                                        <td class="center"><%=Orderdetail.getName() %></td>
                                       <td class="center"><%=Orderdetail.getQuantity() %></td>
                                        <td class="center"><%=Orderdetail.getPrice()%></td>
                                    </tr>
                                 <%}%>
                                  <tr>
                                       <td class="center" colspan="3">Tổng tiền:</td>
                                        <td class="center"><%=thanhtien %></td>
                                    </tr>
                                </tbody>
                            </table>
                            <a href="<%=request.getContextPath() %>/admin-order " title="" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Quay lại</a>
                            <a href="<%=request.getContextPath() %>/admin-order-email?oid=<%=order.getIdorder() %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i>Send Email</a>
                              <%}else{%>
                                 	<span>Không có đơn hàng</span>
                                 <%} %>
                           <%--  <%
                            int numberOfPages = (Integer)request.getAttribute("numberOfPages");
                            int currentPage = (Integer)request.getAttribute("currentPage");
                            if(listod.size()>0){
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
                                            
                                            	<a href="<%=request.getContextPath()%>/admin-order?page=<%=pagePrevious%>">Trang trước</a>
                                            </li>
                                            <%
                                            for(int i =1; i<= numberOfPages; i++){
                                            	if(currentPage==i){
                                            	active = "active";
                                            	}else{
                                            	active = "";
                                            	}
                                            %>
                                            <li class="paginate_button <%=active %>" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin-order?page=<%=i%>"><%=i %></a></li>
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
                                            <a href="<%=request.getContextPath()%>/admin-order?page=<%=pageNext%>">Trang tiếp</a></li>
                                         <%} %>   
                                        </ul>
                                    </div>
                                </div>
                            </div> --%>
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
    document.getElementById("order").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>
