package com.yforyuri.ts.mm.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.yforyuri.ts.jdbc.ConnectionProvider;
import com.yforyuri.ts.mm.dao.MemberDao;
import com.yforyuri.ts.mm.domain.MemberInfo;

@Service("loginService")
public class MemberLoginService implements MemberService{
	
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

}
