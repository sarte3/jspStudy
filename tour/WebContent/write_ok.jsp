<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	//cos.jar 라이브러리를 통해 파일을 업로드시킨다
	String path = "C:/Users/insom/git/jspStudy/tour/WebContent/img";
	int size = 1024*1024*10;
	String han = "utf-8";
	
	MultipartRequest multi=new MultipartRequest(request, path, size, han, new DefaultFileRenamePolicy());
	
	// 폼에 입력된 값을 읽어와서 DB에 저장

%>