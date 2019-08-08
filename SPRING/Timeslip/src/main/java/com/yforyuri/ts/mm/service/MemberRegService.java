package com.yforyuri.ts.mm.service;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yforyuri.ts.jdbc.ConnectionProvider;
import com.yforyuri.ts.mm.dao.MemberDao;
import com.yforyuri.ts.mm.domain.MemberInfo;
import com.yforyuri.ts.mm.domain.RequestMemberRegist;

@Service("registService")
public class MemberRegService implements MemberService {

	@Autowired
	private MemberDao dao;

	public int memberInsert(HttpServletRequest request, RequestMemberRegist regist) {

		// 서버경로
		String path = "/uploadfile/userphoto"; // 리소스 매핑필요
		// 절대경로
		String dir = request.getSession().getServletContext().getRealPath(path);

		MemberInfo memberInfo = regist.toMemberInfo();

		// 파일이름 생성
		String newFileName = memberInfo.getId()+"_"+regist.getPhoto().getOriginalFilename();

		int resultCnt = 0;
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			regist.getPhoto().transferTo(new File(dir, newFileName));

			memberInfo.setPhoto(newFileName);

			resultCnt = dao.insert(conn, memberInfo);

		} catch (IllegalStateException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return resultCnt;
	}

}