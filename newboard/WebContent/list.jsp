<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
	
	String sql = "select * from newboard order by id desc";
	
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
<h1>게시판 리스트</h1>
<table>
	<tr>
		<th>이름</th>
		<th>제목</th>
		<th>내용</th>
		<th>나이</th>
		<th colspan="2"></th>
	</tr>
	<%
	while(rs.next())
	{
	%>
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("title") %></td>
		<td><%=rs.getString("content") %></td>
		<td><%=rs.getString("age") %></td>
		<td><a href="update.jsp?id=<%=rs.getString("id")%>">수정</a></td>
		<td><a href="delete.jsp?id=<%=rs.getString("id")%>">삭제</a></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="6"><a href="write.jsp">작성</a></td>
	</tr>
</table>
</body>
</html>