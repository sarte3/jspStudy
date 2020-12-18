<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 변수 만들기
	session.setAttribute("userid", "kei"); // (변수명, 값)

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print(session.getAttribute("userid"));
		String name="홍길동";
	%>
	<a href="next.jsp?name=홍길동">다음 문서</a>
</body>
</html>