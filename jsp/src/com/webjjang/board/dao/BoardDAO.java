package com.webjjang.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.webjjang.board.dto.BoardDTO;

public class BoardDAO {
	// 오라클 서버에 접속할 정보 정의 - 전역 변수
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "java00";
	String upw = "java00";

	// 게시판 리스트
	public List<BoardDTO> list() {

		//리턴되는 객체
		List<BoardDTO> list = null; //DB에서 가져온 데이터 넣는 객체
		
		// DB 연동해서 사용할 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 실행문 객체
		ResultSet rs = null; // DB에서 데이터를 가져오면 저장하는 객체

		try {
			// 1. 드라이버 확인
			Class.forName(driver);
			// 2. 연결
			con = DriverManager.getConnection(url, uid, upw);
			// 3. 처리할 오라클 문장을 만든다.
			String sql = "select no, title, writer, " 
					+ " to_char(writedate,'yyyy-mm-dd') writedate, hit "
					+ " from board " + " order by no desc";
			// 4. 실행 객체
			pstmt = con.prepareStatement(sql);
			// 5. 실행 -> rs
			//select -> executeQuery() 사용 -> 결과가 resultSet
			//insert, update, delete -> executeUpdate() 사용 --> 결과가 int
			rs = pstmt.executeQuery();
			// 6. 표시
			if (rs != null) {
				while (rs.next()) {
					// list가 null이면 생성해야만 한다, 맨 처음만 생성
					if(list == null)list = new ArrayList<>();
					
					BoardDTO dto = new BoardDTO();
					dto.setNo(rs.getInt("no"));
					dto.setTitle(rs.getString("title"));
					dto.setWriter(rs.getString("writer"));
					dto.setWriteDate(rs.getString("writedate"));
					dto.setHit(rs.getInt("hit"));
					
					list.add(dto);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 오류가 난 경우 오류의 경로와 내용을 출력
		} finally {
			try {
				// 7. 닫기
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		System.out.println("BoardDAO.list : "+list);
		return list;
		
		
		
	}//list() 끝

	// 게시판 글쓰기
	public void write(BoardDTO dto) {
		
		//오라클 서버에 접속할 정보 정의 -> 전역 변수 사용
		
		// DB 연동해서 사용할 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 실행문 객체
		
		try {
			// 1. 드라이버 확인
			Class.forName(driver);
			// 2. 연결
			con = DriverManager.getConnection(url, uid, upw);
			// 3. 처리할 오라클 문장을 만든다.
			String sql = "insert into board(no, title, content, writer) "+
						"values(board_seq.nextval, ?, ?, ?)";
			// 4. 실행 객체 & 데이터 셋팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			
			// 5. 실행 -> rs
			//select -> executeQuery() 사용 -> 결과가 resultSet
			//insert, update, delete -> executeUpdate() 사용 --> 결과가 int
			pstmt.executeUpdate();
			// 6. 표시
			System.out.println("게시판 등록 완료");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 오류가 난 경우 오류의 경로와 내용을 출력
		} finally {
			try {
				// 7. 닫기
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
	} //write() 메소드의 끝
	
	// 게시판 글보기
	public BoardDTO view(int no) {

		//리턴되는 객체
		BoardDTO dto = null; //DB에서 가져온 데이터 넣는 객체
		
		// DB 연동해서 사용할 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 실행문 객체
		ResultSet rs = null; // DB에서 데이터를 가져오면 저장하는 객체

		try {
			// 1. 드라이버 확인
			Class.forName(driver);
			// 2. 연결
			con = DriverManager.getConnection(url, uid, upw);
			// 3. 처리할 오라클 문장을 만든다.
			String sql = "select no, title, content, writer, " 
					+ " to_char(writedate,'yyyy-mm-dd') writedate, hit "
					+ " from board " + " where no=?";
			// 4. 실행 객체 & 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 5. 실행 -> rs
			//select -> executeQuery() 사용 -> 결과가 resultSet
			//insert, update, delete -> executeUpdate() 사용 --> 결과가 int
			rs = pstmt.executeQuery();
			// 6. 표시
			if (rs != null && rs.next()) {
				
					dto = new BoardDTO();
					dto.setNo(rs.getInt("no"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setWriter(rs.getString("writer"));
					dto.setWriteDate(rs.getString("writedate"));
					dto.setHit(rs.getInt("hit"));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 오류가 난 경우 오류의 경로와 내용을 출력
		} finally {
			try {
				// 7. 닫기
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		System.out.println("BoardDAO.dto : "+dto);
		return dto;
		
	}//view() 끝

	// 글보기 시 조회수 1 증가
	public void increaseHit(int no) {
		
		//오라클 서버에 접속할 정보 정의 -> 전역 변수 사용
		
		// DB 연동해서 사용할 객체 선언
		Connection con = null; // 연결 객체
		PreparedStatement pstmt = null; // 실행문 객체
		
		try {
			// 1. 드라이버 확인
			Class.forName(driver);
			// 2. 연결
			con = DriverManager.getConnection(url, uid, upw);
			// 3. 처리할 오라클 문장을 만든다.
			String sql = "update board set hit = hit+1 "+
						"where no=?";
			// 4. 실행 객체 & 데이터 셋팅
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 5. 실행 -> rs
			//select -> executeQuery() 사용 -> 결과가 resultSet
			//insert, update, delete -> executeUpdate() 사용 --> 결과가 int
			pstmt.executeUpdate();
			// 6. 표시
			System.out.println("게시판 글 보기 조회수 1 증가 완료");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); // 오류가 난 경우 오류의 경로와 내용을 출력
		} finally {
			try {
				// 7. 닫기
				if(con!=null)con.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
	} //increaseHit() 메소드의 끝
		
	
}
