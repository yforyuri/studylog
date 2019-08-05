package com.bitcamp.guest;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.guest.exception.InvalidMessagePasswordException;
import com.bitcamp.guest.exception.MessageNotFoundException;
import com.bitcamp.guest.service.DeleteMessageService;

@Controller
@RequestMapping("/guest/delete")
public class GuestDeleteController {
	
	@Autowired
	private DeleteMessageService deleteService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getDeleteForm() {
		return"guest/deleteForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String delete(
			@RequestParam("messageId") int messageId,
			@RequestParam("password") String password,
			Model model
			) {
		
		boolean chk = false;
		int resultCnt = 0;
		String msg ="";
		
		try {
			resultCnt = deleteService.deleteMessage(messageId, password);
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
		
		
		model.addAttribute("chk", chk);
		model.addAttribute("resultCnt", resultCnt);
		model.addAttribute("msg", msg);
		
		return "guest/delete";
	}

}
