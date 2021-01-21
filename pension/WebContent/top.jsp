<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin:0px;
	}

	#first { /* 광고 관련 1층 */
		width:1100px;
		height: 40px;
		background: #f15657;
		margin: auto;
		text-align: center;
		line-height: 40px;
	}
	#second { /*로고, 메뉴 2층 */
		width:1100px;
		height: 80px;
		margin: auto;
	}
	
	#second #left {
		width: 90px;
		float:left;
		line-height: 80px;
		padding-left:10px;
	}
	
	#second #right {
		width: 900px;
		float:right;
		text-align: right;
		line-height: 80px;
	}
	
	#second #right #menu.login
	{
		width:250px;
	}
	
	#second #right #menu{
		display:inline-block;
    	width:100px;
    	padding:0px 10px;
    	position: relative;	
    	text-align: center;
	}
	
	#second #right #menu .sub{
		position: absolute;
		top:64px;
		left:0px;
		line-height: 30px;
		background:white;
		padding:10px;
		visibility: hidden;
	}
	
	#second #right #menu .sub li{
		display:inline-block;
		list-style-type: none;
		text-align: center;
		width: 100px;
	}
	
	

</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function view_sub(i)
	{
		document.getElementsByClassName('sub')[i].style.visibility='visible';
	}
	
	function hide_sub(i)
	{
		document.getElementsByClassName('sub')[i].style.visibility='hidden';		
	}
	
	var h = 40;
	
	/* function first_close() //1번 호출되면 1층의 높이가 1px 줄어든다
	{
		h--;
		document.getElementById('first').style.height=h+"px";
		
		if(h>0)
			setTimeout(first_close, 10);
		if(h==0)
			document.getElementById('first').style.display='none';
			
	} */
	
	$(function(){
		$("#ff").click(function(){
		    $("#first").slideUp();
		    		
		});
	});
</script>
</head>
<body>
	<div id="first">
		저희 펜션에 회원가입하시면 1박 공짜로 해드립니다! 
		<span id="ff" style="cursor:pointer;">X</span>
	</div>
	<div id="second">
		<div id="left">Kei팬션</div>
		<div id="right">
			<span id="menu" onmouseenter="view_sub(0)" onmouseleave="hide_sub(0)">팬션소개
				<ul class="sub">
					<li><a href="../sogae/sogae.jsp">우리 팬션</a></li>
					<li>오시는 길</li>
				</ul>
			</span>
			<span id="menu" onmouseenter="view_sub(1)" onmouseleave="hide_sub(1)">주변시설
				<ul class="sub">
					<li>만리포</li>
					<li>연포</li>
					<li>채석정</li>
				</ul>
			</span>
			<span id="menu" onmouseenter="view_sub(2)" onmouseleave="hide_sub(2)">예약관련
			<!-- 주메뉴는 position:relative, 부메뉴 position:absolute  -->
			<!-- 부메뉴 -->
				<ul class="sub">
					<li>예약 규정</li>
					<li><a href="../reserve/reserve.jsp">실시간 예약</a></li> <!-- reserve/reserve.jsp -->
				</ul>
			</span>
			<span id="menu" onmouseenter="view_sub(3)" onmouseleave="hide_sub(3)">커뮤니티
				<ul class="sub">
					<li>여행 후기</li>
					<li>자유 게시판</li>
				</ul>
			</span>
			<span id="menu" class="login">
				<!-- 로그인 전 -->
				<c:if test="${userid == null }">
					<a href="../login/login.jsp">로그인</a>
				</c:if>
				<!-- 관리자 로그인 한 경우 -->
				<c:if test="${userid == 'admin' }">
					<a href="../admin/reserve_view.jsp">예약관리</a> / 
					<a href="../admin/member_view.jsp">회원관리</a> / 
					<a href="../login/logout.jsp">로그아웃</a>
				</c:if>
				<!-- 로그인 후 -->
				<c:if test="${userid != null and userid != 'admin'}">
					${name}님 환영 <a href="../mypage/mypage.jsp">내정보</a> <a href="../login/logout.jsp">로그아웃</a>
				</c:if>
				
			</span>
		</div>
	</div>	