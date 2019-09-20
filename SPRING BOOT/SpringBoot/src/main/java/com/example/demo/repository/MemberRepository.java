package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, Long> {

	public MemberEntity findByIdx(Long idx);
	
	public List<MemberEntity> findByNameLike(String name);

	public List<MemberEntity> findByIdxBetween(Long args1, Long arge2);
	
	@Query("select d from MemberEntity d order by d.idx desc")
	public List<MemberEntity> findAll();
}