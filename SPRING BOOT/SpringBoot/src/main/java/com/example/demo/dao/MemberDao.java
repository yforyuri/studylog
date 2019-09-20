package com.example.demo.dao;

import java.io.Serializable;
import java.util.List;

public interface MemberDao<T> extends Serializable{
	
	public List<T> getAll();
	
	public T findByIdx(long idx);
	
	public List<T> findByName(String name);
	
	public List<T> find(String fstr);
	
}