<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.dao.*" %>
<%@ page import="pension.dto.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mDTO" class="pension.dto.MemberDTO">
	<jsp:setProperty name="mDTO" property="*"/>
</jsp:useBean>
<%
	DAO dao = new DAO();
	dao.member_ok(mDTO);
	
	response.sendRedirect("login.jsp");
%>