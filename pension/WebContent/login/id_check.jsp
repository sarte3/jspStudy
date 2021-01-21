<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.dao.*" %>
<%
	String userid=request.getParameter("userid");

	DAO dao = new DAO();
	
	int chk=dao.isUserid(userid);
	
	out.print(chk);
%>