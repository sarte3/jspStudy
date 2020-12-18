<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 투표하기 -->
	<form method="post" action="vote_ok.jsp">
	당신이 좋아하는 안주는?<br>
		<input type="radio" name="anju" value="a1">대방어<br>
		<input type="radio" name="anju" value="a2">돌돔<br>
		<input type="radio" name="anju" value="a3">감성돔<br>
		<input type="radio" name="anju" value="a4">참돔<br>
		<input type="radio" name="anju" value="a5">벵애돔<br>
		<input type="radio" name="anju" value="a6">자리돔<br>
		<input type="radio" name="anju" value="a7">옥돔<br>
		<input type="submit" value="투표하기">
	</form>
</body>
</html>