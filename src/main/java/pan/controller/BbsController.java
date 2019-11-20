package pan.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pan.bbs.model.BbsDAO;
import pan.bbs.model.BbsDTO;
import pan.reply.model.ReplyDAO;
import pan.reply.model.ReplyDTO;

@Controller
public class BbsController {
	
	int random = (int)(Math.random()*1000000000);
	final String uploadUrl = "C:\\_model2_mvc_study\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\JianProject\\upload\\"; 
	@Autowired
	private BbsDAO bbsDao;
	
	@RequestMapping("/bbsList.do")
	public ModelAndView bbsList(
			@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=bbsDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		List list= bbsDao.bbsList(cp, listSize);
		String pageStr=pan.page.PageModule.makePage("bbsList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("bbs/bbsList");
		return mav;
	}
	
	@RequestMapping("/bbsWrite.do")
	public String writeBbsForm() {
		return "bbs/writeBbsForm";
	}
	
	public void copyMain(MultipartFile mainImg){
		
		try {
			byte bytes[]=mainImg.getBytes();
			File outFile = new File(uploadUrl+random+mainImg.getOriginalFilename());
			
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void copySub1(MultipartFile subImg1){
		
		try {
			byte bytes[]=subImg1.getBytes();
			File outFile = new File(uploadUrl+random+subImg1.getOriginalFilename());
			
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void copySub2(MultipartFile subImg2){
		
		try {
			byte bytes[]=subImg2.getBytes();
			File outFile = new File(uploadUrl+random+subImg2.getOriginalFilename());
			
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void copySub3(MultipartFile subImg3){
		
		try {
			byte bytes[]=subImg3.getBytes();
			File outFile = new File(uploadUrl+random+subImg3.getOriginalFilename());
			
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/bbsWriteSubmit.do")
	public ModelAndView bbsWrite(
			@RequestParam("writer")String writer,
			@RequestParam("id")String id,
			@RequestParam("category")String category,
			@RequestParam("title")String title,
			@RequestParam("content")String content,
			@RequestParam("mainimg")MultipartFile mainimg,
			@RequestParam("subimg1")MultipartFile subimg1,
			@RequestParam("subimg2")MultipartFile subimg2,
			@RequestParam("subimg3")MultipartFile subimg3) {
		BbsDTO dto = new BbsDTO();
		dto.setWriter(writer);
		dto.setId(id);
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setContent(content);
		
		if(mainimg.getOriginalFilename().equals("")) {
			dto.setMainimg("null");
		}else {
			dto.setMainimg(random+mainimg.getOriginalFilename());
			copyMain(mainimg);
		}
		
		if(subimg1.getOriginalFilename().equals("")) {
			dto.setSubimg1("null");
		}else {
			dto.setSubimg1(random+subimg1.getOriginalFilename());
			copySub1(subimg1);
		}

		if(subimg2.getOriginalFilename().equals("")) {
			dto.setSubimg2("null");
		}else {
			dto.setSubimg2(random+subimg2.getOriginalFilename());
			copySub2(subimg2);
		}

		if(subimg3.getOriginalFilename().equals("")) {
			dto.setSubimg3("null");
		}else {
			dto.setSubimg3(random+subimg3.getOriginalFilename());
			copySub3(subimg3);
		}
		
		int result=bbsDao.bbsWrite(dto);

		String msg=result>0?"등록 완료":"등록 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gourl","bbsList.do");
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("/bbsModifySubmit.do")
	   public ModelAndView bbsModifySubmit(
	         @RequestParam("cidx")int cidx,
	         @RequestParam("category")String category,
	         @RequestParam("title")String title,
	         @RequestParam("content")String content,
	         @RequestParam("fakeMain")String fakeMain,
	         @RequestParam("fakeSub1")String fakeSub1,
	         @RequestParam("fakeSub2")String fakeSub2,
	         @RequestParam("fakeSub3")String fakeSub3,
	         @RequestParam("mainimg")MultipartFile mainimg,
	         @RequestParam("subimg1")MultipartFile subimg1,
	         @RequestParam("subimg2")MultipartFile subimg2,
	         @RequestParam("subimg3")MultipartFile subimg3) {
	      
	      if(mainimg.getOriginalFilename().length()!=0) {
	         imgDel(fakeMain,uploadUrl);
	      }
	      if(subimg1.getOriginalFilename().length()!=0) {
	         imgDel(fakeSub1,uploadUrl);
	      }
	      if(subimg2.getOriginalFilename().length()!=0) {
	         imgDel(fakeSub2,uploadUrl);
	      }
	      if(subimg3.getOriginalFilename().length()!=0) {
	         imgDel(fakeSub3,uploadUrl);
	      }
	      
	      BbsDTO dto = new BbsDTO();
	      dto.setCidx(cidx);
	      dto.setCategory(category);
	      dto.setTitle(title);
	      dto.setContent(content);
	      
			if(mainimg.getOriginalFilename().equals("")) {
				dto.setMainimg("null");
			}else {
				dto.setMainimg(random+mainimg.getOriginalFilename());
				copyMain(mainimg);
			}
			
			if(subimg1.getOriginalFilename().equals("")) {
				dto.setSubimg1("null");
			}else {
				dto.setSubimg1(random+subimg1.getOriginalFilename());
				copySub1(subimg1);
			}

			if(subimg2.getOriginalFilename().equals("")) {
				dto.setSubimg2("null");
			}else {
				dto.setSubimg2(random+subimg2.getOriginalFilename());
				copySub2(subimg2);
			}

			if(subimg3.getOriginalFilename().equals("")) {
				dto.setSubimg3("null");
			}else {
				dto.setSubimg3(random+subimg3.getOriginalFilename());
				copySub3(subimg3);
			}
	      
	      
	      
	      int result=bbsDao.bbsModify(dto);
	      
	      String msg=result>0?"수정완료":"수정실패";
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("msg",msg);
	      mav.addObject("gourl","bbsList.do");
	      mav.setViewName("bbs/bbsMsg");
	      return mav;
	   }
	
	@Autowired 
	private ReplyDAO replyDao;
	
	@RequestMapping("/bbsDetail.do")
	public ModelAndView bbsDetail(
			@RequestParam(value="cidx",defaultValue="0")int cidx,
			@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=replyDao.getTotalBbsCnt(cidx);
		int listSize=10;
		int pageSize=10;
		BbsDTO bdto = bbsDao.bbsDetail(cidx);
		List rlist = replyDao.bbsReplyList(cidx,cp,listSize);
		String pageStr=pan.page.ReplyPageModule.makePage("bbsDetail.do",cidx, totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		if(bdto==null) {
			mav.addObject("msg","삭제된 게시물 또는 잘못된 접근입니다.");
			mav.setViewName("bbs/bbsList");
		}else {
			
	         SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
	         String newDate = sdf.format(bdto.getWritedate());
	         Date d = java.sql.Date.valueOf(newDate);
	         bdto.setWritedate(d);
	         
	         for(int i=0;i<rlist.size();i++) {
	             ReplyDTO rdto = new ReplyDTO();
	             rdto=(ReplyDTO)rlist.get(i);
	             String replyDate = sdf.format(rdto.getWritedate());
	             Date reply = java.sql.Date.valueOf(replyDate);
	             bdto.setWritedate(reply);
	          }
			
			bdto.setContent(bdto.getContent().replaceAll("\n", "<br>"));
			mav.addObject("rlist",rlist);
			mav.addObject("bdto",bdto);
			mav.addObject("pageStr",pageStr);
			mav.setViewName("bbs/bbsDetail");
		}
		return mav;
	}
	
	@RequestMapping("/bbsModify.do")
	public ModelAndView bbsModify(BbsDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bdto",dto);
		mav.setViewName("bbs/bbsModify");
		return mav;
	}
	
	
	@RequestMapping("/bbsDel.do")
	   public ModelAndView bbsDel(
	         @RequestParam("cidx")int cidx,
	         @RequestParam("mainimg")String mainimg,
	         @RequestParam("subimg1")String subimg1,
	         @RequestParam("subimg2")String subimg2,
	         @RequestParam("subimg3")String subimg3
	         ) {
	      imgDel(mainimg,uploadUrl);
	      imgDel(subimg1,uploadUrl);
	      imgDel(subimg2,uploadUrl);
	      imgDel(subimg3,uploadUrl);
	      
	      int result = bbsDao.bbsDel(cidx);
	      String msg = result>0?"삭제완료":"삭제실패";
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("msg",msg);
	      mav.addObject("gourl","bbsList.do");
	      mav.setViewName("bbs/bbsMsg");
	      return mav;
	   }
	   
	   public void imgDel(String profName,String url) {
	      try {
	         File delFile=new File(url+"/"+profName);
	         if(delFile.exists()) {
	            delFile.delete();
	         }else {
	            System.out.println("파일이 존재하지 않습니다.");
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	
}
