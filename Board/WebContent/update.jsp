<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB연결
  	Class.forName("com.mysql.jdbc.Driver");
  	
  	String db = "jdbc:mysql://localhost:3306/pkc";
  	String userid = "root";
  	String pw = "1234";
  	Connection conn = DriverManager.getConnection(db, userid, pw); //db정보, 아이디, 비번


  	// request값 읽어오기
  	String id = request.getParameter("id");
  	
  	// 쿼리 생성
  	String sql = "select * from board where id="+id;
  	
  	// 심부름꾼
  	Statement stmt = conn.createStatement();
  	
  	// 쿼리 실행 -> ResultSet
  	ResultSet rs = stmt.executeQuery(sql);
  	
  	rs.next();
  	


  	
%>
<!DOCTYPE html>
<html>
<head>
<style>
	#btn {
		width:150px;
		height:40px;
		border:1px solid #f15657;
		background:#f15657;
		color:white;
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<form method="post" action="update_ok.jsp">
	<input type="hidden" name="id" value="<%=id%>">
	<table class="table" width="600" align="center">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%=rs.getString("title")%>"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="40" rows="5" name="content"><%=rs.getString("content") %></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd">
			<%
				if(request.getParameter("chk")!=null)
				{
			%>
				<span>비번이 틀렸어요</span>
			<%
				}
			%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button id="btn">수정하기</button>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>
<%
	rs.close();
	conn.close();
%>