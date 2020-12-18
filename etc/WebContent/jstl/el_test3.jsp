<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	application.setAttribute("name", "슈퍼맨");
	session.setAttribute("name", "배트맨");
	request.setAttribute("name", "홍길동");
	//pageContext.setAttribute("name", "핸리킴");
%>
${name }
</body>

</html>