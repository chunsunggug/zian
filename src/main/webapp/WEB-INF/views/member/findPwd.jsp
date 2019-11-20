<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/00_header.jsp" %>
<%@include file="/WEB-INF/views/10_topbar.jsp" %>
<%@include file="/WEB-INF/views/20_navbar.jsp" %>
	<div>
      <div class="modal-dialog modal-sm">

         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="Login">비밀번호 찾기</h4>
            </div>
            <div class="modal-body">

               <form name="findQuiz" action="findQuiz.do" method="post">
                  <div class="form-group">
                  	 <c:if test="${empty id }">
                  	 	<input type="text" class="form-control" name="id" placeholder="E - mail">
                  	 </c:if>
                  	 <c:if test="${!empty id }">
                  	 	<input type="text" value="${id }"class="form-control" name="id" placeholder="E - mail">
                  	 </c:if>
                  	 <br>
                     <button type="submit" class="btn btn-primary">E-mail 확인</button>
                  </div>
               </form>
               
               <form action="findPwdSubmit.do" method="post">   
                  <div class="form-group">
					<input type="text" value="${quiz }" class="form-control" placeholder="비밀번호 질문">
                  </div>                  
                  <div class="form-group">
                     <input type="text" class="form-control" name="answer" id="answer" placeholder="비밀번호 질문 정답">
                  </div>
                  <p class="text-center">
                     <button class="btn btn-primary" type="submit">
                        <i class="fa fa-sign-in"></i> 비밀번호 찾기
                     </button>
                  </p>
               </form>
            </div>
         </div>
      </div>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
   </div>   
<%@include file="/WEB-INF/views/90_footer.jsp" %>