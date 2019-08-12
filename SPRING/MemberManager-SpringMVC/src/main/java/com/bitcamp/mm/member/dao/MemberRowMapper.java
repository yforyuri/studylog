package com.bitcamp.mm.member.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.bitcamp.mm.member.domain.MemberInfo;

public class MemberRowMapper {

	public MemberInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberInfo memberInfo = new MemberInfo(
				rs.getInt("idx"),
				rs.getString("id"),
				rs.getString("pw"),
				rs.getString("name"),
				rs.getString("photo"),
				rs.getTimestamp("regDate"));
//				new Date(rs.getTimestamp("regdate").getTime()));
			
		return memberInfo;
	}
}
