package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "member")
public class MemberEntity {
	
	@Id
	@Column
	private long idx;
	@Column(length = 45, nullable = false)
	private String id;
	@Column(length = 45, nullable = false)
	private String pw;
	@Column(length = 45, nullable = false)
	private String name;
	@Column(length = 45, nullable = false)
	private String photo;
	
	
	public long getIdx() {
		return idx;
	}
	public void setIdx(long idx) {
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
	
	
	@Override
	public String toString() {
		return "MemberEntity [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", photo=" + photo + "]";
	}
	
		
}
