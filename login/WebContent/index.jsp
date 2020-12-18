<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#first {
			width:900px;
			height:30px;
			background: purple;
			color:white;
			text-align: center;
			margin: auto; /* 내용이 중앙에 정렬 */
			line-height: 30px;
		}
		#second {
			width:900px;
			height:50px;
			margin:auto;
		}
		#second #left{
			float:left;
		}
		#second #right{
			float:right;
		}
	</style>
</head>
<body>
	<div id="first">
		친구추천을 하면 1억을 드립니다
	</div>
	<div id="second">
		<div id="left">로고 <%=application.getAttribute("name") %></div>
		<div id="right">
			<%
						
			if(session.getAttribute("userid")==null)
			{
			%>
			<a href="login.jsp">로그인</a>
			<%
			}
			else
			{
			%>
			<%=session.getAttribute("userid") %>님 환영합니다 
			<a href="logout.jsp">로그아웃</a>
			<%
			}
			%> 
		</div>
	</div>
</body>
</html>