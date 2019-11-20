package pan.qna.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class QnaDAOImpl implements QnaDAO {
	
	private SqlSessionTemplate sqlMap;

	public QnaDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List qnaList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map data=new HashMap(); //sql에서 맵으로 받도록 
		data.put("start", start);
		data.put("end", end);
		List list = sqlMap.selectList("qnaList",data);
		return list;
	}

	public int qnaWrite(QnaDTO dto) {
		int result = sqlMap.insert("qnaWrite",dto);
		return result;
	}

	public QnaDTO qnaDetail(int cidx) {
		QnaDTO dto = sqlMap.selectOne("qnaDetail",cidx);
		return dto;
	}
	
	public int getTotalmyCnt(String id) {
		int count=sqlMap.selectOne("totalmyCnt",id);
		return count==0?1:count;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("totalCnt");
		return count==0?1:count;
	}

	public int qnaModify(QnaDTO dto) {
		int result = sqlMap.update("qnaModify",dto);
		return result;
	}

	public int qnaDel(int cidx) {
		int result=sqlMap.delete("qnaDel",cidx);
		System.out.println(result);
		return result;
	}

	public List myQnaList(String id, int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map data = new HashMap();
		data.put("start", start);
		data.put("end", end);
		data.put("id", id);
		List list = sqlMap.selectList("myQnaList",data);
		return list;
	}

	public void statusUpdate(int cidx, int status) {
		Map data = new HashMap();
		data.put("cidx", cidx);
		data.put("status", status);
		sqlMap.update("statusUpdate",data);
	}



}
