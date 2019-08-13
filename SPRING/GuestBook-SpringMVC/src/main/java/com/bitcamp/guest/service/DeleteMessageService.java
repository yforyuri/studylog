package com.bitcamp.guest.service;


import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.guest.dao.MessageJdbcTemplateDao;
import com.bitcamp.guest.dao.MessageSessionDao;
import com.bitcamp.guest.dao.MessageSessionTemplateDao;
import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.exception.InvalidMessagePasswordException;
import com.bitcamp.guest.exception.MessageNotFoundException;

@Service("deleteService")
public class DeleteMessageService implements GuestBookService {
	
//	Session Template
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MessageSessionDao dao;
	

	@Transactional
	public int deleteMessage(int messageId, String password) throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
			int result = 0;
			
			// dao 생성
			dao = template.getMapper(MessageSessionDao.class);
			
			try {
				
				Message message = dao.select(messageId);
				
				if(message == null ) {
					throw new MessageNotFoundException("메세지가 존재하지 않음 : " + messageId);
				
				} else {
				
					if(!message.hasPassword()) {
						throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
					} 
					
					if(!message.matchPassword(password)){
						throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
					}

					result= dao.deleteMessage(messageId);
				
				}

			} catch (MessageNotFoundException e) {
				e.printStackTrace();
				throw e;
			} catch (InvalidMessagePasswordException e) {
				e.printStackTrace();
				throw e;
			}
			
			return result;
	}
	
/* JDBC template 
 * ----------------------------------------------------
	@Autowired
	private MessageJdbcTemplateDao dao;

	public int deleteMessage(int messageId, String password) throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
			int result = 0;
			
			try {
				
				Message message = dao.select(messageId);
				
				
				
				if(message == null ) {
					throw new MessageNotFoundException("메세지가 존재하지 않음 : " + messageId);
				
				} else {
				
					if(!message.hasPassword()) {
						throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
					} 
					
					if(!message.matchPassword(password)){
						throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
					}

					result= dao.deleteMessage(messageId);
				
				}

			} catch (MessageNotFoundException e) {
				e.printStackTrace();
				throw e;
			} catch (InvalidMessagePasswordException e) {
				e.printStackTrace();
				throw e;
			}
			
			return result;
	}
	------------------------------------------------------------------------- 
	JDBC template                   */
	
	
	
	

/*	기존방식 -->
	@Autowired
	private MessageDao dao;

	public int deleteMessage(int messageId, String password)
			throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
		int resultCnt = 0;

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			// 트랜젝션 처리
			conn.setAutoCommit(false);

			// 1. 전달받은 게시물 아이디로 게시물 확인
			// message dao 필요
			Message message = dao.select(conn, messageId);

			// 2. 게시물이 존재하지 않으면 예외처리
			if (message == null) {
				throw new MessageNotFoundException("메세지가 존재하지 않습니다. : " + messageId);
			}

			// 3. 게시물이 존재하면 비밀번호 확인 -> 사용자가 입력한 비밀번호와 비교
			if (!message.hasPassword()) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
			// 비밀번호 비교
			if (!message.matchPassword(password)) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}

			// 4. 비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린경우 예외처리
			// 5. 비밀번호가 일치하면 전상처리 commit
			resultCnt = dao.deleteMessage(conn, messageId);

			// 정상처리
			conn.commit();
		} catch (SQLException e) {
//			//트랜젝션 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
//			
		} catch (MessageNotFoundException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (InvalidMessagePasswordException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}

		return resultCnt;

	}
	<--- 기존방식   */

}