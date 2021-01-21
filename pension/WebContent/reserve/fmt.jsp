<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h3> 날짜 ,시간,둘다</h3>  
   <c:set var="today" value="<%=new java.util.Date()%>"/> 
   <fmt:formatDate value="${today}" type="date"/> <p>
   <fmt:formatDate value="${today}" type="time"/> <p>
   <fmt:formatDate value="${today}" type="both"/> <p>
   <hr>
   <h3> 스타일 지정 </h3>
   <fmt:formatDate value="${today}" type="both" dateStyle="default" timeStyle="default"/> <p>
   dateStyle과 timeStyle의 속성 = default, short, medium, long, full <br>
   <hr>
   <h3> 사용자 스타일 </h3>
   <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/> <p>
   <fmt:formatDate value="${today}" pattern="HH시 mm분 ss초"/> <p>
   <fmt:formatDate value="${today}" pattern="E요일"/>
   <hr>
   <h3> 변수에 저장 </h3>
   <fmt:formatDate var="dday" value="${today}" pattern="yyyy년 MM월 dd일 E요일"/> ${dday}<p>
   
</body>
</html>