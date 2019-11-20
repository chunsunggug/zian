package pan.reply.model;

import java.util.List;

public interface ReplyDAO {

	public List qnaReplyList(int cidx, int cp, int listSize);
	public int qnaReplyWrite(ReplyDTO dto);
	public int bbsReplyWrite(ReplyDTO dto);
	public int getTotalBbsCnt(int cidx);
	public int getTotalQnaCnt(int cidx);
	public List bbsReplyList(int bcidx, int cp, int ls);
	public int replyDel(String writer);
}
