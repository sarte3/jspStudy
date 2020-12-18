<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 쿠키를 읽어오기
	Cookie[] cookie = request.getCookies();
	
	for(int i=0;i<cookie.length;i++)
	{
		out.print(cookie[i].getName()+" : ");
		out.print(cookie[i].getValue());
		out.print("<br>");
	}
%>
<form method="post" action="server_cookie_del.jsp">
	삭제할 쿠키명 <input type="text" name="cname">
	<input type="submit" value="쿠키삭제">
</form>
<hr>
<form method="post" action="server_cookie_add.jsp">
	생성할 쿠기명 <input type="text" name="cname"><br>
	쿠키의 값 <input type="text" name="cvalue"><br>
	<input type="submit" value="쿠키생성">
</form>
</body>
</html>