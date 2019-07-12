package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import guestbook.model.MessageListView;
import jdbc.ConnectionProvider;

public class GetMessageService {
	
	// MessageListView를 생성해서 결과로 반환
	
	private GetMessageService() {}
	
	private static GetMessageService service = new GetMessageService();
	
	public static GetMessageService getInstance() {
		return service;
	}
	
	// 1. 한 페이지에 보여줄 게시글의 갯수 
	private static final int MESSAGE_COUNT_PER_PAGE =3;
	//page마다 보여주는 게시글이 달라짐. 
		/* MessageListView에 필요한 것들: 
		 * messageCountPerPage messageTotalCount 
		 * pageTotalCount curruntPageNumber 
		 * messageList 
		 * firstRow endRow
		 * @pageNumber : 현재 페이지
		 * @
		 * */
	
	public MessageListView getMessageListView(int pageNumber) {
		Connection conn = null;
		// 2. 현재 페이지 번화
		int currentPageNumber = pageNumber;
		
		MessageListView view = null;
		
		try {
			// connection
			conn = ConnectionProvider.getConnection();
			// DAO
			MessageDao dao = MessageDao.getInstance();
			//전체 게시물의 갯수
			int messageTotalCount = dao.selectCount(conn);
			
			// 게시물 내용 리스트, db검색에 사용할 start_row, end_row
			List<Message> messageList = null;
			int firstRow = 0;
			
			if(messageTotalCount > 0) {
				
				firstRow = (pageNumber-1) * MESSAGE_COUNT_PER_PAGE + 1;
				messageList = dao.selectList(conn, firstRow, MESSAGE_COUNT_PER_PAGE);
				
			}else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			view = new MessageListView(MESSAGE_COUNT_PER_PAGE, messageTotalCount, currentPageNumber, messageList, firstRow);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return view;
	}

}
