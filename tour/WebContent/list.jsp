<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번

	String sql = "select * from tour order by id desc";
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>이름</td>
		<td>제목</td>
		<td>사진</td>
		<td>작성일</td>
	</tr>
	<%
	while(rs.next())
	{
	%>
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("title") %></td>
		<td><img src="img/<%=rs.getString("fname")%>" width="200" height="300"></td>
		<td><%=rs.getString("writeday") %></td>
	</tr>
	<%
	}
	%>
</table>
</body>
</html>