package pan.page;

public class PageModule {

	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp) {   //사용할 페이지 이름, 총게시물 수, 리스트 사이즈, 페이지 사이즈 , 현재 위치 페이지
		
		StringBuffer sb=new StringBuffer(); //문자열을 조작하기위한 클래스(String buffer api 활용)
		
		int totalPage=(totalCnt/listSize)+1;
		if(totalCnt%listSize==0)totalPage--;
		int userGroup=cp/pageSize;
		if(cp%pageSize==0)userGroup--;
		
		
		if(userGroup!=0){ //왼쪽으로 가는 화살표
			//잘라서 sb append로 합치기
			sb.append("<li><a href='");
			sb.append(pagename); //pageTest.jsp까지
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'>&laquo;</a></li>");
			//<a href="pageTest.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
		}
		
		for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
			
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a></li>");
			//&nbsp;&nbsp;<a href="pageTest.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
			if(i==totalPage)break;
		}
		
		if(userGroup!=(totalPage)/pageSize-(totalPage%pageSize==0?1:0)){
			sb.append("<li><a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			sb.append("'>&raquo;</a></li>");
			//<a href="pageTest.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
		}
		return sb.toString();
	}
}
