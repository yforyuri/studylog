package com.bitcamp.mm.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;

@Service("deleteService")
public class MemberDeleteService implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	public int memberDelete(int id) {
		
		int rCnt = 0;
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			rCnt = dao.deleteMember(conn, id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rCnt;		
	}

}
