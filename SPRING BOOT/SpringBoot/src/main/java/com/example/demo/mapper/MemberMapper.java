package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.MemberInfo;

public interface MemberMapper {

	@Select("select * from member order by idx desc")
	public List<MemberInfo> selectAll();
	public MemberInfo selectMemberById(String id);
}
