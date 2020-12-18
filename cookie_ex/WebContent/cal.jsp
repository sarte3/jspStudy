<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%
	// 달력을 만들기 위해서 필요한 값 => 해당 월의 총일수, 해당 월의 1일의 요일, 해당 월의 주 수
	// 이번 달 달력
	LocalDate today = LocalDate.now(); //현재 시간

	double chong = today.lengthOfMonth(); // 총 일수
	
	// 1일의 요일을 구하기 전에 ?년 ?월 1일에 대한 날짜 객체를 생성
	
	int y = today.getYear();
	int m = today.getMonthValue();
			
	LocalDate dday = LocalDate.of(y, m, 1); //of(y, m, d) => 해당 년,월,일의 객체가 생성
	
	int yoil = dday.getDayOfWeek().getValue(); // 요일의 값을 숫자로 => 1~7(월~일)까지의 값

	if(yoil == 7)yoil = 0; //일 => 0
	
	int ju = (int)Math.ceil((chong+yoil)/7);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" height="300" border="1">
		<%
		int day = 1; // td 안에 출력할 날짜 변수
		for(int i=1;i<=ju;i++)
		{
		%>
		<tr>
			<%
			for(int j=0;j<7;j++) //yoil 변수의 값은 j 변수와 동일하게 움직임
			{
				if(j<yoil&&i==1||(chong<day))
				{
				%>
				<td>&nbsp;</td> <!-- 값이 출력되지 않는 td j의 값이 요일보다 작을 때-->
				<%
				}
				else
				{
				%>
				<td><%=day %></td>
				<%
				day++;
				}
				
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>