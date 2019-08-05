package com.bitcamp.guest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.guest.domain.MessageListView;
import com.bitcamp.guest.service.GetMessageService;

@Controller
public class GuestListController {
	
	@Autowired
	private GetMessageService listService;
	
	@RequestMapping("/guest/list")
	public String getList(@RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model) {
		
		MessageListView listView = listService.getMessageListView(pageNumber);
		model.addAttribute("viewData", listView);
		
		return "guest/list";
	}

}