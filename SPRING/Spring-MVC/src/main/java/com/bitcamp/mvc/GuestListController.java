package com.bitcamp.mvc;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.mvc.domain.GuestMessage;
import com.bitcamp.mvc.domain.GuestMessageList;

@Controller
public class GuestListController {
	
	@RequestMapping("/guest/xmlList.xml")
	@ResponseBody
	public GuestMessageList xmlList(){
		
		return getMessageList();	
	}

	private GuestMessageList getMessageList() {
		
		List<GuestMessage> messages = new ArrayList<GuestMessage>();
		
		messages.add(new GuestMessage(1, "안녕하세요", new Date()));
		messages.add(new GuestMessage(2, "Hello", new Date()));
		messages.add(new GuestMessage(3, "Hi", new Date()));
		

		return new GuestMessageList(messages);
	}

}
