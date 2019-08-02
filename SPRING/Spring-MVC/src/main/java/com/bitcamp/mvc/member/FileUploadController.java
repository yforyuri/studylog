package com.bitcamp.mvc.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitcamp.mvc.domain.Report;

@Controller
public class FileUploadController {
	
	String path ="/uploadfile";
	
	@RequestMapping("/fileupload/uploadForm")
	public String getForm() {
		return "fileupload/uploadForm";
	}
	
	@RequestMapping(value= "/fileupload/upload1", method = RequestMethod.POST)
	public String upload1(
			@RequestParam("sno") String sno,
			@RequestParam("report") MultipartFile file,
			Model model,
			HttpServletRequest request
			) {
		
		model.addAttribute("sno", sno);
		model.addAttribute("fileName", file.getOriginalFilename());
		model.addAttribute("fileSize", file.getSize());
		
		// 파일저장 
		String dir = request.getSession().getServletContext().getRealPath(path);
		
		try {
			file.transferTo(new File(dir, sno+"_"+file.getOriginalFilename()));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "fileupload/upload";
	}
	
	@RequestMapping(value= "/fileupload/upload2", method = RequestMethod.POST)
	public String upload1(
			MultipartHttpServletRequest request,
			Model model
			) {
		
		String sno  = request.getParameter("sno");
		MultipartFile file = request.getFile("report");
				
		model.addAttribute("sno", sno);
		model.addAttribute("fileName", file.getOriginalFilename());
		model.addAttribute("fileSize", file.getSize());
		
		return "fileupload/upload";
		
	}
	
	@RequestMapping(value= "/fileupload/upload3", method = RequestMethod.POST)
	public String upload1(Report report) {
		
		return "fileupload/upload";
		
	}
}
