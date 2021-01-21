<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.dao.*" %>
<%@ page import="pension.dto.*" %>
<%
	// 사용자가 방금 예약한 방의 정보들
	// phone으로 검색
	String phone = request.getParameter("phone");
	DAO dao = new DAO();
	String userid = session.getAttribute("userid").toString();
	ReserveDTO rdto = dao.get_reserve(userid);
	RoomDTO dto = dao.select_room(String.valueOf(rdto.getRid()));
	
	pageContext.setAttribute("rdto", rdto);
	pageContext.setAttribute("rname", dto.getName());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>예약 정보 출력</h1>
<table>
	<tr>
		<th>이름</th>
		<td>${rdto.name}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${rdto.phone }</td>
	</tr>
	<tr>
		<th>예약방 이름</th>
		<td>${rname }</td>
	</tr>
	<tr>
		<th>입실일</th>
		<td>${rdto.inday }</td>
	</tr>
	<tr>
		<th>퇴실일</th>
		<td>${rdto.outday }</td>
	</tr>
	<tr>
		<th>인원</th>
		<td>${rdto.inwon1+rdto.inwon2+rdto.inwon3 }</td>
	</tr>
	<tr>
		<th>바비큐</th>
		<td>${rdto.bbq }개</td>
	</tr>
	<tr>
		<th>삼겹살</th>
		<td>${rdto.pork }kg</td>
	</tr>
	<tr>
		<th>숙박비용</th>
		<td>${rdto.suk_price }</td>
	</tr>
	<tr>
		<th>부대비용</th>
		<td>${rdto.etc_price }</td>
	</tr>
	<tr>
		<th>총비용</th>
		<td>${rdto.tot_price }</td>
	</tr>
	<tr>
		<th>예약일</th>
		<td>${rdto.writeday }</td>
	</tr>
	<tr>
		<td colspan="2">
		<a href="../main/index.jsp">메인페이지 가기</a>
		</td>
	</tr>
</table>
</body>
</html>