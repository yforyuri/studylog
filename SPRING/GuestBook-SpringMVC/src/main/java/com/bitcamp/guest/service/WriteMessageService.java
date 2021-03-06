package com.bitcamp.guest.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.guest.dao.MessageDao;
import com.bitcamp.guest.dao.MessageJdbcTemplateDao;
import com.bitcamp.guest.dao.MessageSessionDao;
import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.jdbc.ConnectionProvider;

@Service("writeService")
public class WriteMessageService implements GuestBookService{
	
//	Session Template
	@Autowired
	private SqlSessionTemplate template;
	
	private MessageSessionDao dao;
	
	public int write(Message message) {
		
		dao = template.getMapper(MessageSessionDao.class);
		
		int result = 0;
		result = dao.insert(message);
		
		return result;
	}
	
	
	
	/* JDBC Template
	----------------------------------------------------------------------
	@Autowired
	private MessageJdbcTemplateDao templateDao;
	
	public int write(Message message) {
		int result = 0;
		result = templateDao.insert(message);
		return result;
	}
	-----------------------------------------------------------------------
	JDBC Template   */
	
	
	
	
	
	
	
	/* 기존방식 -->
	@Autowired
	private MessageDao dao;
	
	public int write(Message message) {
		
		int result = 0;
		result = templateDao.insert(message);
		//1. Connection 생성 
		//2. dao생성
		//3. insert method 실행 
		
		Connection  conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
//			MessageDao dao = MessageDao.getInstance();
			
			result = dao.insert(conn, message);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	<-- 기존방식  */
}
