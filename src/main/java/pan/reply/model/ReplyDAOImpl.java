package pan.reply.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ReplyDAOImpl implements ReplyDAO {
	
	private SqlSessionTemplate sqlMap;

	public ReplyDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List qnaReplyList(int cidx, int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		data.put("cidx", cidx);
		List rlist = sqlMap.selectList("qnaReplyList",data);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      for(int i=0;i<rlist.size();i++)
	      {
	         ReplyDTO rdto = new ReplyDTO();
	         rdto = (ReplyDTO)rlist.get(i);
	         String replyDate = sdf.format(rdto.getWritedate());
	         Date reply = java.sql.Date.valueOf(replyDate);
	         rdto.setWritedate(reply);
	         rlist.set(i,rdto);
	      }
		
		return rlist;
	}

	public int qnaReplyWrite(ReplyDTO dto) {
		int result = sqlMap.insert("qnaReplyWrite",dto);
		return result;
	}

	public int replyDel(int ridx) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getTotalBbsCnt(int cidx) {
		int count=sqlMap.selectOne("totalBbsReply",cidx);
		return count==0?1:count;
	}
	public int getTotalQnaCnt(int cidx) {
		int count=sqlMap.selectOne("totalQnaReply",cidx);
		return count==0?1:count;
	}	

	public int bbsReplyWrite(ReplyDTO dto) {
		int result = sqlMap.insert("bbsReplyWrite",dto);
		return result;
	}

	public List bbsReplyList(int cidx, int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		data.put("cidx", cidx);
		List rlist = sqlMap.selectList("bbsReplyList",data);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      for(int i=0;i<rlist.size();i++)
	      {
	         ReplyDTO rdto = new ReplyDTO();
	         rdto = (ReplyDTO)rlist.get(i);
	         String replyDate = sdf.format(rdto.getWritedate());
	         Date reply = java.sql.Date.valueOf(replyDate);
	         rdto.setWritedate(reply);
	         rlist.set(i,rdto);
	      }
		
		return rlist;
	}

	public int replyDel(String writer) {
		int result = sqlMap.delete("replyDel",writer);
		return result;
	}

}
