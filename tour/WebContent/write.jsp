<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="write_ok.jsp" enctype="multipart/form-data">
		<table width="500" align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" size="50"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="3" name="content"></textarea></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="fname"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="후기남기기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>