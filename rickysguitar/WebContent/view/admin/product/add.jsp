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
                <h2>Thêm sản phẩm</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                            ${error }
                            <%
                            if(request.getParameter("msg")!= null){
                           out.print("<p style='color:red'>Xử lý không thành công.</p>");
                           }
                            %>
                            <%
                            Product product = null;
                              if(request.getAttribute("product")!=null){
                            	  product = (Product) request.getAttribute("product");
                                                        }
                            %>
                                <form role="form" action="" method="post" enctype="multipart/form-data" id="form">
                                    <div class="form-group">
                                        <label for="name">Tên sản phẩm</label>
                                        <input type="text"  value="<% if(request.getAttribute("product")!=null){out.print( product.getName());} %>" required="required" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label >Danh mục</label>
                                        <select name="category" class="form-control">
                                          <option value="" selected="selected">---Chọn danh mục---</option>
                                        <%
                                        @SuppressWarnings("unchecked")
                                        ArrayList<Cat> listcat = (ArrayList<Cat>) request.getAttribute("listcat");
                                        		for(Cat cat:listcat){
                                        		if(product!=null&&product.getId()==cat.getId()){
                                        %>
                                        <option value="<%=cat.getId()%>" selected="selected"><%=cat.getName() %></option>
	                                     <%}else{ %>
										  <option value="<%=cat.getId()%>"><%=cat.getName() %></option>
										 <%}} %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Giá cả</label>
                                        <input type="text"  value="<% if(request.getAttribute("product")!=null){out.print( product.getPrice());} %>" required="required" name="price" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Khuyến mãi</label>
                                        <input type="text"  value="<% if(request.getAttribute("product")!=null){out.print( product.getSale());} %>" required="required" name="sale" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Số lượng</label>
                                        <input type="text"  value="<% if(request.getAttribute("product")!=null){out.print( product.getQuantity());} %>" required="required" name="quantity" class="form-control" />
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture"  accept="image/*" />
                                    </div>
                                   
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea class="form-control" id="khungsoanthao" rows="5" name="khungsoanthao"><% if(request.getAttribute("product")!=null){out.print(product.getDetail());} %></textarea>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Thêm</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>
        <!-- /. ROW  -->
    </div>
    <!-- /. PAGE INNER  -->
</div>
<style>
.error {
	color: red;
}
</style>
<script type="text/javascript">
		$(document).ready(function() {
			$('#form').validate({
				rules : {
					"name" : {
						required : true,
					},
					"category" : {
						required : true,
					},
					"picture" : {
						required : true,
					},
					"price" : {
						required : true,
					},
					"sale" : {
						required : true,
					},
					"quantity" : {
						required : true,
					},
					"khungsoanthao" : {
						required : true,
					},
				},
				messages : {
					"name" : {
						required : "	Vui lòng nhập tên bài hát",
					},
					"category" : {
						required : "	Vui lòng nhập danh mục",
					},
					"picture" : {
						required : "	Vui lòng nhập hình ảnh",
					},
					"price" : {
						required : "Vui lòng nhập giá",
					},
					"sale" : {
						required : "Vui lòng nhập khuyễn mãi",
					},
					"quantity" : {
						required : "Vui lòng nhập số lượng",
					},
					"khungsoanthao" : {
						required : "Vui lòng nhập chi tiết",
					},
				}
			});
		});
	</script>
<script type="text/javascript">
	CKEDITOR.replace('khungsoanthao');

    document.getElementById("product").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>