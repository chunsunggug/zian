package pan.bbs.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class BbsDAOImpl implements BbsDAO {
	
	private SqlSessionTemplate sqlMap;
	
	

	public BbsDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}



	public int bbsWrite(BbsDTO dto) {
		int result = sqlMap.insert("bbsWrite",dto);
		return result;
	}



	public List bbsList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		List list=sqlMap.selectList("bbsList",data);
		return list;
	}



	public int getTotalCnt() {
		int count=sqlMap.selectOne("total");
		return count==0?1:count;
	}



	public BbsDTO bbsDetail(int cidx) {
		BbsDTO dto = sqlMap.selectOne("bbsDetail",cidx);
		return dto;
	}



	public int bbsModify(BbsDTO dto) {
		System.out.println(dto.getCategory());
		System.out.println(dto.getCidx());
		System.out.println(dto.getContent());
		System.out.println(dto.getMainimg());
		int result = sqlMap.update("bbsModify",dto);
		return result;
	}



	public int bbsDel(int cidx) {
		int result = sqlMap.delete("bbsDel",cidx);
		return result;
	}



	public int getTotalmyCnt(String id) {
		int count=sqlMap.selectOne("myTotal",id);
		return count==0?1:count;
	}



	public List myBbsList(String id, int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map data = new HashMap();
		data.put("start", start);
		data.put("end", end);
		data.put("id", id);
		List list = sqlMap.selectList("myBbsList",data);
		return list;
	}

}
