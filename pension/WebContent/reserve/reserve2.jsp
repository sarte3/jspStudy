<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.util.ArrayList" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../top.jsp" %>  
<%
   // 달력을 만들기 위해 필요한 값  => 해당월의  총일수, 해당월의 1일의 요일 , 해당월의 주 수
   // 이번달 달력
   LocalDate today=LocalDate.now(); // 현재시간
   double chong=today.lengthOfMonth(); // 총일수를 구하는 메소드
   
   int y=today.getYear();
   int m=today.getMonthValue();
   // 1일의 요일을 구하기전에   ?년 ?월 1일에 대한 날짜 객체를 생성
   LocalDate dday=LocalDate.of(y,m,1);  // of(y,m,d) => 해당 년,월,일의 객체가 생성
   int yoil=dday.getDayOfWeek().getValue(); // 요일의 값을 숫자로 => 1~7(월~일)까지의 값  
   if(yoil==7)
	   yoil=0; // 일 => 0
   
   int ju=(int)Math.ceil((chong+yoil)/7);   // (31+2)/7 =>  33/7 => 4.xx
%>
<%@ page import="pension.dto.RoomDTO" %>
<%@ page import="pension.dao.DAO" %>
<%	//room 테이블에서 우리 펜션의 방의 이름을 가져오기
	DAO dao=new DAO();
	ArrayList<RoomDTO> list=dao.get_room();
	pageContext.setAttribute("list", list);
	
	// el표현식으로 접근하기 위해 pageContext 영역에 변수를 set해야 한다
	// ju(주), chong(총일수), yoil(요일), y, m
	pageContext.setAttribute("ju", ju);
	pageContext.setAttribute("chong", chong);
	pageContext.setAttribute("yoil", yoil);
	pageContext.setAttribute("y", y);
	pageContext.setAttribute("m", m);
%>
    
<!DOCTYPE html>
<html>
<style>
	#section {
	
		width:1100px;
		height:800px;
		margin:auto;
	}
	</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="section">
   <table width="1000" height="600" border="1" align="center">
   <c:set var="day" value="1"/>
   <c:set var="today" value="<%=LocalDate.now() %>"/>
   <c:forEach var="i" begin="1" end="${ju}"> <!-- 1주씩 출력 -->
   <tr>
   		<c:forEach var="j" begin="0" end="6"> <!-- 각 주에 들어가는 일 -->
    		<c:if test="${j < yoil and i == 1 or chong < day}"> <!-- 빈칸 출력 -->
  	  			<td> &nbsp; </td>  <!-- 값이 출력되지않는 td  j의 값이 yoil보다 작을때 -->
    		</c:if>
   			<c:if test="${j >= yoil and i==1 or i>1 and chong >= day}"> <!-- 날짜 출력 -->
      			<td> ${day} <br> <!-- y,m,day => 년,월,일 --> 
				<!-- 추가된 내용 -->
				<%  //pageContext => 스크립트릿
					int day=Integer.parseInt(pageContext.getAttribute("day").toString()); 
				%>
				<c:set var="dday" value="<%=LocalDate.of(y, m, day) %>"/>
				<c:if test="${dday>=today}">
				<c:forEach var="rdto" items="${list }">
					<!-- reserve_next.jsp : 날짜, 방이름 -->
					<a href="reserve_next.jsp?y=${y}&m=${m}&day=${day}&id=${rdto.id}">${rdto.name}</a><br>
				</c:forEach> <!-- 달력의 날짜마다 방이름을 출력하는 문장 -->
				</c:if>
				</td>
			<c:set var="day" value="${day+1}"/>
			</c:if>
		</c:forEach> <!--  각주의 일이 출력되는 루프 끝 -->
	</tr>
	</c:forEach> <!-- 주가 출력되는 루프 끝 -->
	</table>
</div>
</body>
</html>

<%@ include file="../bottom.jsp" %>