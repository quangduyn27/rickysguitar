<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Thêm người dùng</h2>
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
                            <%
                            if(request.getParameter("msg")!=null){
                            	int msg = Integer.parseInt(request.getParameter("msg"));
                            	if(msg==1){%>
                            	<div class="alert alert-danger" role="alert">
								  Tên đã tồn tại.
								</div>
                            		out.print("<p style='color:red'></p>");
                            	<%}else{%>
                            		<div class="alert alert-danger" role="alert">
                            		Vui lòng nhập.
  								</div>
                           		 <%}} %>
                                <form class="userform" role="form" action="<%=request.getContextPath() %>/admin-user-add" method="post" >
                                    <div class="form-group">
                                        <label for="username">Tên người dùng</label>
                                        <input type="text" id="username" value="" name="username" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mật khẩu </label>
                                        <input type="text" id="password" value="" name="password" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="fullname">Họ tên</label>
                                        <input type="text" id="fullname" value="" name="fullname" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="birthday">Ngày sinh</label>
                                        <input type="text" id="birthday" value="" name="birthday" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="text" id="email" value="" name="email" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                    	<label for="idrole">Vai tro</label>
                                    	<select name="idrole" id="idrole" class="form-control">
                                    		<option value="2">Admin</option>
                                    		<option value="1">Mod</option>
                                    		<option value="0">User</option>
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
<script>
    document.getElementById("user").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$('.userform').validate({
			rules:{
				username:{
					required: true,
					minlength: 2,
					maxlength: 32,
				},
				password:{
					required: true,
					minlength: 1,
				},
				fulname:{
					required: true,
				},
				/* repassword:{
					required: true,
					equalTo: "#password",
				}, */
				
				birthday:{
					required: true,
					date: true,
				},
				email:{
					required: true,
					email: true,
				},
				

			},
			messages:{
				
				username:{
					required: "Vui lòng nhập tên.",
					minlength: "Tên phải từ 6- 32 ký tự.",
					maxlength: "Tên phải từ 6- 32 ký tự.",
				},
				password:{
					required: "Vui lòng nhập mật khẩu.",
					minlength: "Mật khẩu phải hơn 6 ký tự.",
				},
				repassword:{
					required: "Vui lòng xác nhận mật khẩu.",
					equalTo: "Phải khớp với mật khẩu ở trên.",
				},
				fullname:{
					required: "Vui lòng nhập tên.",
				},
				
				birthday:{
					required: "Vui lòng nhập ngày sinh.",
					date: "Vui lòng nhập đúng định dạng(yyyy-mm-dd).",
				},
				email:{
					required: "Vui lòng nhập e-mail.",
					email: "Vui lòng nhập đúng định dạng e-mail(vd: abc@gmail.com)",
				},

			},

		});
	});

</script>
<style>
.error{
color: red;
}
</style>