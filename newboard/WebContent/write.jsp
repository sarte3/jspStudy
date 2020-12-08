<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form" method="post" action="write_ok.jsp">
이름 <input type="text" name="name" placeholder="이름을 입력하세요"><br>
제목 <input type="text" name="title" placeholder="제목을 입력하세요"><br>
내용 <textarea name="content" placeholder="내용을 입력하세요"></textarea><br>
나이 <input type="text" name="age" placeholder="나이를 입력하세요"><br>
<input type="submit" value="작성하기"><input type="reset" value="다시 작성">

</form>
</body>
</html>