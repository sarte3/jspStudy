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

	String cla=request.getParameter("cla");
	String sql="";
	
	if(cla!=null)
	{
		sql = "select id, name, kor, eng, mat, sci, writedate, kor + eng + mat + sci sum, round((kor + eng + mat + sci) / 4, 2) avg from sung order by "+cla+" desc";
	}
	else
	{
		sql = "select * from sung order by name asc";
	}
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);

	
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type="text"] {
	width: 50px;
}
td {
	width: 100px;
}
</style>
</head>
<body>
<h1>성적 입력</h1>
<form name="input" action="input_ok.jsp">
이름 <input type="text" name="name">
국어 <input type="text" name="kor">
영어 <input type="text" name="eng">
수학 <input type="text" name="mat">
과학 <input type="text" name="sci">
<input type="submit" value="성적 입력"><input type="reset" value="다시 작성">
</form>
<h1>성적표</h1>
<table>
	<tr>
		<th>이름</th>
		<th><a href="sung_view.jsp?cla=kor">국어</a></th>
		<th><a href="sung_view.jsp?cla=eng">영어</a></th>
		<th><a href="sung_view.jsp?cla=mat">수학</a></th>
		<th><a href="sung_view.jsp?cla=sci">과학</a></th>
		<th><a href="sung_view.jsp?cla=sum">총점</a></th>
		<th><a href="sung_view.jsp?cla=avg">평균</a></th>
		<th>작성일</th>
	</tr>
	<%
	while(rs.next())
	{
		double kor = rs.getDouble("kor");
		double eng = rs.getDouble("eng");
		double mat = rs.getDouble("mat");
		double sci = rs.getDouble("sci");
		
		double sum = rs.getDouble("sum");
		double avg = rs.getDouble("avg");
		
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
</table>
</body>
</html>