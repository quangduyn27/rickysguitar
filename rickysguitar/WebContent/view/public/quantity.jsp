<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int quantity = (int) request.getAttribute("quantity");
    %>
     <input type="number" step="1" id="quantity" value="<%=quantity %>" title="Qty" class="input-text qty text" size="4" min="1">
    