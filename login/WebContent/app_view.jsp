<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	application 변수 : <%=application.getAttribute("name") %><br>
	session 변수 : <%=session.getAttribute("name") %>
</body>
</html>