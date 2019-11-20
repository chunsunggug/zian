package pan.bbs.model;

import java.util.List;

public interface BbsDAO {

	public List bbsList(int cp, int ls);
	public int getTotalCnt();
	public int bbsWrite(BbsDTO dto);
	public BbsDTO bbsDetail(int cidx);
	public int bbsModify(BbsDTO dto);
	public int bbsDel(int cidx);
	public List myBbsList(String id, int cp, int ls);
	public int getTotalmyCnt(String writer);
}
