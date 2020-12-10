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

	String id = request.getParameter("id");
	
	String sql = "select * from sung where id="+id;
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
	
	double kor = rs.getDouble("kor");
	double eng = rs.getDouble("eng");
	double mat = rs.getDouble("mat");
	double sci = rs.getDouble("sci");
	
	double[] sungs=new double[4];
	sungs[0] = kor;
	sungs[1] = eng;
	sungs[2] = mat;
	sungs[3] = sci;
	
	String[] grades=new String[4];
	
	for(int i=0;i<sungs.length;i++)
	{
		if(sungs[i]>=90)grades[i]="A";
		else if(sungs[i]>=80)grades[i]="B";
		else if(sungs[i]>=70)grades[i]="C";
		else if(sungs[i]>=60)grades[i]="D";
		else grades[i]="F";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>성적 보기</h1>
<table>
	<tr>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>과학</th>
	</tr>
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><%=grades[0] %></td>
		<td><%=grades[1] %></td>
		<td><%=grades[2] %></td>
		<td><%=grades[3] %></td>						
	</tr>
</table>
</body>
</html>