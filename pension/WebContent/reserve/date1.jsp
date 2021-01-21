<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>view에 날짜를 가져오는 방법 => el 표현식으로 날짜를 접근해야 된다 => pageContext 영역</h3>
	<% 
		//현재 시간
		pageContext.setAttribute("today1", new java.util.Date());
	%>
	${today1}
	<hr>
	<c:set var="today2" value="<%=new java.util.Date() %>"/>
	${today2}
	<hr>
	<jsp:useBean id="today3" class="java.util.Date"/>
	${today3}
</body>
</html>