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
		<th>총점</th>
		<th>평균</th>
		<th>작성일</th>
	</tr>
	<%
	while(rs.next())
	{
		double kor = rs.getDouble("kor");
		double eng = rs.getDouble("eng");
		double mat = rs.getDouble("mat");
		double sci = rs.getDouble("sci");
		
		double sum = kor + eng + mat + sci;
		double avg = Math.round(sum/4.0*100)/100.0;
		
	%>
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><%=kor %></td>
		<td><%=eng %></td>
		<td><%=mat %></td>
		<td><%=sci %></td>
		<td><%=sum %></td>
		<td><%=avg %></td>
		<td><%=rs.getString("writedate") %></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="8"><a href="input.jsp">글쓰기</a></td>
	</tr>
</table>
</body>
</html>