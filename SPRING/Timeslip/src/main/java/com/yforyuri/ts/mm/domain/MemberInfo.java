package com.yforyuri.ts.mm.domain;

import java.util.Date;

public class MemberInfo {
	
	private int idx;
	private String id;
	private String pw;
	private String name;
	private String photo;
	private Date regDate;

	
	public MemberInfo() {
		this.regDate = new Date();
	}

	public MemberInfo(String id, String pw, String name, String photo) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.photo = photo;
	}

	public MemberInfo(int idx, String id, String pw, String name, String photo, Date regDate) {
		super();
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.photo = photo;
		this.regDate = regDate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	// 화면 결과 출력을 위한 HTML 코드 반환
		public String makeHtmlDiv() {
			String str = "";

			str += "<div class=\"mInfor\"> \n";
			str += "	<h3> \n";
			str += "		" + id + "(" + name + ")\n";
			str += "	</h3> \n";
			str += "	<p> \n";
			str += "		" + pw;
			str += "	</p> \n";
			str += "</div> \n";

			return str;
		}

		// MemberInfo 객체 -> LoginInfo 객체 반환
		public LoginInfo toLoginInfo() {

			return new LoginInfo(id, name, photo, regDate);

		}
		
		// 비밀번호 체크 확인
		// 2017.07.25 메서드 추가
		public boolean pwChk(String pw) {
			return pw != null && pw.trim().length()>0 && pw.equals(pw);
		}
}
