<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% System.out.println("/board/list.jsp"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 라이브러리 등록 jQuery, Bootstrap : CDN 방식 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>게시판 리스트</title>
<style type="text/css">
	.dataRow:hover {
		/* rgb 3자리 r - 0~15 : 색상을 16단계로 나눈다 16 * 16 * 16가지 색상을 나타낸다
		   rgb 6자리 r - 0~255 : 색상을 256단계로 나눈다 256 * 256 * 256가지 색상을 나타낸다 */
		background: #ddd;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function(){ //onready - html - body 부분의 내용이 다 로딩되면 동작되도록 한다
		// 데이터 한줄 클릭하면 글보기로 이동되는 이벤트 처리
		$('.dataRow').click(function(){
			//location.href = 'view.jsp';
			location = 'view.jsp';
		})
	})
</script>
</head>
<body>
<div class="container">
<h1>게시판 리스트</h1>
<table class="table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<tr class="dataRow">
		<td>10</td>
		<td>JSP란?</td>
		<td>이영환</td>
		<td>2020.11.20</td>
		<td>5</td>						
	</tr>
	<tr class="dataRow">
		<td>9</td>
		<td>빅데이터란?</td>
		<td>김경선</td>
		<td>2020.11.19</td>
		<td>15</td>						
	</tr>	
	<tr>
		<td colspan="5">
			<a href="writeForm.jsp" class="btn btn-default">글쓰기</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>