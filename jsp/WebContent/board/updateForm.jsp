<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% System.out.println("/board/updateForm.jsp"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>게시판 글수정</title>
<script>
	$(function(){
		$('#cancelBtn').click(function(){
			history.back();
		})
	})
</script>
</head>
<body>
<div class="container">
<h1>게시판 글수정</h1>
<form name="updateForm" action="update.jsp" method="post">
<div class="form-group">
  <label for="no">글번호:</label>
  <input type="text" class="form-control" id="no" name="no" readonly="readonly" value="10">
</div>
<div class="form-group">
  <label for="title">제목:</label>
  <input type="text" class="form-control" id="title" name="title" value="JSP란?">
</div>
<div class="form-group">
  <label for="content">내용:</label>
  <textarea class="form-control" rows="5" id="content" name="content">웹프로그래밍.
자바 기반의 프로그램입니다.</textarea>
</div>
<div class="form-group">
  <label for="writer">작성자:</label>
  <input type="text" class="form-control" id="writer" name="writer" value="이영환">
</div>
<button class="btn btn-default">수정</button>
<button class="btn btn-default" type="reset">다시 입력</button>
<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
</form>
</div>
</body>
</html>