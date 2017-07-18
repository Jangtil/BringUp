package com.myweb.ys;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.mybatis.dao.MemberDaoImpl;
import com.myweb.mybatis.domain.Member;


@Controller
public class TestController {
	@Resource(name = "memberDao")
	private MemberDaoImpl memberDaoImpl;


	@RequestMapping(value = "/test")
	public String test(Locale locale, Model model) {
		return "board/GalleryIndex";
	}


	
	

}
