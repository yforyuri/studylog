package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.ConnectionProvider;

public class WriteMessageService {
	// private: 외부에서 값을 변경할 수 없도록 
	private static WriteMessageService service = new WriteMessageService();
	
	private WriteMessageService() {}
	
	public static WriteMessageService getInstance() {
		return service;
	}	
	//   <--singleton
	
	public int write(Message message) {
		
		int result = 0;
		
		//1. Connection 생성 
		//2. dao생성
		//3. insert method 실행 
		
		Connection  conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao dao = MessageDao.getInstance();
			
			result = dao.insert(conn, message);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
