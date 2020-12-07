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

	String sql = "select * from sung";
	
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
<h1>성적표</h1>
<table>
	<tr>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>과학</th>
		<th>작성일</th>
	</tr>
	<%
	while(rs.next())
	{
	%>
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("kor") %></td>
		<td><%=rs.getString("eng") %></td>
		<td><%=rs.getString("mat") %></td>
		<td><%=rs.getString("sci") %></td>
		<td><%=rs.getString("writedate") %></td>
	</tr>
	<%
	}
	%>
</table>
</body>
</html>