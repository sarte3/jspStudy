<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid")==null)
	{
		// 로그인을 하시오
		response.sendRedirect("login.jsp");
	}
	else
	{
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
여기는 회원만 보는 문서입니다.
</body>
</html>
<%
	}
%>