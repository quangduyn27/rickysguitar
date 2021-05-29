<%@page import="model.bean.Orders"%>
<%@page import="model.bean.rating"%>
<%@page import="utils.StringUtil"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
												
												<% 
												Orders order = (Orders) request.getAttribute("order");
												%>
												
												

											<label class="btn btn-info">
										        <input name="status" type="radio" value="1" <%if(order.getStatus()==1){out.print("checked");} %>>
										        Open      
										   </label><br>
										   <label class="btn btn-warning">
										       <input name="status"  type="radio" value="2" <%if(order.getStatus()==2){out.print("checked");} %>>
										       Pending
									       </label><br>
										   <label class="btn btn-success">
										       <input name="status"  type="radio" value="3" <%if(order.getStatus()==3){out.print("checked");} %>>
										      Delivered
									       </label><br>
									       	   <label class="btn btn-danger">
										       <input name="status"  type="radio" value="4" <%if(order.getStatus()==4){out.print("checked");} %>>
										       Canceled
									     </label>
										       <button class="btn btn-primary" name="submit" onclick="return getUpdate(<%=order.getIdorder() %>)"  type="submit" value="submit">Update</button>
										       
										       
										       
										       
										       
										       