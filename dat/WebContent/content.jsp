<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
	// DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);
	
	//request 값 읽어오기
	String id = request.getParameter("id");
	//쿼리생성
	String sql = "select * from gesipan where id=" +id;	
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	//쿼리실행 => ResultSet에 저장
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	//성별
	String sung=null;
	switch(rs.getInt("sung"))
	{
		case 0 : sung="남자"; break;
		case 1 : sung="여자"; break;
		case 2 : sung="선택안함"; break;
	}
	//취미 구하기 0:낚시, 1:독서, 2:여행, 3:음주, 4:잠자기, 5:게임
	//1. ,로 구분된 필드의 값을 나눠야 된다.. split()
	String[] hobby = rs.getString("hobby").split(","); //2,3,4
	String hob="";
	for(int i = 0; i < hobby.length; i++) {
		
		
		switch(hobby[i]){
		
			case "0": hob = hob + " 낚시"; break;
			case "1": hob = hob + " 독서"; break;
			case "2": hob = hob + " 여행"; break;
			case "3": hob = hob + " 음주"; break;
			case "4": hob = hob + " 잠자기"; break;
			case "5": hob = hob + " 게임"; break;
		
		}
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#delForm {
	display : none;
}
</style>
<script>
	function del()
	{
		document.getElementById("delForm").style.display="block";
	}
	
	function check()
	{
		pwd = "<%=rs.getString("pwd")%>";
		myPwd = document.frm1.pwd.value;
		if(pwd == myPwd)
		{
			return true;
		}
		else
		{
			document.getElementById("msg").innerHTML="비번이 틀렸습니다";
			return false;	
		}
	}
</script>
</head>
<body>
	<!-- 하나의 레코드 내용을 출력 -->
	<table width ="600" align="center">
		<tr>
			<td> 이름 </td>
			<td> <%=rs.getString("name") %></td>
			<td> 성별 </td>
			<td> <%=sung %></td>
			<td> 취미 </td>
			<td> <%=hob %></td>
		</tr>
		<tr>
			<td> 태어난 해</td>
			<td colspan="2"> <%=rs.getString("birth") %></td>
			<td> 작성일</td>
			<td colspan="2"> <%=rs.getString("writeday") %></td>
		</tr>
		<tr>
			<td> 제목 </td>
			<td colspan="5"> <%=rs.getString("title") %></td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td colspan="5"> <%=rs.getString("content") %></td>		
		</tr>
		<tr>
			<td colspan="6" align="center">
			<a href="update.jsp?id=<%=rs.getInt("id") %>">수정</a>
			<a href="#" onclick="del()">삭제</a>
			<a href="list.jsp">목록</a>	
			</td>
		</tr>
		<tr>
			<td colspan="6" align="center">
			<form id="delForm" name="frm1" method="post" action="delete.jsp?id=<%=id%>" onsubmit="return check()">
				비밀번호 <input type="password" name="pwd">
				<input type="submit" value="확인">
				<span id="msg"></span>
			</form>
		</tr>
	</table>
</body>
</html>
