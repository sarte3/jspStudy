<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn= DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
    
    // request되는 값을 가져오기
    request.setCharacterEncoding("utf-8");
    String title = request.getParameter("title");
    String name = request.getParameter("name");
    String content = request.getParameter("content");
    String pwd = request.getParameter("pwd");
    
    // grp, seq, depth => 질문글이므로 seq, depth는 기본값을 이용하면 되고 grp만 구하면 됨
    String sql = "select ifnull(max(grp), 0) grp from qna";
    
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    
    rs.next();
    int grp = rs.getInt("grp")+1;
    
    //질문 글 저장하기 위한 쿼리 생성
    sql = "insert into qna(title, name, content, pwd, grp, writeday) "+
    	"values (?, ?, ?, ?, ?, now())";
    
    // 심부름꾼 생성
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, title);
    pstmt.setString(2, name);
    pstmt.setString(3, content);
    pstmt.setString(4, pwd);
    pstmt.setInt(5, grp);
    
    // 쿼리 실행
    pstmt.executeUpdate();
    
    // 이동 -> list
    response.sendRedirect("list.jsp");
    
    conn.close();
    
%>