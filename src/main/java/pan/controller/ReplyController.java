package pan.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pan.qna.model.QnaDAO;
import pan.reply.model.ReplyDAO;
import pan.reply.model.ReplyDTO;

@Controller
public class ReplyController {

	@Autowired
	private ReplyDAO replyDao;
	
	@Autowired
	private QnaDAO qnaDao;
	
	@RequestMapping("/qnaReplyWrite.do")
	public ModelAndView qnaReplyWrite(ReplyDTO dto) {
		int result = replyDao.qnaReplyWrite(dto);
		String msg=result>0?"등록완료":"등록실패";
		qnaDao.statusUpdate(dto.getCidx(),1);
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","qnaList.do");
		mav.setViewName("reply/replyMsg");
		return mav;
	}
	
	@RequestMapping("/bbsReplyWrite.do")
	public ModelAndView bbsReplyWrite(ReplyDTO dto) {
		int result = replyDao.bbsReplyWrite(dto);
		String msg=result>0?"등록완료":"등록실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","bbsList.do");
		mav.setViewName("reply/replyMsg");
		return mav;
	}
	
	@RequestMapping("/bbsReplyDel.do")
	public ModelAndView bbsReplyDel(
			@RequestParam("writer")String writer) {
		int result = replyDao.replyDel(writer);
		String msg = result>0?"삭제완료":"삭제실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","bbsList.do");
		mav.setViewName("bbs/bbsMsg");
		return mav;
	}
	
	@RequestMapping("/qnaReplyDel.do")
	public ModelAndView qnaReplyDel(
			@RequestParam("writer")String writer) {
		int result = replyDao.replyDel(writer);
		String msg = result>0?"삭제완료":"삭제실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","qnaList.do");
		mav.setViewName("bbs/bbsMsg");
		return mav;
	}
	
}
