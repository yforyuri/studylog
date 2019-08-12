package com.bitcamp.guest.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.guest.dao.MessageDao;
import com.bitcamp.guest.dao.MessageJdbcTemplateDao;
import com.bitcamp.guest.dao.MessageSessionDao;
import com.bitcamp.guest.dao.MessageSessionTemplateDao;
import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.domain.MessageListView;
import com.bitcamp.guest.jdbc.ConnectionProvider;

@Service("listService")
public class GetMessageService implements GuestBookService{

//	Session Template
	
//	@Autowired
//	private MessageSessionTemplateDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MessageSessionDao dao;
	
	
	private static final int MESSAGE_COUNT_PER_PAGE = 3;

	
	public MessageListView getMessageListView(int pageNumber) {
		
		//dao생성 
		dao = template.getMapper(MessageSessionDao.class);
		
		int currentPageNumber = pageNumber;
		
		MessageListView view = null;
		
		int messageTotalCount = dao.selectCount();
		
		List<Message> messageList = null;
		
		int firstRow = 0;
		
		if(messageTotalCount > 0) {
			
			firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE ;
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("firstRow", firstRow);
			params.put("MESSAGE_COUNT_PER_PAGE", MESSAGE_COUNT_PER_PAGE);
			
			messageList =dao.selectList(params);
		
		} else {
			currentPageNumber = 0;
			messageList = Collections.emptyList();
		}
		
		view = new MessageListView(MESSAGE_COUNT_PER_PAGE, messageTotalCount, currentPageNumber, messageList, firstRow);
		
		return view;
	}
	
	
	
	
	
	
/*	JDBC template
 * ----------------------------------------------------------------------------
	@Autowired
	private MessageJdbcTemplateDao dao;
	
	private static final int MESSAGE_COUNT_PER_PAGE = 3;

	
	public MessageListView getMessageListView(int pageNumber) {
		
		int currentPageNumber = pageNumber;
		
		MessageListView view = null;
		
		int messageTotalCount = dao.selectCount();
		
		List<Message> messageList = null;
		
		int firstRow = 0;
		
		if(messageTotalCount > 0) {
			
			firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE ;
			
			messageList = dao.selectList(firstRow, MESSAGE_COUNT_PER_PAGE);
		
		} else {
			currentPageNumber = 0;
			messageList = Collections.emptyList();
		}
		
		view = new MessageListView(MESSAGE_COUNT_PER_PAGE, messageTotalCount, currentPageNumber, messageList, firstRow);
		
		return view;
	}   
	-----------------------------------------------------------------------------
	JDBC template  */
	
	
	
	
	
	/* 기존방식 -->
	@Autowired
	private MessageDao dao;

	
	// MessageListView를 생성해서 결과로 반환
	
//	// singleton
//	private GetMessageService() {}
//	
//	private static GetMessageService service = new GetMessageService();
//	
//	public static GetMessageService getInstance() {
//		return service;
//	}
	
	/* MessageListView.jsp 에 필요한 변수   
	 * messageCountPerPage 
	 * messageTotalCount 
	 * pageTotalCount 
	 * curruntPageNumber 
	 * messageList 
	 * firstRow
	 * endRow : mysql x
	 
	
	// 1. 한 페이지에 보여줄 방명록의 수 
	private static final int MESSAGE_COUNT_PER_PAGE =3;
	
	
	public MessageListView getMessageListView(int pageNumber) {
		
		
		// 2. 현재 페이지 번호 
		int currentPageNumber = pageNumber;
		
		Connection conn;
		
		MessageListView view = null;
		
		try {
			// connection
			conn = ConnectionProvider.getConnection();
			// DAO
//			MessageDao dao = MessageDao.getInstance();
			//전체 게시물의 수
			int messageTotalCount = dao.selectCount(conn);
			
			// 게시물 내용 리스트, db검색에 사용할 startrow, endrow
			//mysql : endRow불필요 
			List<Message> messageList = null;
			int firstRow = 0;
			
			if(messageTotalCount > 0) {
				
				//mysql - sequence(+1) 설정 불필요 : auto increment되기 때문 
				firstRow = (pageNumber-1) * MESSAGE_COUNT_PER_PAGE;
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
	}   <--- 기존방식  */

}