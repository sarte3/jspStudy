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

  	//쿼리 생성
	String sql = "select * from board where id="+id;
		 
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	
	//쿼리 실행 후 결과를 ResultSet으로
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
	
	//조회수 증가
	sql = "update board set readnum=readnum+1 where id="+id;
	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	


%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	#del{
		position: absolute;
	 	visibility: hidden;
	}
	#up{
		position: absolute;
	 	visibility: hidden;
	}
	
</style>
<script>
	

	function check()
	{
		if(document.getElementById('up').pwd.value=='<%=rs.getString("pwd")%>')
		{
			return true;
		}
		else
		{
			document.getElementById('msg').innerHTML='비번이 틀렸어요';
			return false;
			
		}
	}
	
	function view_del() 
	{
		//alert(event.clientX+" "+event.clientY)
		var x = event.clientX;
		var y = event.clientY;
		document.getElementById('del').style.visibility="visible";
		document.getElementById('del').style.left=(x-30)+"px";
		document.getElementById('del').style.top=(y+30)+"px";
	}
	function view_up() 
	{
		//alert(event.clientX+" "+event.clientY)
		var x = event.clientX;
		var y = event.clientY;
		document.getElementById('up').style.visibility="visible";
		document.getElementById('up').style.left=(x-30)+"px";
		document.getElementById('up').style.top=(y+30)+"px";
	}
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>게시판 글 보기</h1>
<!-- ResultSet 내용 출력 -->
<table class="table">
	<tr>
		<th>작성자</th>
		<td><%=rs.getString("name") %></td>
		<th>조회수</th>
		<td><%=rs.getString("readnum") %></td>
		<th>작성일</th>
		<td><%=rs.getString("writeday") %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="5"><%=rs.getString("title") %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="5"><%=rs.getString("content") %></td>
	</tr>
	<tr>
		<td colspan="6" align="center">
		<a href="#" onclick="view_up()" >수정</a>
		<a href="#" onclick="view_del()">삭제</a>
		<a href="list.jsp">목록</a><span id="msg"></span></td>
	</tr>
	<%
		if(request.getParameter("chk")!=null)
		{
	%>
	<tr>
		<td colspan="6" align="center">비번이 틀렸네요.</td>
	</tr>
	<%
		}
	%>
</table>
<form method="post" action="delete.jsp" id="del">
비번 <input type="password" name="pwd">
<input type="hidden" value="<%=id%>" name="id">
<input type="submit" value="삭제">
</form>
<form method="post" action="update.jsp" id="up" onsubmit="return check()">
비번 <input type="password" name="pwd" >
<input type="hidden" value="<%=id%>" name="id">
<input type="submit" value="수정">
</form>
</div>
</body>
</html>
<% 
	stmt.close();
	rs.close();	
	conn.close();
%>