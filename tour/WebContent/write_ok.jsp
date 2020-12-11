<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
	//cos.jar 라이브러리를 통해 파일을 업로드시킨다
	String path = "C:/Users/insom/git/jspStudy/tour/WebContent/img";
	int size = 1024*1024*10;
	String han = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, path, size, han, new DefaultFileRenamePolicy());
	
	// 폼에 입력된 값을 읽어와서 DB에 저장
	String title = multi.getParameter("title");
	String name = multi.getParameter("name");
	String content = multi.getParameter("content");
	String fname = multi.getFilesystemName("fname"); // 서버에 저장되는 이름

	/* File file=multi.getFile("fname");
	long fsize=file.length(); */
	
	// multi.getOriginalFileName("fname") 클라이언트에 있던 원래 이름
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번

	String sql = "insert into tour(title, name, content, fname, writeday) values(?, ?, ?, ?, now())";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, title);
	pstmt.setString(2, name);
	pstmt.setString(3, content);
	pstmt.setString(4, fname);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("list.jsp");
%>