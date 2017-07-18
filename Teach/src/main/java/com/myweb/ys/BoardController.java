package com.myweb.ys;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.myweb.mybatis.dao.BoardDaoImpl;
import com.myweb.mybatis.dao.MemberDaoImpl;
import com.myweb.mybatis.domain.Board;
import com.myweb.mybatis.domain.EditBoard;
import com.myweb.mybatis.domain.Image;
import com.myweb.mybatis.domain.Lecture;
import com.myweb.mybatis.domain.SelMylectures;

@Controller
public class BoardController {

	@Resource(name = "boardDao")
	private BoardDaoImpl boarddao;

	@Resource(name = "memberDao")
	private MemberDaoImpl memberDaoImpl;

	private void setTitle(Model model, String id) {
		List<SelMylectures> lslecture = boarddao.selectMyLecture(id);
		TreeSet<String> lsstring = new TreeSet<String>();
		for (SelMylectures s : lslecture) {
			lsstring.add(s.getTeach());
		}

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
	public String boardWrite(Locale locale, Integer lectureid, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else {
			model.addAttribute("lectureid", lectureid);
			return "board/boardWrite";
		}
	}

	@RequestMapping(value = "/boardEdit")
	public String boardEdit(Model model, String member_id, Integer boardid, String lectureid, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨

			// parameterSetting
			Board board = new Board();
			board.setId(boardid);
			board.setMember_id(id);

			Board resboard = boarddao.selectContentById(board);

			model.addAttribute("lectureid", lectureid);
			model.addAttribute("boardid", boardid);
			model.addAttribute("board", resboard);

			return "board/boardEdit";
		}

	}
	@RequestMapping(value = "/boardEditUpdate")
	public String boardEditUpdate(Model model, @ModelAttribute("EditBoard") EditBoard editboard, String lectureid,HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		}
		
		editboard.setSessionid(id);
		boolean aa = boarddao.editBoardById(editboard);
		if (aa) {
			return "redirect:boardList?lectureid=" + lectureid;
		}else{
			return "redirect:boardContent?boardid="+editboard.getId()+"&lectureid="+lectureid;
		}

	}

	
	
	
	

	@RequestMapping(value = "/boardList")
	public String boardList(Locale locale, Model model, Integer lectureid, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨
			setTitle(model, id);

			List<Board> lsboard = boarddao.selectBoardById(lectureid);
			model.addAttribute("lectureid", lectureid);
			model.addAttribute("lsboard", lsboard);
		}
		return "board/boardList";
	}

	@RequestMapping(value = "/lectureList")
	public String lectureList(Locale locale, Model model, Integer boardid, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨
			setTitle(model, id);

			List<Lecture> lslecture = boarddao.selectLectureById(id);

			model.addAttribute("lslecture", lslecture);
		}
		return "board/lectureList";
	}

	@RequestMapping(value = "/lectureAdd")
	public String boadAdd(Locale locale, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨
			setTitle(model, id);
			MyUtil myutil = new MyUtil();

			model.addAttribute("rndStr", myutil.getRndString(4));

		}
		return "board/lectureAdd";
	}

	@RequestMapping(value = "/lectureAddInsert")
	public String boadAddInsert(Locale locale, Model model, String lecture_code, String lecture_name,
			HttpSession session) {
		Lecture lecture = new Lecture();
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		}
		setTitle(model, id);

		lecture.setTeach(id); // 교수자 아이디
		lecture.setCode(lecture_code);
		lecture.setName(lecture_name);

		boolean res = boarddao.insertlecture(lecture);
		if (res) {
			model.addAttribute("code", "true");
			return "redirect:main?err=lecturetrue";
		} else {
			model.addAttribute("code", "false");
		}

		return "board/lectureAdd";
	}

	@RequestMapping(value = "/boardWriteInsert")
	public String setFormData(@ModelAttribute("Board") Board board, Integer lectureid, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		}

		
		
		board.setMember_id(id);
		board.setLecture_id(lectureid);

		boolean aa = boarddao.insertBoard(board);
		if (aa) {
			return "redirect:boardList?lectureid=" + lectureid;
		} else {
			return "boardWrite";
		}

	}
	
	@RequestMapping(value = "/quizWrite")
	public String quizWrite(Locale locale, Integer lectureid, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else {
			model.addAttribute("lectureid", lectureid);
			return "board/quizWrite";
		}
	}

	

	@RequestMapping(value = "/boardDelete")
	public String boardDelete(String member_id, Integer boardid, String lectureid, HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "redirect:login";
		}

		String sessionid = (String) session.getAttribute("id");
		System.out.println("member_id" + member_id + " boardid " + boardid + " lectureid " + lectureid);

		if (member_id.equals(sessionid)) {
			boarddao.deleteBoard(boardid, sessionid);
			return "redirect:boardList?lectureid=" + lectureid;
		} else {
			return "redirect:boardContent?lectureid=" + lectureid + "&boardid=" + boardid;
		}

	}

	@RequestMapping(value = "/boardContent")
	public String boardContent(HttpSession session, Model model, String title, String lectureid, Integer boardid) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨
			setTitle(model, id);

			// parameterSetting
			Board board = new Board();
			board.setId(boardid);
			board.setMember_id(id);

			Board resboard = boarddao.selectContentById(board);
			model.addAttribute("lectureid", lectureid);
			model.addAttribute("board", resboard);
		}

		return "board/boardContent";
	}

	@RequestMapping(value = "/boardImageUpload")
	public String boardImageUpload(HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨

		}
		return "board/popup";
	}

	@RequestMapping(value = "/boardImageUploadInsert")
	public String boardImageUploadInsert(MultipartHttpServletRequest request,ModelMap model,HttpSession session) {
		Image image = new Image();
		Map<String,MultipartFile>files = request.getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile)files.get("filef");
		//String path = "/Users/younsookim/Documents/2017.1/jsp/project/Teach/src/main/webapp/res/upload/";
		//path = "/Applications/sts-bundle/pivotal-tc-server-developer-3.2.4.SR1/base-instance/wtpwebapps/Teach/res/upload/"; //실제주소
		String path  = session.getServletContext().getRealPath("/res/upload/");
		image.setOfn(cmf.getOriginalFilename());
		try {
			if (!image.getOfn().equals("")) {
				String[] end = cmf.getContentType().split("/");
				image.setFsn(new MyUtil().uuid()+"."+end[1]);

				byte[] buf = new byte[1024 * 8];
				int len = 0;
				// DB에기록
				//boolean res = (boolean) boarddao.insertImage(image);
				if (true) {
					OutputStream out = new FileOutputStream(path+"/"+image.getFsn(),true);
					InputStream in = cmf.getInputStream();
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
						out.flush();
					}
					in.close();
					out.close();
					// boolean aa = boarddao.insertBoard(board);

				}
			}
		}catch(IOException e){
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("imageurl", image.getFsn());
		return "board/popup";
	}

	@RequestMapping(value = "/boardpopup")
	public String boardpopup(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:login";
		} else { // 로그인 됨
			setTitle(model, id);
		}

		return "board/popup";
	}

}
