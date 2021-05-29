<%@page import="model.bean.Product"%>
<%@page import="utils.StringUtil"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Hình ảnh</h2>
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
                                <form action="<%=request.getContextPath() %>/admin-product-picture-add" role="form" method="post" enctype="multipart/form-data" id="form">
                                    <%
                                    	if (request.getParameter("msg") != null) {
                                    		int msg = Integer.parseInt(request.getParameter("msg"));
                                    		if (msg==1) {
                                    %>
                                    <div class="alert alert-success" role="alert">
		                            	<span style="color: blue; font-style: italic">Thêm ảnh thành công</span>
		                            </div>
                                    <%
                                    		}else if (msg==2) {
                                	%>
                                	<div class="alert alert-danger" role="alert">
                                		<span style="color: red; font-style: italic">Đã xảy ra lỗi trong quá tình xử lý</span>
                                	</div>
                                	<%
                                    		}else{
                                	%>
                                	<div class="alert alert-success" role="alert">
		                            	<span style="color: blue; font-style: italic">Xoá ảnh thành công</span>
		                            </div>
                                	
                                	<%
                                		}}
                                    	if (request.getAttribute("productbyid") != null) {
                                    		Product productbyid = (Product) request.getAttribute("productbyid");
                                	%>
                                	<div class="form-group">
                                        <label for="idBook">ID</label>
                                        <input type="text" id="idBook" value="<%=productbyid.getId() %>" name="sid" class="form-control" readonly="readonly" />
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Tên sản phẩm </label>
                                        <input type="text" id="name" value="<%=productbyid.getName() %>" name="name" class="form-control" readonly="readonly" />
                                    </div>
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" multiple="multiple" />
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md"><i class="fa fa-plus "></i>Thêm</button>
                                </form>
                                <%
                                 	ArrayList<String> listFileName = StringUtil.getFileName(productbyid.getPicture());
                                    if (listFileName.size() > 0) {
                                %>
                                <div class="table-responsive">
                                	<p>Danh sách hình ảnh</p>
	                              <table class="table table-striped table-bordered table-hover" id="dataTables-example">
		                                <thead>
		                                    <tr>
		                                        <th width="5%">STT</th>
		                                        <th>Hình ảnh</th>
		                                        <th width="100px">Chức năng</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<%
		                                		int stt = 0;
		                                		for (String fileName : listFileName) {
		                                	%>
		                                    <tr>
		                                        <td><%=++stt %></td>
		                                        <td class="center">
													<img width="200px" height="200px" src="<%=request.getContextPath() %>/files/<%=fileName %>" />
		                                        </td>
		                                        <td class="center">
		                                            <a href="<%=request.getContextPath() %>/admin-product-picture-del?sid=<%=productbyid.getId() %>&filename=<%=fileName %>" onclick="return confirm('Bạn có chắc muốn xoá hình thứ <%=stt%> không?')" title="" class="btn btn-danger"><i class="fa fa-eraser "></i> Xoá</a>
		                                        </td>
		                                    </tr>
											<%
		                                		}
											%>
		                                </tbody>
		                            </table>
		                            <a href="<%=request.getContextPath() %>/admin-product" title="" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Quay lại</a>
	                            </div>
	                             <%
                                    }else{%>
                                    Không có ảnh.
                                   <%}
                                    	}
	                            %>
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
<script>
    document.getElementById("book").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>
