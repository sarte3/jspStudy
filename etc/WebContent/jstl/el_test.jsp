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
		String name = "홍길동";
		
		//영역을 가지는 객체들 => application, session, request, pageContext
		session.setAttribute("name", "슈퍼맨");
	%>
	기존방식 : <%=session.getAttribute("name") %><br>
	el표현식 : ${name} 
</body>
</html>