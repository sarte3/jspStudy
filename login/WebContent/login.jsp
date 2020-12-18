<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chk = request.getParameter("chk");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#login {
		width:400px;
		height:300px;
		margin:auto;
		margin-top:150px;
		border: 1px solid #bbbbbb;
		padding-top:30px;
		padding-left:50px;
	}
	#login input {
		width:350px;
		height:40px;
		border:1px solid green;
		font-size:20px;
		
	}
	#login #submit{
		width:355px;
		height:43px;
		
	}
	#msg {
		color:red;
	}
</style>
</head>
<body>
	<div id="login">
		<form method="post" action="login_ok.jsp">
			<input type="text" name="userid" placeholder="아이디"><p>
			<input type="password" name="pwd" placeholder="비밀번호"><p>
			<%
			if(chk==null)
			{ 
			%>
				<span id="msg"></span>
			<%
			}
			else
			{
			%>
				<span id="msg">아이디와 비밀번호를 확인해주세요</span>
			<%
			}
			%>
			<input type="submit" value="로그인" id="submit">
			
		</form>
	</div>
</body>
</html>