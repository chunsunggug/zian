<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.alert('${userid}는 사용가능합니다.')
	opener.document.memberJoin.id.value='${userid}'; /* 폼의 아이디에 중복검사한 유저아이디 값을 입력시켜줌 */
	window.self.close();
</script>