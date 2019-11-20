package pan.qna.model;

import java.util.List;

public interface QnaDAO {

	public List qnaList(int cp, int ls);
	public int qnaWrite(QnaDTO dto);
	public QnaDTO qnaDetail(int cidx);
	public int getTotalCnt();
	public int getTotalmyCnt(String id);
	public int qnaModify(QnaDTO dto);
	public int qnaDel(int cidx);
	public List myQnaList(String id, int cp, int ls);
	public void statusUpdate(int cidx, int status);

}
