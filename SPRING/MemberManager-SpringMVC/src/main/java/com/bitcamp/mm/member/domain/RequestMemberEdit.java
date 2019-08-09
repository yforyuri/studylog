package com.bitcamp.mm.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberEdit {

	private int idx;
	private String id;
	private String pw;
	private String name;
	private MultipartFile photo;
	private String oldFile;


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

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public String getOldFile() {
		return oldFile;
	}

	public void setOldFile(String oldFile) {
		this.oldFile = oldFile;
	}




	public MemberInfo toMemberInfo() {

		MemberInfo info = new MemberInfo();
		info.setIdx(idx);
		info.setId(id);
		info.setName(name);
		info.setPw(pw);

		return info;

	}

}
