package com.bitcamp.mm.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;

@Service("deleteService")
public class MemberDeleteService implements MemberService {

	@Autowired
	private MemberJdbcTemplateDao dao;
	
	public int deleteMember(int id) {
		
		return dao.deleteMember(id);		
	}
	
	/* 이전방식  
	 * -------------------------------
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
	-------------------------------
	이전방식 */

}
