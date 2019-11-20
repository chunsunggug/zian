package pan.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImpl implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;

	public MemberDAOImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int memberJoin(MemberDTO dto) {
		int count=sqlMap.insert("memberInsert",dto);
		return count;
	}

	public boolean idCheck(String userid) {
		String result = sqlMap.selectOne("idCheck",userid);
		return result==null?false:true;
	}


	public int loginCheck(String userid, String userpwd) {
		try {
		String dbpwd=sqlMap.selectOne("loginCheck",userid);
		if(dbpwd==null||dbpwd.equals("")) {
			return NOT_ID;
		}else {
			if(dbpwd.equals(userpwd)) {
				return LOGIN_OK;
			}else {
				return NOT_PWD;
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ERROR;
	}

	public MemberDTO getUserimfo(String userid) {
		MemberDTO dto =sqlMap.selectOne("userimfo",userid);
		return dto;
	}

	public int modifyImfo(MemberDTO dto) {
		int count=sqlMap.update("modifyImfo",dto);
		return count;
	}

	public int getTotalCnt() {
		int count=sqlMap.selectOne("totalmember");
		return count==0?1:count;
	}

	public List memberList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		List list=sqlMap.selectList("memberList",data);
		return list;
	}

	public int memberDel(int idx) {
		int result =sqlMap.delete("memberDel",idx);
		return result;
	}

	public String findQuiz(String id) {
		String quiz = sqlMap.selectOne("findQuiz",id);
		return quiz;
	}

	public String findpwd(String answer) {
		String pwd = sqlMap.selectOne("findPwd",answer);
		return pwd;
	}


}
