<%@page import="model.bean.rating"%>
<%@page import="utils.StringUtil"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%
if(request.getAttribute("listrating")!=null){
	@SuppressWarnings("unchecked")
	ArrayList<rating> listrating = (ArrayList<rating>) request.getAttribute("listrating");
	for(rating rating: listrating){
	%>
	<li class="comment depth-1">
	<div class="comment_container">
	<img alt="gravatar" src="<%=request.getContextPath() %>/templates/public/img/temp-images/Lara_Fabian_2012.jpeg" class="avatar photo">
	<div class="comment-text">
	<p class="meta">
        <div class="container">
		<input disabled="disabled" id="ratinglist" name="ratinglist" class="rating rating-loading" data-min="0" data-max="5" data-step="0.5" value="<%=rating.getRating()%>">
 		</div>
	<strong><%=rating.getFullname() %></strong> – <time datetime="2013-06-07T13:03:29+00:00"><%=rating.getDatepost() %></time>:
	</p>
	<div class="description">
		<p><%=rating.getContent() %></p>
	</div>
	</div>
	</div>
	</li>
<%}}%>