package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class DeleteMessageService implements GuestBookService{
	
//	private DeleteMessageService() {}
//	
//	private static DeleteMessageService service = new DeleteMessageService();
//	
//	public static DeleteMessageService getInstance() {
//		return service;
//	}
	
	public int deleteMessage(int messageId, String password) throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
		int resultCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//트랜젝션 처리 
			conn.setAutoCommit(false);
			
			// 1. 전달받은 게시물 아이디로 게시물 확인
			// message dao 필요
			MessageDao dao = MessageDao.getInstance();
			
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
	
	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewpage = "/WEB-INF/view/delete.jsp";
		
		int messageId = Integer.parseInt(request.getParameter("messageId"));
		String password = request.getParameter("password");
		
		boolean chk = false;
		int resultCnt =0;
		String msg = "";
		
		try {
			
			resultCnt = deleteMessage(messageId, password);
			chk = true;	
		} catch (SQLException e) {
			e.printStackTrace();
			msg = e.getMessage();
		} catch (MessageNotFoundException e) {
			e.printStackTrace();
			msg = e.getMessage();
		} catch (InvalidMessagePasswordException e) {
			e.printStackTrace();
			msg = e.getMessage();
		}
		
		//뷰 페이지와 결과 데이터를 공유 (전달)
		request.setAttribute("chk", chk);
		request.setAttribute("resultCnt", resultCnt);
		request.setAttribute("msg", msg);
		
		
		return viewpage;
	}
	
}
