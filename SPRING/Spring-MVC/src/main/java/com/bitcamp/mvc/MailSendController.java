package com.bitcamp.mvc;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailSendController {
	 
	@Autowired
	MailSender sender;
	
	@Autowired
	JavaMailSender javaMailSender;
	
	@ResponseBody
	@RequestMapping("/mail/send")
	public String sendMail() {
		
//		메일 내용 설정
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("mailadd");
		message.setSubject("title");
		message.setText("con");
		message.setFrom("from");
		
		SimpleMailMessage m = new SimpleMailMessage(message);
		
		sender.send(message);
		
		return "send OK";
	}

	@RequestMapping("/mail/send2")
	public String sendJavaMailSender() {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			// 메일 제목 설정
			message.setSubject("[안내] 처음 보내는 JavaMailSender", "UTF-8");

			// html 메일 내용
			String htmlStr = "<h1 style=\"color:lightblue\">Hello</h1><br>"
					+ "<a href=\"http://www.naver.com\">naver</a>";
			// 내용 설정
			message.setText(htmlStr, "UTF-8", "html");
			// To 설정
			message.addRecipient(
					RecipientType.TO, 
					new InternetAddress("mail address", "name", "UTF-8"));

			javaMailSender.send(message);


		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}


		return "send ok";	
	}
	
	@ResponseBody
	@RequestMapping("/mail/send3")
	public String sendFileAttach() throws UnsupportedEncodingException {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			// 제목 
			messageHelper.setSubject("[안내] 파일 첨부합니다.");
			// 내용 html 
			String htmlStr = "<h1>파일첨부, 파일을 다운받으세요. </h1>";
			//내용설정 
			messageHelper.setText(htmlStr, true);
			// to설정
			messageHelper.setTo(new InternetAddress(
					"mailadd", "name", "UTF-8"));
			//첨부할 파일 객체 생성
			DataSource datasource = new FileDataSource("file path");
			//MimeMessageHelper 파일 객체를 추가
			messageHelper.addAttachment(MimeUtility.encodeText("filename", "UTF-8", "B"), datasource);
			
			javaMailSender.send(message);
			
		} catch (MessagingException e) {
		
			e.printStackTrace();
		}
				
		return "send OK";
	}
}
