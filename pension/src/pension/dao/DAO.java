package pension.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import pension.dto.MemberDTO;
import pension.dto.ReserveDTO;
import pension.dto.RoomDTO;

public class DAO {

	String driver="com.mysql.jdbc.Driver";
	String db="jdbc:mysql://localhost:3306/pension";
    String userid="root";
    String pw="1234";
    Connection conn = null;
    
	public DAO() throws Exception
	{
    	Class.forName(driver);
    	conn = DriverManager.getConnection(db, userid, pw);
	}

	//room 테이블의 전체 목록을 가져오기
	public ArrayList<RoomDTO> get_room() throws Exception
	{
		/*
		String sql = "select name, id from room order by price asc";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<String> list = new ArrayList<String>();
		
		while(rs.next())
		{
			list.add(rs.getString("name"));
		}
		*/
		
		String sql = "select name, id from room order by price asc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<RoomDTO> list = new ArrayList<RoomDTO>();
		
		while(rs.next()) 
		{
			RoomDTO rdto=new RoomDTO();
			rdto.setId(rs.getInt("id"));
			rdto.setName(rs.getString("name"));
			
			list.add(rdto);
		}
		
		return list;
	}
	
	// 사용자가 선택한 방의 정보를 가져오기
	public RoomDTO select_room(String id) throws Exception
	{
		String sql = "select * from room where id="+id;
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		rs.next();
		
		RoomDTO rdto = new RoomDTO();
		
		rdto.setId(rs.getInt("id"));
		rdto.setMax(rs.getInt("max"));
		rdto.setMin(rs.getInt("min"));
		rdto.setName(rs.getString("name"));
		rdto.setPrice(rs.getInt("price"));
		
		return rdto;
	}
	
	public void insert(ReserveDTO rdto, String userid) throws Exception //reserve 테이블에 입력값을 넣기
	{
		//쿼리 생성		
		String outday = "date_add('"+rdto.getInday()+"', interval "+rdto.getSuk()+" day)";
		String sql = "insert into reserve(rid, name, phone, inday, outday, "
				+ "inwon1, inwon2, inwon3, bbq, pork, suk_price, etc_price, tot_price, writeday, userid) "
				+ "values(?, ?, ?, ?, "+outday+", ?, ?, ?, ?, ?, ?, ?, ?, now(), ?)";
		
		//date_add('2021-01-05', interval suk day)
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rdto.getRid());
		pstmt.setString(2, rdto.getName());
		pstmt.setString(3, rdto.getPhone());
		pstmt.setString(4, rdto.getInday());
		pstmt.setInt(5, rdto.getInwon1());
		pstmt.setInt(6, rdto.getInwon2());
		pstmt.setInt(7, rdto.getInwon3());
		pstmt.setInt(8, rdto.getBbq());
		pstmt.setInt(9, rdto.getPork());
		pstmt.setInt(10, rdto.getSuk_price());
		pstmt.setInt(11, rdto.getEtc_price());
		pstmt.setInt(12, rdto.getTot_price());
		pstmt.setString(13, userid);
		
		pstmt.executeUpdate();
		
		System.out.println(sql);
		
		conn.close();
	}
	
	public ReserveDTO get_reserve(String userid) throws Exception
	{
		String sql = "select * from reserve where userid='"+userid+"' order by id desc limit 1";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		rs.next();
		
		ReserveDTO rdto=new ReserveDTO();
		
		rdto.setBbq(rs.getInt("bbq"));
		rdto.setEtc_price(rs.getInt("etc_price"));
		rdto.setId(rs.getInt("id"));
		rdto.setInday(rs.getString("inday"));
		rdto.setInwon1(rs.getInt("inwon1"));
		rdto.setInwon2(rs.getInt("inwon2"));
		rdto.setInwon3(rs.getInt("inwon3"));
		rdto.setName(rs.getString("name"));
		rdto.setOutday(rs.getString("outday"));
		rdto.setPhone(rs.getString("phone"));
		rdto.setPork(rs.getInt("pork"));
		rdto.setRid(rs.getInt("rid"));
		rdto.setSuk_price(rs.getInt("suk_price"));
		rdto.setTot_price(rs.getInt("tot_price"));
		rdto.setWriteday(rs.getString("writeday"));
		
		return rdto;
		
	}
	
	public int room_state(String rid, String xday) throws Exception
	{
		String sql = "select count(*) cnt from reserve where inday <= ? and outday > ? and rid=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, xday);
		pstmt.setString(2, xday);
		pstmt.setString(3, rid);
		
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		return rs.getInt("cnt");
	}

	public int suk_check(String y, String m, String d, String rid) throws Exception
	{
		int yy=Integer.parseInt(y);
		int mm=Integer.parseInt(m);
		int dd=Integer.parseInt(d);
		int chk = 0;
		
		LocalDate inday = LocalDate.of(yy, mm, dd);
		
		for(int i=1;i<=8;i++) {
			LocalDate xday=inday.plusDays(i);
			String sql="select * from reserve where inday <= ? and outday > ? and rid = ?";
			chk=i;
			
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, xday.toString());
			pstmt.setString(2, xday.toString());
			pstmt.setString(3, rid);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) 
			{
				break;
			}
		
		}
		
		return chk;
	}
	
	public void member_ok(MemberDTO mDTO) throws Exception
	{
		String sql = "insert into member(name, userid, pwd, phone, writeday) "
				+ "values(?, ?, ?, ?, now())";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mDTO.getName());
		pstmt.setString(2, mDTO.getUserid());
		pstmt.setString(3, mDTO.getPwd());
		pstmt.setString(4, mDTO.getPhone());
		
		pstmt.executeUpdate();
		
		conn.close();
	}
	
	
	
	public boolean isMember(String userid, String pwd) throws Exception 
	{
		String sql = "select * from member where userid=? and pwd=?";
		
		PreparedStatement pstmt= conn.prepareStatement(sql);
		
		pstmt.setString(1, userid);
		pstmt.setString(2, pwd);
		
		ResultSet rs=pstmt.executeQuery();
		
		return rs.next();
		
	}
	
	public int isUserid(String userid) throws Exception 
	{
		//아이디가 존재하면 1, 아니면 0
		String sql="select count(*) as num from member where userid='"+userid+"'";
		
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		rs.next();
		
		return rs.getInt("num");
	}

	public MemberDTO mypage(String userid) throws Exception
	{
		String sql = "select * from member where userid='"+userid+"'";
		
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		rs.next();
		
		MemberDTO mDTO = new MemberDTO();
		
		mDTO.setId(rs.getInt("id"));
		mDTO.setName(rs.getString("name"));
		mDTO.setPhone(rs.getString("phone"));
		mDTO.setPwd(rs.getString("pwd"));
		mDTO.setUserid(rs.getString("userid"));
		mDTO.setWriteday(rs.getString("writeday"));
		
		return mDTO;
	}
	
	public ArrayList<ReserveDTO> my_reserve(String userid) throws Exception
	{
		String sql = "select r2.name, r1.inday, r1.outday, r1.bbq, r1.pork, r1.writeday from reserve r1, room r2 where r1.rid=r2.id and userid='"+userid+"'";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<ReserveDTO> list = new ArrayList<ReserveDTO>();
		
		while(rs.next()) 
		{
		
			ReserveDTO rdto=new ReserveDTO();
			
			rdto.setBbq(rs.getInt("bbq"));
			rdto.setInday(rs.getString("inday"));
			rdto.setOutday(rs.getString("outday"));
			rdto.setPork(rs.getInt("pork"));
			rdto.setWriteday(rs.getString("writeday"));
			rdto.setRname(rs.getString("name"));
			
			list.add(rdto);
		}
		return list;
	}
	
	// 아이디 찾기
	public String userid_search(String name, String phone) throws Exception
	{
		String sql = "select userid from member where name=? and phone=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) 
		{
			return rs.getString("userid");
		}
		else 
		{
			return "0";
		}
	}
	
	// 비밀번호 찾기
	public String pwd_search(String name, String phone, String userid) throws Exception
	{
		String sql = "select pwd from member where name=? and phone=? and userid=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, userid);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) 
		{ 
			return rs.getString("pwd");
		}
		else
		{
			return "0";
		}
	}
	
	// 관리자가 reserve테이블에서 읽어오기
	public ArrayList<ReserveDTO> admin_reserve() throws Exception
	{
		String sql = "select r2.name rname, r1.name, r1.phone, r1.inday, r1.outday, r1.bbq, r1.pork, r1.writeday from reserve r1, room r2 where r1.rid=r2.id order by r1.id desc";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		ArrayList<ReserveDTO> list = new ArrayList<ReserveDTO>();
		
		while(rs.next()) 
		{
		
			ReserveDTO rdto=new ReserveDTO();
			
			rdto.setName(rs.getString("name"));
			rdto.setPhone(rs.getString("phone"));
			rdto.setBbq(rs.getInt("bbq"));
			rdto.setInday(rs.getString("inday"));
			rdto.setOutday(rs.getString("outday"));
			rdto.setPork(rs.getInt("pork"));
			rdto.setWriteday(rs.getString("writeday"));
			rdto.setRname(rs.getString("rname"));
			
			list.add(rdto);
		}
		return list;
	}
}
