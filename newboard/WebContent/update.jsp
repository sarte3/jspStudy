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

	String id = request.getParameter("id");
	
	String sql = "select * from newboard where id="+id;
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form" method="post" action="update_ok.jsp">
<input type="hidden" name="id" value="<%=id%>">
이름 <input type="text" name="name" value="<%=rs.getString("name")%>"placeholder="이름을 입력하세요"><br>
제목 <input type="text" name="title" value="<%=rs.getString("title") %>"placeholder="제목을 입력하세요"><br>
내용 <textarea name="content" placeholder="내용을 입력하세요"><%=rs.getString("content") %></textarea><br>
나이 <input type="text" name="age" value="<%=rs.getString("age")%>" placeholder="나이를 입력하세요"><br>
<input type="submit" value="작성하기"><input type="reset" value="다시 작성">

</form>
</body>
</html>