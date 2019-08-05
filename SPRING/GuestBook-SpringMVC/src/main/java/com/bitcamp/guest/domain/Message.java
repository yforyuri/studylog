package com.bitcamp.guest.domain;

public class Message {
	
	private int id;
	private String guestname;
	private String password;
	private String message;
	
	public Message() {}
	
	public Message(int id, String guestname, String password, String message) {
		this.id = id;
		this.guestname = guestname;
		this.password = password;
		this.message = message;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGuestname() {
		return guestname;
	}
	public void setGuestname(String guestname) {
		this.guestname = guestname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean hasPassword() {
		return password != null && !password.isEmpty();
	}
	//삭제시에 비밀번호 비교 확인 
	public boolean matchPassword(String pw) {
		return hasPassword() && password.equals(pw);
	}

}
