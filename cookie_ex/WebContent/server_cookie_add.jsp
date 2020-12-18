<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String cname=request.getParameter("cname");
	String cvalue=request.getParameter("cvalue");
	Cookie cookie = new Cookie(cname, cvalue);
	cookie.setMaxAge(600);
	response.addCookie(cookie);
	
	response.sendRedirect("server_cookie_view.jsp");

%>