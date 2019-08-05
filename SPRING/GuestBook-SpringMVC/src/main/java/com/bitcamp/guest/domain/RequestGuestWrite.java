package com.bitcamp.guest.domain;

public class RequestGuestWrite {

	private String guestname;
	private String password;
	private String message;
	
	
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
	
	@Override
	public String toString() {
		return "RequestGuestWrite [guestname=" + guestname + ", password=" + password + ", message=" + message + "]";
	}	
	
	public Message toMessage() {
		Message message = new Message(0, guestname, password, this.message);
		return message;
	}
}
