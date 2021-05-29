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
                <h2>Thêm danh mục</h2>
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
                            ${error}
                            <%
                            if(request.getParameter("msg")!=null){
                            	int msg =  Integer.parseInt(request.getParameter("msg"));
                            	if(msg==4){
                            		out.print("<p style='color:red'> Đã có lỗi xảy ra.</p>");
                            	}
                            }
                            %>
                             <%
                             Cat cat = null;
                             if(request.getAttribute("cat")!=null){
                             cat = (Cat) request.getAttribute("cat");
                             }
                            %>
                            
                                <form role="form" action="" method="post" id="form">
                                    <div class="form-group">
                                        <label for="name">Tên danh mục mới</label>
                                        <input type="text" id="name" value="<%if(cat!=null){out.print(cat.getName());} %>" name="name" class="form-control" />
                                    </div>
                                     <div class="form-group">
                                     <label >Thuộc danh mục: </label>
                                        <select name="category" class="form-control">
                                          <option value="0" selected="selected">---Danh mục mới---</option>
                                     <%
                                        @SuppressWarnings("unchecked")
                                        ArrayList<Cat> listcat = (ArrayList<Cat>) request.getAttribute("listcat");
                                        		for(Cat catlist:listcat){
                                        	if(cat!=null&&cat.getParent_id()==catlist.getId()){	
                                        %>
										  <option value="<%=catlist.getId()%>" selected="selected"><%=catlist.getName() %></option>
										 <%}else{ %>
										  <option value="<%=catlist.getId()%>"><%=catlist.getName() %></option>
										 <%}} %>
										 
										 	 </select>
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
					}
				},
				messages : {
					"name" : {
						required : "Vui lòng nhập tên bài hát",
					},
					"category" : {
						required : "Vui lòng nhập danh mục",
					}
				}
			});
		});
	</script>
<script>
    document.getElementById("cat").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>