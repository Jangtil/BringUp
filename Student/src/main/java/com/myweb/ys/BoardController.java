package com.myweb.ys;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.mybatis.dao.BoardDaoImpl;
import com.myweb.mybatis.dao.MemberDaoImpl;
import com.myweb.mybatis.domain.Board;
import com.myweb.mybatis.domain.Mylecture;
import com.myweb.mybatis.domain.Reading;
import com.myweb.mybatis.domain.SelMylectures;

@Controller
public class BoardController {

	@Resource(name = "boardDao")
	private BoardDaoImpl boarddao;

	@Resource(name = "memberDao")
	private MemberDaoImpl memberDaoImpl;

	private void setTitle(Model model, String id) {
		List<SelMylectures> lslecture = boarddao.selectMyLecture(id);
		
		
		//교수아이디 중복없이 넣어주기
		TreeSet<String> lsstring = new TreeSet<String>();
		for (SelMylectures s : lslecture) {  
			lsstring.add(s.getTeach());
		}
		
		
		//교수아이디와이름 중복없이 넣어주기
		Map<String,String> teachMap = new HashMap<String,String>();
		for (SelMylectures s : lslecture) {  
			teachMap.put(s.getTeach(),s.getTeachname());
		}
		
		model.addAttribute("teachMap",teachMap);
		model.addAttribute("login", "true");
		model.addAttribute("teach", lsstring);
		model.addAttribute("lecture", lslecture);

	}

	@RequestMapping(value = "/main")
	public String main(Locale locale, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			model.addAttribute("login", "false");
		} else { // 로그인 됨
			setTitle(model, id);
		}

		return "board/boardMain";
	}

	@RequestMapping(value = "/boardWrite")
	public String boardWrite(Locale locale, String lecture, Model model, HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "redirect:login";
		}
		model.addAttribute("lecture", lecture);
		model.addAttribute("memberid", (String) session.getAttribute("id"));
		return "board/boardWrite";
	}

	@RequestMapping(value = "/boardList")
	public String boardList(Locale locale, Model model, Integer boardid, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨
			try {
				setTitle(model, id);

				Board board = new Board();
				board.setMember_id(id);
				board.setLecture_id(boardid);

				List<Board> lsboard = boarddao.selectBoardById(board);
				Board ls = lsboard.get(0);

				model.addAttribute("title", ls.getLecture());
				model.addAttribute("lsboard", lsboard);
			} catch (Exception e) {
				return "redirect:main?err=boardlist";
			}
		}
		return "board/boardList";
	}

	@RequestMapping(value = "/lectureAdd")
	public String boadAdd(Locale locale, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨
			setTitle(model, id);
		}
		return "board/lectureAdd";
	}

	@RequestMapping(value = "/lectureAddInsert")
	public String boadAddInsert(Locale locale, Model model, String code, HttpSession session) {
		Mylecture mylecture = new Mylecture();
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		}
		setTitle(model, id);

		mylecture.setId(id);
		mylecture.setCode(code);

		boolean res = boarddao.insertlecture(mylecture);
		if (res) {
			model.addAttribute("code", "true");
			return "redirect:main";
		} else {
			model.addAttribute("code", "false");
		}

		return "board/lectureAdd";
	}

	@RequestMapping(value = "/boardWriteInsert")
	public String setFormData(@ModelAttribute("Board") Board board, String lecture, HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "redirect:login";
		}

		String memberid = "";
		memberid = (String) session.getAttribute("id");
		if (memberid == null) {
			return "redirect:login";
		}
		board.setMember_id(memberid);
		board.setLecture(lecture);

		boolean aa = boarddao.insertBoard(board);
		if (aa) {
			return "redirect:boardList?lecture=" + lecture;
		} else {
			return "boardWrite";
		}

	}

	@RequestMapping(value = "/boardDelete")
	public String boardDelete(String member_id, Integer id, String lecture, HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "redirect:login";
		}

		String sessionid = (String) session.getAttribute("id");

		if (member_id.equals(sessionid)) {
			boarddao.deleteBoard(id);
			return "redirect:boardList?lecture=" + lecture;
		} else {
			return "redirect:boardContent?lecture=" + lecture + "&id=" + id;
		}

	}

	@RequestMapping(value = "/boardContent")
	public String boardContent(HttpSession session, Model model, String title, Integer boardid) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨
			setTitle(model, id);

			try {
				// Reading 추가
				Reading reading = new Reading();
				reading.setBoard_id(boardid);
				reading.setMember_id(id);

				// Reading sql
				boolean res = boarddao.insertReading(reading);

				// parameterSetting
				Board board = new Board();
				board.setId(boardid);
				board.setMember_id(id);

				Board resboard = boarddao.selectContentById(board);

				model.addAttribute("board", resboard);
			} catch (Exception e) {
				return "redirect:main?err=boardcontent";
			}
		}

		return "board/boardContent";
	}


	@RequestMapping(value = "/boardContentQuiz")
	public String boardContentQuiz(HttpSession session, Model model, String title, Integer boardid) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		}

		return "board/boardContentQuiz";
	}
	
}
