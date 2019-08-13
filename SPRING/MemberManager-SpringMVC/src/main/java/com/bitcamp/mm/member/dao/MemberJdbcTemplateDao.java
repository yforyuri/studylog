package com.bitcamp.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bitcamp.mm.jdbc.JdbcUtil;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

@Repository("TemplateDao")
public class MemberJdbcTemplateDao {
	
	@Autowired
	private JdbcTemplate template;
	

	public MemberInfo selectMemberById(String id) {

		String sql = "select * from member where id=?";
		
		List<MemberInfo> list = template.query(sql, new Object[] {id}, new MemberRowMapper());

		return list.isEmpty()?null : list.get(0);
	}
	
	public MemberInfo selectMemberById2(String id) {

		String sql = "select * from member where id=?";

		MemberInfo memberInfo = null;

		try {
			memberInfo = template.queryForObject(sql, new MemberRowMapper(), new Object[] { id });
		} catch (Exception e) {
			e.printStackTrace();
		}

		return memberInfo;

	}

	public int insert(MemberInfo memberInfo) {

		String sql = "insert into member (id, pw, name, photo) values (?,?,?,?)";

		return template.update(sql, memberInfo.getId(), memberInfo.getPw(), memberInfo.getName(), memberInfo.getPhoto());
	}


	public List<MemberInfo> selectList(int index, int count) {
		
		String sql = "select * from member order by idx desc limit ?, ?";

		return template.query(sql, new MemberRowMapper(), index, count);
	}
	
	public int selectTotalCount(SearchParam searchParam) {

		String sql = "select count(*) from member";

		if (searchParam != null) {
			sql = "select count(*) from member where ";
			if (searchParam.getStype().equals("both")) {
				sql += " id like '%"+searchParam.getKeyword()+"%' or name like '%"+searchParam.getKeyword()+"%'";
			}
			if (searchParam.getStype().equals("id")) {
				sql += " id like '%"+searchParam.getKeyword()+"%'";
			}
			if (searchParam.getStype().equals("name")) {
				sql += "name like '%"+searchParam.getKeyword()+"%'";
			}
		}

		return template.queryForObject(sql, Integer.class);
	}

	
	public List<MemberInfo> selectListById(int index, int count, SearchParam searchParam) {

		String sql = "SELECT * FROM member where id like ?  limit ?, ?";
		
		return template.query(sql, new MemberRowMapper(), "%" + searchParam.getKeyword() + "%", index, count);
	}

	public List<MemberInfo> selectListByName(int index, int count, SearchParam searchParam) {
		
		String sql = "SELECT * FROM member where name like ?  limit ?, ?";
				
		return template.query(sql, new MemberRowMapper(), "%" + searchParam.getKeyword() + "%", index, count);
	}

	public List<MemberInfo> selectListByBoth(int index, int count, SearchParam searchParam) {

		String sql = "SELECT * FROM member where id like ? or  name like ?  limit ?, ?";
		
		return template.query(sql, new MemberRowMapper(), "%" + searchParam.getKeyword() + "%",
				"%" + searchParam.getKeyword() + "%", index, count);
	}

	public MemberInfo selectMemberByIdx(int id) {

		String sql = "select * from member where idx=?";
		
		MemberInfo memberInfo = null;

		try {
			memberInfo = template.queryForObject(sql, new MemberRowMapper(), id);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
			
		return memberInfo;
	}

	
	public int deleteMember(int id) {
		
		String sql = "delete from member where idx=?";
		
		return template.update(sql, id);
	}
	
	public int editMember(MemberInfo memberInfo) {
	
		String sql = "update member set name=?, pw=?, photo=? where idx=?";

		return template.update(sql, memberInfo.getName(), memberInfo.getPw(), memberInfo.getPhoto(), memberInfo.getIdx());
	}
	
}
