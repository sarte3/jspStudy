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
		String name = "배트맨";
		String age = "44";
		
		pageContext.setAttribute("name", name);
		pageContext.setAttribute("age", age);
		pageContext.setAttribute("test", "하하하");
		
		String test = pageContext.getAttribute("test").toString();
		out.print(test);
	%>
	${name}
</body>
</html>