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

	// request 값 가져오기
	String anju=request.getParameter("anju"); //필드의 이름과 동일한 값이 온다
	
	// 쿼리 작성(0~6까지의 값에 따라 쿼리문이 달라진다)
	String sql = "update vote set "+anju+"="+anju+"+1 where id=1";

	/* 	String sql="";
	switch(Integer.parseInt(anju)+1)
	{
		case 1:sql="update vote set a1=a1+1 where id=1";break;
		case 2:sql="update vote set a2=a2+1 where id=1";break;
		case 3:sql="update vote set a3=a3+1 where id=1";break;
		case 4:sql="update vote set a4=a4+1 where id=1";break;
		case 5:sql="update vote set a5=a5+1 where id=1";break;
		case 6:sql="update vote set a6=a6+1 where id=1";break;
		case 7:sql="update vote set a7=a7+1 where id=1";break;
	} */
	
	Statement stmt=conn.createStatement();
	
	stmt.executeUpdate(sql);
	
	
	// 이동 => 결과보기 => vote_view.jsp
	response.sendRedirect("vote_view.jsp");
%>