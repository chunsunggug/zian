package pan.member.model;

import java.util.List;

public interface MemberDAO {

	public int NOT_ID=1;
	public int NOT_PWD=2;
	public int LOGIN_OK=3;
	public int ERROR=-1;
	
	public int memberJoin(MemberDTO dto);
	public boolean idCheck(String userid);
	public int loginCheck(String userid, String userpwd);
	public MemberDTO getUserimfo(String userid);
	public int modifyImfo(MemberDTO dto);
	public int getTotalCnt();
	public List memberList(int cp, int ls);
	public int memberDel(int idx);
	public String findQuiz(String id);
	public String findpwd(String answer);
}
