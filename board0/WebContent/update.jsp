<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB 연결
  	Class.forName("com.mysql.jdbc.Driver");
  	
  	String db = "jdbc:mysql://localhost:3306/pkc";
  	String userid = "root";
  	String pw = "1234";
  	Connection conn = DriverManager.getConnection(db, userid, pw); //db정보, 아이디, 비번
	
  	//조건문에 들어갈 id값을 request
  	String id = request.getParameter("id");
  	
  	//쿼리 생성
  	String sql = "select * from member where id="+id;
  	
  	//심부름꾼 만들기
  	Statement stmt = conn.createStatement();
  	
  	//쿼리 실행
  	ResultSet rs = stmt.executeQuery(sql); // select는 executeQuery()
  	
  	rs.next();
  	
  	// 사용자가 클릭한 레코드의 값을 읽어 와서 폼 태그에 value에 전달
%>
<!DOCTYPE html>
<html>
<head> <!-- write.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function check(my) //my==documnet.pkc
{	// form 태그 -> form 객체 접근 body에 있는 태그 id(단수), class(복수)
	if(my.name.value.length<3||my.name.value.length>5)
	{
		alert("이름을 똑바로 적으세요");
		return false;
	}
	else if(isNaN(my.age.value)||my.age.value.length==0)
	{
		alert("나이는 숫자로!!");
		return false;
	}
	else if(my.juso.value.length<2)
	{
		alert("주소는 2자 이상");
		return false;
	}
	else
	{
		return true;
	}
}


/* $(function(){
	$('#name').blur(function(){
		if($(this).val().length<3||$(this).val().length>5){
			alert('아이디는 3자 이상 5자 이하입니다');
		
		}
	})
	
	$('#age').keypress(function(e){
		if(e.keyCode < 48 || e.keyCode > 57){
			alert('나이는 숫자만 입력하세요');
			return false;
			
		}
	})
	
	
	$('#juso').blur(function(){
		if($(this).val().length<2){
			alert('주소는 2자 이상입니다');
		
		}
	})
		
}) */
</script>
</head>
<body>
<form name="pkc" method="post" action="update_ok.jsp" onsubmit="return check(this)">
<!-- 이름은 3자 이상 5자 이하, 나이는 숫자인가, 주소는 2자 이상 되면 전송하기-->
	이름 <input type="text" name="name" id="name" value="<%=rs.getString("name") %>"><p>
	나이 <input type="text" name="age" id="age" value="<%=rs.getString("age")%>"><p>
	주소 <input type="text" name="juso" id="juso" value="<%=rs.getString("juso") %>"><p>
	<input type="hidden" name="id" value="<%=id %>">
	<input type="submit" value="수정">
</form>
</body>
</html>