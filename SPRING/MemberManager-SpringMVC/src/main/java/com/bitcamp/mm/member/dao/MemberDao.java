package com.bitcamp.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bitcamp.mm.jdbc.JdbcUtil;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

@Repository("dao")
public class MemberDao {

	public MemberInfo selectMemberById(Connection conn, String userId) {

		MemberInfo memberInfo = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.println("dao : memberId -> " + userId);

		String sql = "select * from member where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs != null && rs.next()) {
				System.out.println("check ::::::::::::::::::::::::");
				memberInfo = new MemberInfo(rs.getInt("idx"), rs.getString("id"), rs.getString("pw"),
						rs.getString("name"), rs.getString("photo"), new Date(rs.getTimestamp("regdate").getTime()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return memberInfo;
	}

	public int insert(Connection conn, MemberInfo mi) {

		int rCnt = 0;

		PreparedStatement pstmt = null;

		String sql = "insert into member (id, pw, name, photo) values (?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mi.getId());
			pstmt.setString(2, mi.getPw());
			pstmt.setString(3, mi.getName());
			pstmt.setString(4, mi.getPhoto());

			rCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rCnt;
	}


	public List<MemberInfo> selectList(Connection conn, int index, int count) {
		
		List<MemberInfo> memberList = new ArrayList<MemberInfo>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member order by idx desc limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			pstmt.setInt(2, count);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				memberList.add(new MemberInfo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), new Date(rs.getDate(6).getTime())));

			
//			while(rs.next()) {
//				MemberInfo mi = new MemberInfo();
//				mi.setIdx(rs.getInt(1));
//				mi.setId(rs.getString(2));
//				mi.setPw(rs.getString(3));
//				mi.setName(rs.getString(4));
//				mi.setPhoto(rs.getString(5));
//				mi.setRegDate(rs.getDate(6));
//				
//				list.add(mi);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	
	public int selectTotalCount(Connection conn, SearchParam searchParam) {

		int totalCnt = 0;

		Statement stmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from member";

		if (searchParam != null) {
			sql = "select count(*) from member where ";
			if (searchParam.getStype().equals("both")) {
				sql += " id like '%"+searchParam.getKeyword()+"%' or name like '%"+searchParam.getKeyword()+"%'";
			}
			if (searchParam.getStype().equals("id")) {
				sql += " id like '%"+searchParam.getKeyword()+"%'";
			}
			if (searchParam.getStype().equals("name")) {
				sql += "name like '%"+searchParam.getKeyword()+"%'";
			}
		}

		try {

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				totalCnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return totalCnt;
	}
//	public int selectCount(Connection conn) {
//	
//	Statement stmt = null;
//	ResultSet rs = null;
//	
//	int totalCnt = 0;
//	
//	String sql = "select count(*) from GUESTBOOK_MESSAGE";
//	
//	try {
//		stmt = conn.createStatement();
//		
//		rs = stmt.executeQuery(sql);
//		
//		if(rs.next()) {
//			totalCnt = rs.getInt(1);
//		}
//	} catch (SQLException e) {
//		e.printStackTrace();
//	}
//	
//			
//	return totalCnt;
//}
	
	
	public List<MemberInfo> selectListById(Connection conn, int index, int count, SearchParam searchParam) {

		List<MemberInfo> memberList = new ArrayList<MemberInfo>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member where id like ?  limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchParam.getKeyword()+"%");
			pstmt.setInt(2, index);
			pstmt.setInt(3, count);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberList.add(new MemberInfo(
						rs.getInt("idx"), 
						rs.getString("id"), 
						rs.getString("pw"), 
						rs.getString("name"), 
						rs.getString("photo"), 
						new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberList;
	}

	public List<MemberInfo> selectListByName(Connection conn, int index, int count, SearchParam searchParam) {

		List<MemberInfo> memberList = new ArrayList<MemberInfo>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member where name like ?  limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchParam.getKeyword()+"%");
			pstmt.setInt(2, index);
			pstmt.setInt(3, count);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberList.add(new MemberInfo(
						rs.getInt("idx"), 
						rs.getString("id"), 
						rs.getString("pw"), 
						rs.getString("name"), 
						rs.getString("photo"), 
						new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberList;
	}

	public List<MemberInfo> selectListByBoth(Connection conn, int index, int count, SearchParam searchParam) {

		List<MemberInfo> memberList = new ArrayList<MemberInfo>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member where id like ? or  name like ?  limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchParam.getKeyword()+"%");
			pstmt.setString(2, "%"+searchParam.getKeyword()+"%");
			pstmt.setInt(3, index);
			pstmt.setInt(4, count);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberList.add(new MemberInfo(
						rs.getInt("idx"), 
						rs.getString("id"), 
						rs.getString("pw"), 
						rs.getString("name"), 
						rs.getString("photo"), 
						new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberList;
	}

	public MemberInfo selectMemberByIdx(Connection conn, int id) {

		MemberInfo memberInfo = null;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.println("dao : memberId -> " + id);
		
		String sql = "select * from member where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs = pstmt.executeQuery();
			if(rs!=null && rs.next()) {
				System.out.println("check -----------------");
				memberInfo = new MemberInfo(
					rs.getInt("idx"), 
					rs.getString("id"), 
					rs.getString("pw"), 
					rs.getString("name"), 
					rs.getString("photo"), 
					new Date(rs.getTimestamp("regdate").getTime()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		
		return memberInfo;
	}

	
	public int deleteMember(Connection conn, int id) {

		int rCnt = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "delete from member where idx=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  id);
			
			rCnt = pstmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return rCnt;
	}
	
	public int editMember(Connection conn, MemberInfo memberInfo) {
		
		int rCnt = 0;
		
		PreparedStatement pstmt = null;
	
		String sql = "update member set name=?, pw=?, photo=? where idx=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberInfo.getName());
			pstmt.setString(2, memberInfo.getPw());
			pstmt.setString(3, memberInfo.getPhoto());
			pstmt.setInt(4, memberInfo.getIdx());
			
			rCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rCnt;
	}
}
