package pan.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pan.qna.model.QnaDAO;
import pan.qna.model.QnaDTO;
import pan.reply.model.ReplyDAO;
import pan.reply.model.ReplyDTO;

@Controller
public class QnaController {

	@Autowired
	private QnaDAO qnaDao;
	
	
	@RequestMapping("/qnaList.do")
	   public ModelAndView qnaList(
	         @RequestParam(value="cp",defaultValue="1")int cp) {
	      int totalCnt=qnaDao.getTotalCnt();
	      int listSize=10;
	      int pageSize=10;
	      List list = qnaDao.qnaList(cp,listSize);
	       
	      for(int i=0;i<list.size();i++) {
	         QnaDTO qdto = new QnaDTO();
	         qdto = (QnaDTO)list.get(i);
	         try {
	            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
	            String newDate = sdf.format(qdto.getWritedate());
	            Date d = java.sql.Date.valueOf(newDate);
	            qdto.setWritedate(d);
	         } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }
	      
	      String pageStr=pan.page.PageModule.makePage("qnaList.do", totalCnt, listSize, pageSize, cp);
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("list",list);
	      mav.addObject("pageStr",pageStr);
	      mav.setViewName("qna/qnaList");
	      return mav;
	   }
	
	@RequestMapping("/qnaWriteform.do")
	public String qnaWriteform() {
		return "qna/qnaWriteform";
	}
	
	@RequestMapping("/qnaWrite.do")
	public ModelAndView qnaWrite(QnaDTO dto) {
		int result=qnaDao.qnaWrite(dto);
		String msg=result>0?"등록완료":"등록실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","qnaList.do");
		mav.setViewName("qna/qnaMsg");
		return mav;
	}
	
	@Autowired
	private ReplyDAO replyDao;
	
	@RequestMapping("/qnaDetail.do")
	public ModelAndView qnaDetail(
			@RequestParam(value="cidx",defaultValue="0")int cidx,
			@RequestParam(value="cp",defaultValue="1")int cp) {
			int totalCnt=replyDao.getTotalQnaCnt(cidx);
			int listSize=10;
			int pageSize=10;		
			QnaDTO qdto = qnaDao.qnaDetail(cidx);
			List rlist = replyDao.qnaReplyList(cidx,cp,listSize);
			if(rlist.size()==0) {
				qnaDao.statusUpdate(cidx,0);
			}
			String pageStr=pan.page.ReplyPageModule.makePage("qnaDetail.do",cidx, totalCnt, listSize, pageSize, cp);
			ModelAndView mav = new ModelAndView();
			if(qdto==null) {
				mav.addObject("msg","삭제된 게시물 또는 잘못된 접근입니다.");
				mav.setViewName("qna/qnaList");
			}else {
				
		         SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		         String newDate = sdf.format(qdto.getWritedate());
		         Date d = java.sql.Date.valueOf(newDate);
		         qdto.setWritedate(d);
		         
		         for(int i=0;i<rlist.size();i++) {
		             ReplyDTO rdto = new ReplyDTO();
		             rdto=(ReplyDTO)rlist.get(i);
		             String replyDate = sdf.format(rdto.getWritedate());
		             Date reply = java.sql.Date.valueOf(replyDate);
		             qdto.setWritedate(reply);
		          }
				
				qdto.setContent(qdto.getContent().replaceAll("\n", "<br>")); //계행처리
				mav.addObject("rlist",rlist);
				mav.addObject("qdto",qdto);
				mav.addObject("pageStr",pageStr);
				mav.setViewName("qna/qnaDetail");
			}
		return mav;
		
	}
	
	@RequestMapping("/qnaModifySubmit.do")
	public ModelAndView qnaModify(QnaDTO dto) {
		int result=qnaDao.qnaModify(dto);
		String msg=result>0?"수정완료":"수정실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","qnaList.do");
		mav.setViewName("qna/qnaMsg");
		return mav;
	}
	
	@RequestMapping("/qnaDel.do")
	public ModelAndView qnaDel(
			@RequestParam("cidx")int cidx) {
		int result = qnaDao.qnaDel(cidx);
		String msg = result>0?"삭제완료":"삭제실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","qnaList.do");
		mav.setViewName("qna/qnaMsg");
		return mav;
	}
	
	@RequestMapping("/qnaModify.do")
	public ModelAndView qnaModifyForm(QnaDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("qna/qnaModifyForm");
		return mav;
	}
}
