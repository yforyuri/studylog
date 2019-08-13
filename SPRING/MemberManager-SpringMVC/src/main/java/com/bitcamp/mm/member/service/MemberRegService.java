package com.bitcamp.mm.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.RequestMemberRegist;

@Service("registService")
public class MemberRegService implements MemberService {

	// Jdbc Template
	@Autowired
	private MemberJdbcTemplateDao dao;

	public int memberInsert(HttpServletRequest request, RequestMemberRegist regist) {

		// 서버경로
		String path = "/uploadfile/userphoto"; // 리소스 매핑필요
		// 절대경로
		String dir = request.getSession().getServletContext().getRealPath(path);

		MemberInfo memberInfo = regist.toMemberInfo();

		// 파일이름 생성
		String newFileName = memberInfo.getId() + "_" + regist.getPhoto().getOriginalFilename();

		int resultCnt = 0;

		try {
			// 파일을 서버의 지정 경로에 저장
			regist.getPhoto().transferTo(new File(dir, newFileName));

			// 데이터베이스 저장을 하기위한 파일 이름 set
			memberInfo.setPhoto(newFileName);

			resultCnt = dao.insert(memberInfo);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
//		} catch (Exception e) {
//			System.out.println("오류");
//			new File(dir, newFileName).delete();
		}

		return resultCnt;
	}

	/*
	 * 이전방식
	 * 
	 * @Autowired private MemberDao dao;
	 * 
	 * public int memberInsert(HttpServletRequest request, RequestMemberRegist
	 * regist) {
	 * 
	 * // 서버경로 String path = "/uploadfile/userphoto"; // 리소스 매핑필요 // 절대경로 String dir
	 * = request.getSession().getServletContext().getRealPath(path);
	 * 
	 * MemberInfo memberInfo = regist.toMemberInfo();
	 * 
	 * // 파일이름 생성 String newFileName =
	 * memberInfo.getId()+"_"+regist.getPhoto().getOriginalFilename();
	 * 
	 * int resultCnt = 0; Connection conn = null;
	 * 
	 * try { conn = ConnectionProvider.getConnection();
	 * 
	 * regist.getPhoto().transferTo(new File(dir, newFileName));
	 * 
	 * memberInfo.setPhoto(newFileName);
	 * 
	 * resultCnt = dao.insert(conn, memberInfo);
	 * 
	 * } catch (IllegalStateException e) {
	 * 
	 * e.printStackTrace(); } catch (IOException e) {
	 * 
	 * e.printStackTrace(); } catch (SQLException e) {
	 * 
	 * e.printStackTrace(); }
	 * 
	 * return resultCnt; } 이전방식
	 */

	public char idCheck(String id) {

		char chk = dao.selectMemberById(id) == null ? 'Y' : 'N';

		return chk;
	}

	public String idCheck1(String id) {

		String chk = dao.selectMemberById2(id) == null ? "Y" : "N";

		return chk;
	}

}