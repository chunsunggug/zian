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
                        <li><a href="index.do">Home</a>
                        </li>
                        <li>배우 소개</li>
                    </ul>
                </div>
                <div class="col-md-12" id="wishlist">
                    <div class="box">
                        <center><h1>뷰티풀 라이프</h1></center>
                    </div>
					<div class="box">
						<img src="img/kcs.PNG" width="100%">
						<br>
						<img src="img/pso.PNG" width="100%">
					</div>
					
                    <div class="box">
                        <center><h1>발칙한 로맨스</h1></center>
                    </div>
					<div class="box">
						<img src="img/gbp.PNG" width="100%">
						<br>
						<img src="img/gsj.PNG" width="100%">
						<br>
						<img src="img/kps.PNG" width="100%">
						<br>
						<img src="img/hbj.PNG" width="100%">
					</div>					
                </div>
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
    </div>
    <!-- /#all -->

<%@include file="/WEB-INF/views/90_footer.jsp" %>
