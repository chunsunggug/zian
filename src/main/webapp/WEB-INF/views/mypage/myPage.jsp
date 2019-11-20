<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/00_header.jsp" %>
<%@include file="/WEB-INF/views/10_topbar.jsp" %>
<%@include file="/WEB-INF/views/20_navbar.jsp" %>
	
	<div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>My Page</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Mypage section</h3>
                        </div>

                        <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked">
                                <li class="active">
                                    <a href="mypage.do"><i class="fa fa-user"></i>개인정보</a>
                                </li>
                                <li>
                               		<c:url var="contentUrl" value="myBbsList.do">
										<c:param name="id">${sid }</c:param>
									</c:url> 	
                                    <a href="${contentUrl }"><i class="fa fa-clipboard"></i>나의 게시글</a>
                                </li>
                                <li>
                                	<c:url var="contentUrl" value="myQnaList.do">
										<c:param name="id">${sid }</c:param>
									</c:url>
                                    <a href="${contentUrl }"><i class="fa fa-question"></i>나의 문의사항</a>
                                </li>
                                <li>
                                    <a href="logout.do"><i class="fa fa-sign-out"></i>Logout</a>
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>
                
                <div class="col-md-9">
                    <div class="box">
                        <h1>개인정보</h1>
                        <form>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="password_old">이름</label>
                                        <input type="text" value="${sname }" class="form-control" id="password_old" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="password_2">E - mail(ID)</label>
                                        <input type="text" value="${sid }" class="form-control" id="password_2" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="firstname">휴대폰 번호</label>
                                        <input type="text" value="0${sphone }" class="form-control" id="firstname" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="firstname">비밀번호 질문</label>
                                        <input type="text" value="${squiz }" class="form-control" id="firstname" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="firstname">비밀번호 질문 답</label>
                                        <input type="text" value="${sanswer }" class="form-control" id="firstname" readonly>
                                    </div>
                                </div>
                                <br>
                                <div class="col-sm-12 text-center">
	                               <button type="button" onclick="location.href='modifyForm.do'" class="btn btn-primary"><i class="fa fa-exchange"></i> 개인정보 수정하기</button>
	 							</div>    
                            </div>
                                                        
                        </form>
                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
	</div>
	
	
	
<%@include file="/WEB-INF/views/90_footer.jsp" %>