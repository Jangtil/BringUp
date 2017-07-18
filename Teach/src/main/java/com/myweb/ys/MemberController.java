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
public class MemberController {
	@Resource(name = "memberDao")
	private MemberDaoImpl memberDaoImpl;

	@RequestMapping(value = "/join")
	public String join(Locale locale, Model model) {
		return "board/boardJoin";
	}

	@RequestMapping(value = "/join_insert")
	public String setFormData(@ModelAttribute("Member") Member member) {
		boolean res = false;
		try {
			res = memberDaoImpl.insertmember(member);
			if (!member.getPw().equals(member.getPw2())) {
				return "redirect:join";
			}
		} catch (Exception e) {
			// 회원가입 실패
			return "redirect:join";
		}

		if (res) { // 회원가입 성공
			return "redirect:login";
		} else { // 회원가입 실패
			return "redirect:join";
		}

	}

	@RequestMapping(value = "/login")
	public String login(Locale locale, Model model, String code) {
		try {
			if (code.equals("err")) {
				model.addAttribute("code", "입력하신 정보가 올바르지 않습니다");
			}
		} catch (Exception e) {
			
		}
		return "board/boardLogin";
	}

	@RequestMapping(value = "/login_select")
	public String login(@ModelAttribute("Member") Member member, HttpSession session) {
		if (memberDaoImpl.login(member)) {
			session.setAttribute("id", member.getId()); // 로그인 세셩생성
			return "redirect:main";
		} else {
			return "redirect:login?code=err"; // 로그인 실패
		}
	}

	@RequestMapping(value = "/selectId")
	public String selectId(Locale locale, Model model) {
		// 미구현!!!!!!!!

		return "login";
	}

	@RequestMapping(value = "/allUser")
	public String allUser(Locale locale, Model model) {
		memberDaoImpl.selectAllMember();

		return "login";
	}

	@RequestMapping(value = "/logout")
	public String allUser(Locale locale, Model model, HttpSession session) {
		memberDaoImpl.selectAllMember();
		session.removeAttribute("id");
		return "redirect:main";
	}

	@RequestMapping(value = "/idchk")
	public String idchk(String id, Model model) {
		boolean res = memberDaoImpl.idchk(id);
		model.addAttribute("res", res);
		return "board/idchk";
	}
}
