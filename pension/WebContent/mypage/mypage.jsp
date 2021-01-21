<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%@ page import="pension.dao.*" %>
<%@ page import="pension.dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String userid=session.getAttribute("userid").toString();
	DAO dao=new DAO();
	MemberDTO mdto=dao.mypage(userid);
	ArrayList<ReserveDTO> list = dao.my_reserve(userid);
	
	pageContext.setAttribute("mdto", mdto);
	pageContext.setAttribute("list", list);
%>
<style>
#section {
	width :1100px;
	height: 400px;
	margin: auto;
	text-align: center;
}
#section #my
{
	width:600px;
	height:120px;
}
#section #reserve
{
	width:600px;
	height: 300px;
}


</style>
<div id="section" align="center">
	<div id="my"><!-- 회원 정보 : member 테이블의 값을 가져온다 => dao.mypage() -->
		<table width="590" align="center">
			<caption><h3>나의 정보</h3></caption>
			<tr>
				<td>이름</td>
				<td>${mdto.name }</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${mdto.userid }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${mdto.phone }</td>
			</tr>
		</table>
	</div>
	<div id="reserve"> <!-- 예약 정보 : reserve 테이블에서 가져온다 => dao.my_reserve() -->
		<table width="590" align="center">
			<caption><h3>나의 예약 정보</h3></caption>
			<tr>
				<td>숙소</td>
				<td>입실일</td>
				<td>퇴실일</td>
				<td>bbq</td>
				<td>삼겹살</td>
				<td>예약일</td>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
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
<%@ include file="../bottom.jsp" %>