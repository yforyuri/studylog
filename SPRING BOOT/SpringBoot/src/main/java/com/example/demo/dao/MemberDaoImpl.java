package com.example.demo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.example.demo.entity.MemberEntity;

@Repository
public class MemberDaoImpl implements MemberDao<MemberEntity> {

	private EntityManager entityManager;
		
	public MemberDaoImpl() {}

	public MemberDaoImpl(EntityManager entityManager) {
		super();
		this.entityManager = entityManager;
	}

	@Override
	public List<MemberEntity> getAll() {
		
		Query query = entityManager.createQuery("from MemberEntity");
		
		List<MemberEntity> list = query.getResultList(); //list로 받을때(여러개) 
		
		entityManager.close();
		
		return list;
	}

	@Override
	public MemberEntity findByIdx(long idx) {

		Query query = entityManager.createQuery("from MemberEntity where idx="+idx);
		
		MemberEntity entity = (MemberEntity)query.getSingleResult(); //하나만 받을 때 
		
		return entity;
	}

	@Override
	public List<MemberEntity> findByName(String name) {

		Query query = entityManager.createQuery("from MemberEntity where name='" +name+ "'");
		
		List<MemberEntity> list = query.getResultList();
		return list;
	}

	@Override
	public List<MemberEntity> find(String fstr) {

		List<MemberEntity> list = null;
		
		String qSql =" from MemberEntity where idx=:fidx " + "or name like : fname " + "or id like : fid";
		
		Long fIdx = 0L;
		try {
			fIdx = Long.parseLong(fstr);
		}catch(Exception e){
		}
		
//		Query query = entityManager.createQuery(qSql)
//				.setParameter("fidx", fIdx)
//				.setParameter("fname", "%"+fstr+"%")
//				.setParameter("fid", "%"+fstr+"%");
		
		Query query = entityManager.createNamedQuery("findWithParam")
				.setParameter("fidx", fIdx)
				.setParameter("fname", "%"+fstr+"%")
				.setParameter("fid", "%"+fstr+"%");
		
		list = query.getResultList();
		
		return list;
	}

}