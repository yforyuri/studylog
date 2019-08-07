package com.bitcamp.mm.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberRegist {

	private String id;
	private String pw;
	private String name;
	private MultipartFile photo;

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

//	@Override
//	public String toString() {
//		return "RequestMemberRegist [id=" + id + ", pw=" + pw + ", name=" + name + ", photo=" + photo.getOriginalFilename() + "]";
//	}
	
	public MemberInfo toMemberInfo() {
		
		MemberInfo info = new MemberInfo();
		info.setId(id);
		info.setName(name);
		info.setPw(pw);
		
		return info;
		
	}
}
