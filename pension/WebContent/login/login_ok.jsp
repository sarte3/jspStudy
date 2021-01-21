<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.dao.*" %>
<%
	String userid = request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	
	DAO dao = new DAO();
	boolean chk=dao.isMember(userid, pwd);
	
	if(chk)
	{
		//세션 변수 생성 -> 메인페이지 이동
		session.setAttribute("userid", userid);
		String name = dao.mypage(userid).getName();
		session.setAttribute("name", name);
		response.sendRedirect("../main/index.jsp");
		//index.jsp에서 로그인 한 상태와 하지 않은 상태를 사용자가 알 수 있게 표현
	}
	else
	{
		// 로그인 페이지로 다시 이동할 때
		response.sendRedirect("login.jsp?chk=1");
		//
	}
%>