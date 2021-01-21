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
	<h3>Date, Calendar, LocalDateTime을 이용한 현재 시간</h3>
	<hr>
	<c:set var="today" value="<%=new java.util.Date() %>"/>
	${today}
	<hr>
	<c:set var="today2" value="<%=java.util.Calendar.getInstance() %>"/>
	${today2}
	<c:set var="today3" value="<%=java.time.LocalDateTime.now() %>"/>
	${today3}
</body>
</html>