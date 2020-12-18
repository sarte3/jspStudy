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

	// 사용자의 아이디와, 비번을 request
	
	userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd"); 
	
	// 쿼리를 작성
	String sql = "select * from member2 where userid='"+userid+"' and pwd='"+pwd+"'";
	
	// 쿼리를 실행(심부름꾼)
	Statement stmt = conn.createStatement();
		
	// 실행결과
	ResultSet rs = stmt.executeQuery(sql);
	
	// 아이디랑 비번이 동일한 경우
	if(rs.next())
	{
		// 세션 변수를 부여
		session.setAttribute("userid", userid);
		
		// application 변수에 방금 로그인 한 사용자 아이디 추가(누적)
		String imsi = application.getAttribute("name").toString();
		imsi += " "+userid;
		application.setAttribute("name", imsi);
		
		// 메인페이지(index.jsp)
		response.sendRedirect("index.jsp");
	}
	// 아이디 혹은 비번이 틀린 경우
	else
	{
		
		// login.jsp로 이동하여 다시 로그인 할 수 있게
		response.sendRedirect("login.jsp?chk=1");
		

	}
	
%>