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
<%--                                     <a href="<%=request.getContextPath()%>/admin-order-add" class="btn btn-success btn-md"><i class="fa fa-plus "></i>Thêm</a>
 --%>                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="post" action="">
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right" />
                                        <input type="search" name="timkiem" class="form-control input-sm" placeholder="Nhập tên khách hàng" style="float:right; width: 300px;" />
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
                                                               if(request.getAttribute("listorder")!=null){
                                                                	 @SuppressWarnings("unchecked")
                                                                	 ArrayList<Orders> listorder = (ArrayList<Orders>)request.getAttribute("listorder");
                                                                if(listorder.size()>0){
                                %>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên khách hàng</th>
                                        <th>Địa chỉ</th>
                                        <th>Thanh toán</th>
                                        <th>Số điện thoại</th>
                                        <th width="100px">Thời gian</th>
                                        <th width="150px">Trạng thái</th>
                                        <th >Đơn hàng</th>
                                        <th width="70px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <%
                                 for(Orders order: listorder){
                                 %>
                                    <tr>
                                         <td><%=order.getIdorder() %></td>
                                         <%
                                         if(request.getParameter("oid")!=null && (order.getIdorder()==Integer.parseInt(request.getParameter("oid")))){
                                         %>
                                        <td class="center"><%="<strong style='color:red'>"+ order.getName()+ "</strong>" %></td>
                                      <%}else{ %>
                                       <td class="center"><%=order.getName() %></td>
                                      <%} %>
                                        <td class="center"><%=order.getAddress() %></td>
                                        <td class="center"><%=order.getPaymentmethod() %></td>
                                        <td class="center"><%=order.getPhone() %></td>
                                        <td class="center"><%=order.getDate() %></td>
                                        <td class="center">
                                        <form action="" id="orderstatusform<%=order.getIdorder()%>" method="post" >
                                        <div width="100px" class="orderstatus<%=order.getIdorder()%>">
										    <label  class="btn btn-info">
										        <input name="status" type="radio" value="1" <%if(order.getStatus()==4){out.print("disabled");} %> <%if(order.getStatus()==1){out.print("checked");} %>>
										      Đã nhận      
										   </label><br>
										   <label  class="btn btn-warning">
										       <input name="status"  type="radio" value="2" <%if(order.getStatus()==4){out.print("disabled");} %> <%if(order.getStatus()==2){out.print("checked");} %>>
										     Đang giao
									       </label><br>
										   <label class="btn btn-success">
										       <input name="status"  type="radio" value="3" <%if(order.getStatus()==4){out.print("disabled");} %> <%if(order.getStatus()==3){out.print("checked");} %>>
										      Đã giao
									       </label><br>
									       <label class="btn btn-danger">
										       <input name="status"  type="radio" value="4" <%if(order.getStatus()==4){out.print("checked");} %>>
										       Huỷ bỏ
									       </label>
										       <button class="btn btn-primary" name="submit" onclick="return getUpdate(<%=order.getIdorder() %>)"  type="submit" value="submit">Cập nhật</button>
                                        </div>
                                        </form>
                                        </td>
                                        <td class="center">
										 <a href="<%=request.getContextPath() %>/admin-orderdetail?oid=<%=order.getIdorder()%>" title="" class="btn btn-primary"><i class="fa fa-eye "></i> Chi tiết</a>
                                        </td>
                                        <td class="center">
                                            <a href="<%=request.getContextPath() %>/admin-order-del?oid=<%=order.getIdorder() %>" onclick = "return confirm('bạn có muốn xoá?')" title="" class="btn btn-danger"><i class="fa fa-eraser"></i> Xóa</a>
                                        </td>
                                        </tr>
                                        <%} %>
                                    
                                </tbody>
                            </table>
                            
                              <%}else{%>
                                 	<span>Không có đơn hàng</span>
                                 <%} %>
                            <%
                            int numberOfPages = (Integer)request.getAttribute("numberOfPages");
                            int currentPage = (Integer)request.getAttribute("currentPage");
                            if(listorder.size()>0){
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
    document.getElementById("order").classList.add('active-menu');
</script>
<script type="text/javascript">
	 	 function getUpdate(idorder) {
			var orderstatus = $('input[name=status]:checked', '#orderstatusform'+idorder).val();
			if(orderstatus==4){
				var a = confirm("Sẽ không thể cập nhật nếu đơn hàng đã bị huỷ?");
			if(a){
				 $.ajax( {
	                url:'<%=request.getContextPath()%>/admin-orderstatus',
	                type : 'post',
	                data : {
						aidorder : idorder,
						aorderstatus : orderstatus
					},
	                success:function(data) {
	                   $('.orderstatus'+idorder).html(data);
	                   alert("Cập nhật thành công.");
	                },
	                error : function() {
						alert("Đã có lỗi trong quá trình xử lý.");
					}
	             });
			}
			}else{
				
				 $.ajax( {
	                url:'<%=request.getContextPath()%>/admin-orderstatus',
	                type : 'post',
	                data : {
						aidorder : idorder,
						aorderstatus : orderstatus
					},
	                success:function(data) {
	                   $('.orderstatus'+idorder).html(data);
	                   alert("Cập nhật thành công.");
	                },
	                error : function() {
						alert("Đã có lỗi trong quá trình xử lý.");
					}
	             });
			}
			 return false;
		};
	
	</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>

