<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="sid" value="${sessionScope.sid }" scope="session" />
<!-- 세션 안에있는 회원정보를 var에 셋팅함 -->
<c:set var="sname" value="${sessionScope.sname }" scope="session" />
<!-- 스코프를 세션으로 설정하지않으면 리퀘스트로 받음 -->
<c:set var="sgrade" value="${sessionScope.sgrade }" scope="session" />
<!-- *** TOPBAR ***
 _________________________________________________________ -->
<div id="top">


   <div class="container">
      <div class="col-md-6 offer" data-animate="fadeInDown">
         <a href="#"></a>
      </div>



      <div class="col-md-6" data-animate="fadeInDown">
         <ul class="menu">
            <c:if test="${empty sid}">
               <li><a href="#" data-toggle="modal" data-target="#login-modal">로그인</a>
               </li>
               <li><a href="#" data-toggle="modal" data-target="#reg-modal">회원가입</a>
               </li>
            </c:if>
            <c:if test="${not empty sid}">
               <li><a href="#">${sname}님 환영합니다.</a></li>
               <li><a href="mypage.do">마이페이지</a></li>
               <li><a href="logout.do">로그아웃</a></li>
               <c:if test="${sgrade eq 1 }">
                  <li><a href="memberList.do">회원관리</a></li>
               </c:if>
            </c:if>
         </ul>
      </div>
   </div>





   <!-- login modal -->
   <div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
      aria-labelledby="Login" aria-hidden="true">
      <div class="modal-dialog modal-sm">

         <div class="modal-content">
            <div class="modal-header">

               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="Login">로그인</h4>

            </div>
            <div class="modal-body">

               <form name="memberLogin" action="login_ok.do" method="post">
                  <div class="form-group">
                     <input type="text" class="form-control" name="id"
                        id="email-modal" placeholder="E - mail" value="${cookie.saveid.value }">
                  </div>
                  
                  <div class="form-group">
                     <input type="password" class="form-control" name="pwd"
                        id="password-modal" placeholder="password">
                  </div>
                  <div>&nbsp;&nbsp;&nbsp;&nbsp;아이디 기억하기&nbsp;&nbsp;&nbsp;<input type="checkbox" name="saveid" ${empty cookie.saveid.value?"":"checked" }></div>
                  <br>
                  <p class="text-center">
                     <button class="btn btn-primary" type="submit">
                        <i class="fa fa-sign-in"></i> 로그인
                     </button>
                  </p>
               </form>
				<p><a href="findPwd.do">비밀번호를 분실하셨나요?</a></p>
            </div>
         </div>
      </div>
   </div>

   <!-- register modal -->
   <div class="modal fade" id="reg-modal" tabindex="-1" role="dialog"
      aria-labelledby="Login" aria-hidden="true">
      <div class="modal-dialog modal-sm">

         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="Login">회원가입</h4>
            </div>
            <div class="modal-body">


               <form action="memberJoin.do" method="post" name="memberJoin" onsubmit="return checkValue()">
                  <div class="form-group">
                     <input type="text" class="form-control" name="id"
                        id="id" placeholder="E -mail 주소" readonly>
                        <br><center><input type="button" onclick="openIdCheck()" value="E-mail 중복확인" class="btn btn-primary"></center>
                  </div>
                  <div class="form-group">
                     <input type="password" class="form-control" name="pwd"
                        id="pwd" placeholder="비밀번호" required>
                  </div>
                  <div class="form-group">
                     <input type="password" class="form-control" id="pwdcheck"
                     placeholder="비밀번호 재입력" required autofocus>
                  </div>
                  <div class="form-group">
                     <input type="text" class="form-control" name="name"
                        id="name" placeholder="이름" required>
                  </div>
                  <div class="form-group">
                     <input type="text" class="form-control" name="phone"
                        id="phone" placeholder="전화번호" required>
                  </div>
                  <div class="form-group">
                     <input type="text" class="form-control" name="quiz"
                        id="quiz" placeholder="비밀번호 찾기 질문" required>
                  </div>
                  <div class="form-group">
                     <input type="text" class="form-control" name="answer"
                        id="answer" placeholder="비밀번호 찾기 답" required>
                  </div>
                  <p class="text-center">
                     <button class="btn btn-primary" type="submit">
                        <i class="fa fa-sign-in"></i> 회원가입
                     </button>
                  </p>
               </form>

            </div>
         </div>
      </div>
   </div>

</div>

<!-- *** TOP BAR END *** -->
       <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap-hover-dropdown.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/front.js"></script>
   
<script src="resources/js/jquery-1.11.0.min.js"></script>
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
         document.memberJoin.pwd.focus();
         return false;
      }
      if (document.memberJoin.pwd.value != document.getElementById("pwdcheck").value) {
         alert("비밀번호를 동일하게 입력하세요."); 
         document.getElementById("pwdcheck").focus();
         return false;
      }
      if( !regExp.test(phone) ) {
          alert('전화 번호를 정확히 입력해주세요.');
          document.memberJoin.phone.focus();
          return false;
      }
   }
   function openIdCheck(){
      window.open('idCheckForm.do','idCheck','width=300,height=200');
   }

</script>