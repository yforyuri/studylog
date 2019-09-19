package com.example.demo.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.domain.MemberInfo;
import com.example.demo.entity.MemberEntity;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.repository.MemberRepository;

@Controller
public class IndexController {
	
	@Autowired
	private MemberRepository repository;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Autowired
	private MemberMapper mapper;
	
	
	@RequestMapping("/")
	@ResponseBody
	public String index() {
		
		return "Spring Boot Start!";
	}
	
	
	@RequestMapping("/hello")
	public void hello1() {
		
	}
	
	
	@RequestMapping("/memberInfo")
	public void selectById() {
		
		mapper = template.getMapper(MemberMapper.class);
		
		MemberInfo info = mapper.selectMemberById("lalala");
		
		System.out.println(info);
	}
	
	
	@RequestMapping("/members")
	@ResponseBody
	public List<MemberInfo> selectMembers() {
		
		mapper = template.getMapper(MemberMapper.class);
		
		List<MemberInfo> info =  mapper.selectAll();
		
		for (MemberInfo memberInfo : info) {
			System.out.println(memberInfo);
		}
		
		return info;
				
	}
	
	
	@RequestMapping("/member/list")
	@ResponseBody
	public List<MemberEntity> getMemberList(){
		
		List<MemberEntity> list = null;
		
		list = repository.findAll();
		
		for(MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		
		return list;
	}
	
	
	@RequestMapping("/member/insert")
	@ResponseBody
	public String insertMember() {
		
		MemberEntity entity = new MemberEntity();
		entity.setId("nana@entity");
		entity.setName("entitynana");
		entity.setPw("11");
		
		return repository.saveAndFlush(entity).toString();
	}
	
	
	@RequestMapping("/member/edit/{idx}")
	@ResponseBody
	public String editMember(@PathVariable("idx") int idx) {
		
		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);
		entity.setId("nana@entity");
		entity.setName("editentitynana");
		entity.setPw("11");
		
		return repository.saveAndFlush(entity).toString();
	}
	
	
	@RequestMapping("/member/delete/{idx}")
	@ResponseBody
	public String deleteMember(@PathVariable("idx") int idx) {
		
		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);
		
		repository.delete(entity);
		
		return "delete success";
	}
	
	
	@RequestMapping("/member/member/{idx}")
	@ResponseBody
	public MemberEntity getMemberInfo(@PathVariable("idx") Long idx) {
		
		MemberEntity entity = null;
		
		entity = repository.findByIdx(idx);
		
		System.out.println(entity);
		
		return entity;
	}
	
	
	@RequestMapping("/member/memberByName/{name}")
	@ResponseBody
	public List<MemberEntity> getMemberInfo(@PathVariable("name") String name) {
		
		List<MemberEntity> entities = null;
		
		entities = repository.findByNameLike("%"+name+"%");
		
		for(MemberEntity memberEntity : entities) {
			System.out.println(memberEntity);
		}
		
		return entities;
	}
	
	
	@RequestMapping("/member/memberByBetween")
	@ResponseBody
	public List<MemberEntity> getMemberInfo() {
		
		List<MemberEntity> entities = null;
		
		entities = repository.findByIdxBetween(10L, 28L);
		
		for(MemberEntity memberEntity : entities) {
			System.out.println(memberEntity);
		}
		
		return entities;
	}
}