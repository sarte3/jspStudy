<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*" %>
<%@ page import="pension.dao.*" %>
<%@ page import="pension.dto.*" %>
<%
	// reserve 테이블에서 모두 읽어와서 출력
	DAO dao = new DAO();
	ArrayList<ReserveDTO> list = dao.admin_reserve();
	
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #section {
    width:1100px;
    height:400px;
    margin:auto;
    text-align:center;
  }
  #section #reserve
  {
  	width:700px;
  	margin:auto;
  }
  
</style>
</head>
<body>
<div id = "section">
	<div id="reserve">
		<table width="600" align="center">
			<tr>
				<td>이름</td>
				<td>전화번호</td>
				<td>숙소명</td>
				<td>입실일</td>
				<td>퇴실일</td>
				<td>bbq</td>
				<td>삼겹살</td>
				<td>예약일</td>
			</tr>
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.name }</td>
				<td>${dto.phone }</td>
				<td>${dto.rname }</td>
				<td>${dto.inday }</td>
				<td>${dto.outday }</td>
				<td>${dto.bbq }</td>
				<td>${dto.pork }</td>
				<td>${dto.writeday }</td>
			</tr>		
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>
<%@ include file="../bottom.jsp" %> 