<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.dao.*" %>
<%@ page import="pension.dto.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="rdto" class="pension.dto.ReserveDTO">
	<jsp:setProperty name="rdto" property="*"/>
</jsp:useBean>
<!-- ReserveDTO rdto = new ReserveDTO(); => setter하는 동작 -->
<%
	DAO dao = new DAO();
	String userid = session.getAttribute("userid").toString();
	dao.insert(rdto, userid);
	response.sendRedirect("reserve_view.jsp?userid="+userid);
%>