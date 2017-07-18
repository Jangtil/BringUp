package com.myweb.ys;

import java.io.File;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.mybatis.dao.MemberDaoImpl;

@Controller
public class TestController {
	@Resource(name = "memberDao")
	private MemberDaoImpl memberDaoImpl;


	@RequestMapping(value = "/test")
	public String test(Locale locale, Model model,HttpSession session) {
	
		String filePath= session.getServletContext().getRealPath("/res/upload");
		
		
		
		
		System.out.println(filePath);

		return "board/GalleryIndex";
	}



	
	

}
