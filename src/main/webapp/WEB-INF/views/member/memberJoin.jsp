<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function() {
   document.memberJoin.id.value="";
});
function back(){
   window.location.href='index.do';
}
function checkValue() {
   var phone = document.memberJoin.phone.value;
   var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
   if (!document.memberJoin.id.value) {
      alert("아이디를 입력하세요.");
      return false;
   }
   if (!document.memberJoin.pwd.value) {
      alert("비밀번호를 입력하세요.");
      return false;
   }
   if (document.memberJoin.pwd.value != document
         .getElementById("pwdcheck").value) {
      alert("비밀번호를 동일하게 입력하세요.");
      return false;
   }
   if( !regExp.test(phone) ) {
       alert('전화 번호를 정확히 입력해주세요.');
       return false;
   }
}
function openIdCheck(){
   window.open('idCheckForm.do','idCheck','width=300,height=200');
}


</script>
<body>
<h1>회원가입</h1>
<form name="memberJoin" action="memberJoin.do" method="post" onsubmit="return checkValue()">
   <fieldset>
      <legend>회원가입</legend>
      <ul>
         <li>ID:<input type="text" name="id" readonly="readonly">
         <input type="button" value="중복검사" onclick="openIdCheck()"></li>
         <li>비밀번호:<input type="password" name="pwd" required></li>
         <li>비밀번호 확인:<input type="password" id="pwdcheck" required></li>
         <li>이름:<input type="text" name="name" required></li>
         <li>전화번호:<input type="text" name="phone" required></li>
         <li>비밀번호 질문:<input type="text" name="quiz" required></li>
         <li>비밀번호 질문 답:<input type="text" name="answer" required></li>
      </ul>
      <p>
         <input type="submit" value="회원가입">
      </p>
   </fieldset>
</form>
</body>
</html>