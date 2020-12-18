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

	String sql = "select hakbun, name, birth, phone from student order by name asc";
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>학생 정보 </h1>
<table>
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>연락처</th>
	</tr>
	<%
	while(rs.next())
	{
	%>
	<tr>
		<td><%=rs.getString("hakbun") %></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("birth") %></td>
		<td><%=rs.getString("phone") %></td>
	</tr>
	<%
	}
	%>
	<tr>
		<td colspan="4"><a href="stu_input.jsp">학생 정보 입력</a></td>
	</tr>
</table>

</body>
</html>