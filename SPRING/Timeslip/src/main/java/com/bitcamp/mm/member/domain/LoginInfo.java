package com.bitcamp.mm.member.domain;

import java.util.Date;

public class LoginInfo {
	
	private String id;
	private String name;
	private String photo;
	private Date regDate;
	
	public LoginInfo(String id, String name, String photo, Date regDate) {
		this.id = id;
		this.name = name;
		this.photo = photo;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhoto() {
		return photo;
	}

	public Date getRegDate() {
		return regDate;
	}

	@Override
	public String toString() {
		return "LoginInfo [id=" + id + ", name=" + name + ", photo=" + photo + ", regDate=" + regDate + "]";
	}

}
