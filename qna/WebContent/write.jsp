<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- 질문글을 만드는 폼 seq, depth, grp가 필요 없음 -->
	<form name="pkc" method="post" action="write_ok.jsp">
		<table align="center" width="600">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pwd"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="4" cols="40" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="질문저장">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>