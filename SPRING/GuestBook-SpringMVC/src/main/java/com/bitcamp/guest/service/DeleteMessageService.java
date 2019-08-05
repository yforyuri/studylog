package com.bitcamp.guest.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.guest.dao.MessageDao;
import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.exception.InvalidMessagePasswordException;
import com.bitcamp.guest.exception.MessageNotFoundException;
import com.bitcamp.guest.jdbc.ConnectionProvider;
import com.bitcamp.guest.jdbc.JdbcUtil;

@Service
public class DeleteMessageService implements GuestBookService{	
	
	@Autowired
	private MessageDao dao;
	
	public int deleteMessage(int messageId, String password) throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
		int resultCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//트랜젝션 처리 
			conn.setAutoCommit(false);
			
			// 1. 전달받은 게시물 아이디로 게시물 확인
			// message dao 필요
//			MessageDao dao = MessageDao.getInstance();
			
			Message message = dao.select(conn,  messageId);
			
			
			// 2. 게시물이 존재하지 않으면 예외처리 
			if(message == null) {
				throw new MessageNotFoundException("메세지가 존재하지 않습니다. : " + messageId);
			}
					
					
			// 3. 게시물이 존재하면 비밀번호 확인 -> 사용자가 입력한 비밀번호와 비교
			if(!message.hasPassword()) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
			//비밀번호 비교
			if(!message.matchPassword(password)){
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}

			// 4. 비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린경우 예외처리
			// 5. 비밀번호가 일치하면 전상처리 commit 
			resultCnt = dao.deleteMessage(conn, messageId);
			
			// 정상처리 
			conn.commit();
		} catch (SQLException  e) {
			//트랜젝션 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
			
		} catch (MessageNotFoundException e){
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}
		catch (InvalidMessagePasswordException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}
		
		return resultCnt;
		
	}
	
}
