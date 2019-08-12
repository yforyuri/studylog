package com.bitcamp.mm.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.RequestMemberEdit;

@Service("editService")
public class MemberEditService implements MemberService {

	
	@Autowired
	private MemberJdbcTemplateDao dao;

	public MemberInfo getEditFormData(int id) {
		MemberInfo memberInfo = dao.selectMemberByIdx(id);
		return memberInfo;
	}

	public int edit(RequestMemberEdit edit, String oldFileName, HttpServletRequest request) {

		int rCnt = 0;
		MemberInfo memberInfo = edit.toMemberInfo();

		String path = "/uploadfile/userphoto";
		String dir = request.getSession().getServletContext().getRealPath(path);

		// 신규 파일 체크
		if (edit.getPhoto() != null && !edit.getPhoto().isEmpty() && edit.getPhoto().getSize() > 0) {

			String newFileName = edit.getId() + "_" + edit.getPhoto().getOriginalFilename();

			try {
				// 신규파일 저장
				edit.getPhoto().transferTo(new File(dir, newFileName));
				// 데이터 베이스 저장을 위한 새로운 파일 이름
				memberInfo.setPhoto(newFileName);
				// 이전 파일 삭제
				new File(dir, oldFileName).delete();

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			// 신규파일이 없으면 이전 파일 이름을 그대로 업데이트
			memberInfo.setPhoto(oldFileName);
		}

		rCnt = dao.editMember(memberInfo);

		return rCnt;
	}
	
	/* 이전방식 
	@Autowired
	private MemberDao dao;

	public MemberInfo getEditFormData(int id) {

		Connection conn = null;
		MemberInfo memberInfo = null;

		try {
			conn = ConnectionProvider.getConnection();
			memberInfo = dao.selectMemberByIdx(conn, id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("service : " + memberInfo);

		return memberInfo;
	}

	public int edit(RequestMemberEdit edit, String oldFileName, HttpServletRequest request) {

		int rCnt = 0;
		MemberInfo memberInfo = edit.toMemberInfo();

		String path = "/uploadfile/userphoto";
		String dir = request.getSession().getServletContext().getRealPath(path);

		Connection conn = null;

		// 신규 파일 체크
		if (edit.getPhoto() != null && !edit.getPhoto().isEmpty() && edit.getPhoto().getSize() > 0) {

			String newFileName = edit.getId() + "_" + edit.getPhoto().getOriginalFilename();

			try {
				// 신규파일 저장
				edit.getPhoto().transferTo(new File(dir, newFileName));
				// 데이터 베이스 저장을 위한 새로운 파일 이름
				memberInfo.setPhoto(newFileName);
				// 이전 파일 삭제
				new File(dir, oldFileName).delete();

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			// 신규파일이 없으면 이전 파일 이름을 그대로 업데이트
			memberInfo.setPhoto(oldFileName);
		}

		try {
			conn = ConnectionProvider.getConnection();
			rCnt = dao.editMember(conn, memberInfo);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rCnt;
	}
	이전방식    */ 

}
