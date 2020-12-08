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
   
    request.setCharacterEncoding("utf-8");
    
    // limit에 들어갈 index 번호 생성
    int index; // limit에 전달할 index 값
    int pager; // 현재 나타내고자 하는 페이지 값을 저장
    if(request.getParameter("pager")==null)
    {
    	pager=1;
    }
    else
    {
    	pager = Integer.parseInt(request.getParameter("pager"));
    }
    //인덱스 만들기
    index = (pager-1)*10;
    
	// 쿼리 생성
	// 아무거나 => 검색 조건이 없다..
	
	// 검색 필드와 검색단어의 값을 request 합니다
	
	String sql = null;
	
	if(request.getParameter("cla")==null)
	{
		sql = "select * from gesipan where order by id desc limit "+index+", 10";
	}
	else
	{
		String cla = request.getParameter("cla"); // 검색필드
		String sword = request.getParameter("sword"); // 검색 단어
	
		if(cla.equals("name"))
		{
			// name 필드를 검색
			sql = "select * from gesipan where name like '%"+sword+"%' order by id desc limit "+index+", 10";
		}
		else
		{
			// title 필드를 검색
			sql = "select * from gesipan where title like '%"+sword+"%' order by id desc limit "+index+", 10";
		}
	}
    // 심부름꾼생성
	Statement stmt = conn.createStatement();
	
	// 쿼리실행 => ResultSet
	ResultSet rs = stmt.executeQuery(sql);
%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a {
		text-decoration: none;
		color: black;
	}
	a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
	<!-- 필드와 검색 단어를 입력할 폼태그 -->
	<div align="center">
		<form method="post" action="list.jsp">
			<select name="cla">
				<option value="name">이름</option>
				<option value="title">제목</option>
			</select>
			<input type="text" name="sword">
			<input type="submit" value="검색">
		</form>
	</div>
	
	<!-- 레코드 내용 출력-->
	<table width="600" align="center">
	<tr>
		<td> 이름</td>
		<td> 제목</td>
		<td> 성별</td>
		<td> 작성일</td>		
	</tr>
	<%
	while(rs.next())
	{
		//숫자로 된 성별을 문자로 변환
		String sung=null;
		switch(rs.getInt("sung"))
		{
			case 0: sung="남자"; break;
			case 1: sung="여자"; break;
			case 2: sung="선택안함"; break;
			
		}
		
	%>
	<tr>
		<td><%=rs.getString("name") %></td>
		<td><a href="content.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title") %></a></td>
		<td><%=sung%></td>
		<td><%=rs.getString("writeday") %></td>
	</tr>
	<%
	}
	%>
	<tr><!-- 사용자가 클릭하여 이동할 수 있는 페이지 출력 -->
		<td colspan="4" align="center">
		<%
			/* int pstart = (pager/10)*10+1;
			if(pager%10==0)
			{
				pstart=((pager/10)-1)*10+1;
			} */
			// 총 페이지값 구하기 총 레코드 수/페이지당 레코드 수+1
			sql = "select count(*) as cnt from gesipan";
			ResultSet rs2 = stmt.executeQuery(sql);
			rs2.next();
			int page_cnt = rs2.getInt("cnt")/10+1;
			if(rs2.getInt("cnt")%10 == 0) page_cnt--;
			
			
			int pstart = 1;
			
			pstart = pager/10;
			if(pager%10 == 0)
			{
				pstart=pstart-1;	
			}

			pstart = Integer.parseInt(pstart+"1");
		
			int pend = pstart + 9;
			if(pend>page_cnt)pend = page_cnt;
			
			%>
			<!-- 이전페이지 -->
			<!-- 현재 페이지 그룹 이전 10페이지 -->
			<%
			if(pstart!=1)
			{
				
			%>
			<a href="list.jsp?pager=<%=pstart-1%>">◀◀</a>
			<%
			}
			else
			{
			%>
			◀◀
			<%	
			}
			
			if(pager!=1)
			{
			%>
			<!-- 현재페이지 기준 1페이지 이전 -->
			<a href="list.jsp?pager=<%=pager-1%>">◀</a>
			<%
			}
			else
			{
			%>
			◀
			<%		
			}
						
			for(int i = pstart;i <= pend;i++)
			{
				String str="";
				
				if(pager==i)
				{
					str="\"style='color:red;'\"";
				}
				
				
			%>
				<a href="list.jsp?pager=<%=i%> <%=str %>" ><%=i %></a>	
			<%	
			}
			%>
			<!-- 다음페이지 -->
			<!-- 현재페이지 기준 1페이지 이후 -->
			<%
			if(pager!=page_cnt)
			{
			%>
			<a href="list.jsp?pager=<%=pager+1%>">▶</a>
			<%
			}
			else
			{
			%>
			▶
			<%
			}
			%>
			<!-- 현재페이지 기준 다음 그룹으로 이동 -->
			<%
			if(page_cnt!=pend)
			{
			%>
			<a href="list.jsp?pager=<%=pend+1%>">▶▶</a>
			<%
			}
			else
			{
			%>
			▶▶
			<%
			}
			%>
		</td>
	</tr>
	<tr>
		<td colspan="4"> <a href="write.jsp">글쓰기</a></td>
	</tr>
	</table>
</body>
</html>