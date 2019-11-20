package pan.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pan.member.model.MemberDAO;
import pan.member.model.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping(value="memberJoin.do",method=RequestMethod.GET)
	public ModelAndView memberJoinForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberJoin");
		return mav;
	}
	
	@RequestMapping(value="memberJoin.do",method=RequestMethod.POST)
	public ModelAndView memberJoinSubmit(MemberDTO dto) {
		int result=memberDao.memberJoin(dto);
		String msg=result>0?"회원가입 성공":"회원가입 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","index.do");
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("/idCheckForm.do")
	public ModelAndView idCheckForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/idCheck");
		return mav;
	}
	
	@RequestMapping("/idCheck.do")
	public ModelAndView idCheckSubmit(
			@RequestParam("userid")String userid) {
		boolean result=memberDao.idCheck(userid);
		ModelAndView mav = new ModelAndView();
		
		if(result) {
			mav.addObject("msg",userid+"는 이미 존재합니다");
			mav.addObject("gourl","idCheckForm.do");
			mav.setViewName("member/memberMsg");
		}else {
			mav.addObject("userid",userid);
			mav.setViewName("member/idCheck_ok");
		}
		return mav;
	}
	
	@RequestMapping("/login.do")
	public ModelAndView LoginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginForm");
		return mav;
	}
	
	@RequestMapping("/login_ok.do")
	public ModelAndView login_ok(
			@RequestParam("id")String userid,
			@RequestParam("pwd")String userpwd,
			HttpSession session,
			@RequestParam(value="saveid",required=false)String saveid, //선택or 선텍x를 위해 리콰이어드 폴스
			HttpServletResponse resp) { //쿠키를 저장하기위한 리스펀스 객체
		
		ModelAndView mav = new ModelAndView();
		
		int result = memberDao.loginCheck(userid, userpwd);
		if(result==memberDao.LOGIN_OK) {
			if(saveid==null||saveid.equals("")) {
				Cookie ck=new Cookie("saveid", userid);
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}else {
				Cookie ck=new Cookie("saveid", userid);
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}
			MemberDTO dto=memberDao.getUserimfo(userid);
			session.setAttribute("sid", userid);
			session.setAttribute("spwd", userpwd);
			session.setAttribute("sname", dto.getName());
			session.setAttribute("sphone",dto.getPhone());
			session.setAttribute("squiz",dto.getQuiz());
			session.setAttribute("sanswer",dto.getAnswer());
			session.setAttribute("sgrade", dto.getGrade());
			mav.addObject("msg",dto.getName()+"님 환영합니다");
			mav.addObject("gourl","index.do");
			mav.setViewName("member/memberMsg");
		}else {
			mav.addObject("msg","계정정보 확인 바람");
			mav.addObject("gourl","index.do");
			mav.setViewName("member/memberMsg");
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do"); //명령어로 곧바로 페이지 이동
		return mav;
	}
	
	@RequestMapping("/memberList.do")
	public ModelAndView memberList(
			@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=memberDao.getTotalCnt();
		int listSize=3;
		int pageSize=3;
		List list= memberDao.memberList(cp, listSize);
		String pageStr=pan.page.PageModule.makePage("memberList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("member/memberList");
		return mav;
	}
	
	@RequestMapping("/memberDel.do")
	public ModelAndView memberDel(
			@RequestParam("idx")int idx) {
		int result = memberDao.memberDel(idx);
		String msg = result>0?"삭제완료":"삭제실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","memberList.do");
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("/findPwd.do")
	public String findPwd() {
		return "member/findPwd";
	}
	
	@RequestMapping("/findQuiz.do")
	public ModelAndView findQuiz(
			@RequestParam("id")String id) {
		String quiz = memberDao.findQuiz(id);
		ModelAndView mav = new ModelAndView();
		String msg="";
		mav.addObject("quiz",quiz);
		if(quiz==null) {
			msg="E-mail을 다시 확인해 주세요";
			mav.addObject("gourl","findPwd.do");
			mav.addObject("msg",msg);
			mav.setViewName("member/memberMsg");
		}else {
			mav.addObject("id",id);
			mav.setViewName("member/findPwd");
		}
		return mav;
	}
	
	@RequestMapping("/findPwdSubmit.do")
	public ModelAndView findPwdSubmit(
			@RequestParam("answer")String answer) {
		String pwd = memberDao.findpwd(answer);
		ModelAndView mav = new ModelAndView();
		String msg="";
		if(pwd==null) {
			msg="질문의 정답을 다시 확인해 주세요";
			mav.addObject("gourl","findPwd.do");
			mav.addObject("msg",msg);
			mav.setViewName("member/memberMsg");			
		}else {
			msg="비밀번호는["+pwd+"]입니다";
			mav.addObject("gourl","index.do");
			mav.addObject("msg",msg);
			mav.setViewName("member/memberMsg");
		}
		return mav;
	}
}
