package pan.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pan.bbs.model.BbsDAO;
import pan.member.model.MemberDAO;
import pan.member.model.MemberDTO;
import pan.qna.model.QnaDAO;
import pan.qna.model.QnaDTO;

@Controller
public class myPageController {

	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping("/mypage.do")
	public String myPageForm() {
		return "mypage/myPage";
	}
	
	@RequestMapping("/modifyForm.do")
	public String modifyForm() {
		return "mypage/modifyForm";
	}
	
	@RequestMapping(value="modifyImfo.do",method=RequestMethod.POST)
	public ModelAndView modifyImfoSubmit(MemberDTO dto,HttpSession session) {
		if(dto.getPwd()==null||dto.getPwd()=="") {
			String msg="변경할 비밀번호를 입력해 주세요";
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg",msg);
			mav.addObject("gourl","mypage.do");
			mav.setViewName("mypage/mypageMsg");
			return mav;
		}else {
			int result = memberDao.modifyImfo(dto);
			String msg=result>0?"변경 완료":"변경 실패";
			
			session.setAttribute("sid", dto.getId());
			session.setAttribute("spwd", dto.getPwd());
			session.setAttribute("sname", dto.getName());
			session.setAttribute("sphone",dto.getPhone());
			session.setAttribute("squiz",dto.getQuiz());
			session.setAttribute("sanswer",dto.getAnswer());
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg",msg);
			mav.addObject("gourl","mypage.do");
			mav.setViewName("mypage/mypageMsg");
			return mav;
		}
	}
	
	@Autowired
	private BbsDAO bbsDao;
	
	@RequestMapping("/myBbsList.do")
	public ModelAndView myBbsList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="id",defaultValue="0")String id) {
		int totalCnt=bbsDao.getTotalmyCnt(id);
		int listSize=10;
		int pageSize=10;
		List list = bbsDao.myBbsList(id,cp,listSize);
		String pageStr=pan.page.myBbsPageModule.makePage("myBbsList.do", id, totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		if(list==null) {
			mav.addObject("msg","등록한 게시글이 없습니다.");
			mav.setViewName("mypage/myBbsList");
		}else {
			mav.addObject("list",list);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("mypage/myBbsList");
		}
		return mav;
	}
	
	@Autowired
	private QnaDAO qnaDao;
	
	@RequestMapping("/myQnaList.do")
	public ModelAndView myQnaList(
			@RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value="id",defaultValue="0")String id) {
		int totalCnt=qnaDao.getTotalmyCnt(id);
		int listSize=10;
		int pageSize=10;
		List list = qnaDao.myQnaList(id,cp,listSize);
		String pageStr=pan.page.myBbsPageModule.makePage("myQnaList.do", id, totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		if(list==null) {
			mav.addObject("msg","등록한 문의사항이 없습니다.");
			mav.setViewName("mypage/myQnaList");			
		}else {
			
			   for(int i=0;i<list.size();i++) {
		            QnaDTO qdto = new QnaDTO();
		            qdto = (QnaDTO)list.get(i);
		            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		            String newDate = sdf.format(qdto.getWritedate());
		            Date d = java.sql.Date.valueOf(newDate);
		            qdto.setWritedate(d);
		         }
			
			mav.addObject("list",list);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("mypage/myQnaList");
		}
		return mav;
	}
}
