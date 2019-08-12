package com.bitcamp.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.jdbc.JdbcUtil;

@Repository("sessionTemplateDao")
public class MessageSessionTemplateDao { 

	@Autowired
	private SqlSessionTemplate template;
	
	/*mapper의 namespace는 공통적으로 사용되는 경우가 있어 공통으로 씀*/
	private String nameSpace = "com.bitcamp.guest.mapper.mybatis.guestMapper";


	public int insert(Message message) {
		int rCnt = template.update(nameSpace + ".insertMessage", message);
		return rCnt;
	}
	
	public Message select(int messageId) {
		
		return template.selectOne(nameSpace+".select", messageId);
	}
	
	public int selectCount() {
		
		return template.selectOne(nameSpace+".selectCount");
	
	}
		
	public List<Message> selectList(int firstRow, int messageCountPerPage) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("firstRow", firstRow);
		params.put("messageCountPerPage", messageCountPerPage);
		
		return template.selectList(nameSpace+".selectList", params);
	}
	
	public int deleteMessage(int messageId) {

		return template.update(nameSpace+".deleteMessage", messageId);
	}
	

}