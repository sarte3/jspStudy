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

  	//request는 필요 없음
  	
	//쿼리 생성
	String sql="select * from board order by id desc";
		 s
	//심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//쿼리 실행 후 결과를 ResultSet으로
	ResultSet rs = pstmt.executeQuery();
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.dataRow:hover {
		/* rgb 3자리 r - 0~15 : 색상을 16단계로 나눈다 16 * 16 * 16가지 색상을 나타낸다
		   rgb 6자리 r - 0~255 : 색상을 256단계로 나눈다 256 * 256 * 256가지 색상을 나타낸다 */
		background: #ddd;
		cursor: pointer;
	}
</style>
</head>
<body>
<div class="container">
<h1>게시판</h1>
<!-- 제목, 작성자, 조회수, 날짜 -->
<table class="table">
	<tr>
		<th>작성자</th>
		<th>제목</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	<%
		while(rs.next())
		{
	%>
	
	<tr class="dataRow">
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("title") %></td>
		<td><%=rs.getString("readnum") %></td>
		<td><%=rs.getString("writeday") %></td>
	</tr>
	<script>
	$(function(){ //onready - html - body 부분의 내용이 다 로딩되면 동작되도록 한다
		// 데이터 한줄 클릭하면 글보기로 이동되는 이벤트 처리
		$('.dataRow').click(function(){
		//location.href = 'view.jsp';
		
			location = 'content.jsp?id='+<%=rs.getString("id")%>;
		})
	})
	</script>
	<%
		}
	%>
</table>
</div>
</body>
</html>