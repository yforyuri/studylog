package com.yforyuri.ts.mm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.yforyuri.ts.jdbc.JdbcUtil;
import com.yforyuri.ts.mm.domain.MemberInfo;

@Repository("dao")
public class MemberDao {

	public MemberInfo selectMemberById(Connection conn, String userId) {

		MemberInfo memberInfo = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.println("dao : memberId -> " + userId);

		String sql = "select * from timeslip_mm where id=?";

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

		String sql = "insert into timeslip_mm (id, pw, name, photo) values (?,?,?,?)";

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

//	public Member select(Connection conn, int idx) {
//		
//		Member member = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		String sql = "select * from GUESTBOOK_MESSAGE where message_id=?";
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, idx);
//			
//			rs = pstmt.executeQuery(); //객체반환
//			
//			if(rs.next()) {
//				member = new Member();
//				member.setuId(rs.getString(1));
//				member.setuPw(rs.getString(2));
//				member.setuName(rs.getString(3));
//				member.setuPhotoe(rs.getString(4));
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		
//		return member;
//	}
//
//	public int selectCount(Connection conn) {
//		
//		Statement stmt = null;
//		ResultSet rs = null;
//		
//		int totalCnt = 0;
//		
//		String sql = "select count(*) from GUESTBOOK_MESSAGE";
//		
//		try {
//			stmt = conn.createStatement();
//			
//			rs = stmt.executeQuery(sql);
//			
//			if(rs.next()) {
//				totalCnt = rs.getInt(1);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//				
//		return totalCnt;
//	}

	public List<MemberInfo> selectList(Connection conn, int firstRow) {
		
		List<MemberInfo> list = new ArrayList<MemberInfo>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from timeslip_mm order by idx desc limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, firstRow);
//			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				MemberInfo mi = new MemberInfo();
				mi.setIdx(rs.getInt(1));
				mi.setId(rs.getString(2));
				mi.setPw(rs.getString(3));
				mi.setName(rs.getString(4));
				mi.setPhoto(rs.getString(5));
				mi.setRegDate(rs.getDate(6));
				
				list.add(mi);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
//
//	
//	public int deleteMember(Connection conn, int idx) throws SQLException {
//		//preparedStatement 객체 생성
//		int resultCnt = 0;
//		
//		PreparedStatement pstmt = null;
//		
//		String sql = "delete from member where idx=?";
//		
//		try{
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1,  idx);
//			
//			resultCnt = pstmt.executeUpdate();
//			
//		}finally {
//			JdbcUtil.close(pstmt);
//		}
//		return resultCnt;
//	}
}
