package com.bitcamp.mm.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;
import com.bitcamp.mm.member.domain.MemberInfo;

@Service("loginService")
public class MemberLoginService implements MemberService{
	
	@Autowired
	private MemberJdbcTemplateDao dao;
	
	public boolean login(
			String id, 
			String pw, 
			HttpServletRequest request) {
		
		boolean loginChk = false;
		
		MemberInfo memberInfo = null;

			memberInfo = dao.selectMemberById(id);
			
			if(memberInfo!=null && memberInfo.pwChk(pw)) {
				// 세션에 저장
				// loginChk 상태값을 변경
				request.getSession(true).setAttribute("loginInfo", memberInfo.toLoginInfo());
				loginChk = true;
			}

		return loginChk;
		
	}
	
	
	/* 이전방식 
	@Autowired
	private MemberDao dao;
	
	public boolean login(String id, String pw, HttpServletRequest request ) {
		
		boolean loginChk = false;
		
		MemberInfo memberInfo = null;
		 
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			memberInfo = dao.selectMemberById(conn, id);
			
			if(memberInfo != null && memberInfo.pwChk(pw)) {
				
				request.getSession(true).setAttribute("loginInfo", memberInfo.toLoginInfo());
				loginChk = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

			
		
		return loginChk;
	}
	이전방식  */ 

}
