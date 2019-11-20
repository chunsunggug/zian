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
                        <li>회사소개</li>
                    </ul>

                    <div class="box">
                        <img id="introduce" src="img/jian.PNG" width="60%">
                        <div id="introbox">
                        <p>주식회사 지안컴퍼니는 연극 '뷰티풀라이프'라는 창작 작품으로 시작했다.</p>
                        <p>2016년 10월부터 시작해 많은 사랑을 받아 오픈런으로 확정되어 현재까지 공연 중이며, 지금까지</p>
                        <p>대학로내에 작품을 인정받아 인터파크 타임티켓 위메프 등 많은 예매처에서 실적을 내고 있다.</p>
                        <p>그리고 이번 2018년 4월 김민교 배우의 작/연출인 ‘발칙한로맨스’를 새롭게 선보였다.</p>
                        <p>이번 공연 또한 '뷰티풀라이프'와는 다른 매력으로 유쾌함과 즐거움을 주며</p>
                        <p>많은 사람들에게 사랑을 받고 오픈런으로 확정되었다.</p>
                        <p>주식회사 집컴퍼니는 2016년에 설립되어 아직은 2년도 안 된 집단이지만 두 작품 다</p>
                        <p>오픈런으로 성공 시킨 만큼 책임감을 가지고 노력하는 팀원으로 이루어져있다.</p>
                        <p>발로 뛰며 홍보하고, 관객들의 반응을 보며 좀 더 성장할 수 있도록</p>
                        <p>쉬지 않고 노력하고 있는 공연기획사다.</p>
                        <br>
                    	</div>
                    	<div id="introbox">
                    		<img id="introduce" src="img/jtn.jpg" width="80%">
                    		<br>
                    		<p>현재 뷰티풀 라이프와 발칙한 로맨스는 대학로 JTN아트홀에서 OPEN RUN 중이다.</p>
                    		<p>JTN아트홀은 대학로에서 최고의 시설을 자랑하는 멀티플렉스이며</p>
                    		<p>관객들이 쾌적한 환경에서 공연을 관람할 수 있는 최적의 장소이다.</p>
                    		<br>
                    	</div>
                    	<div id="introbox">
                    		<img id="introduce" src="img/cozy.png" width="80%">
                    		<br>
                    		<p>뷰티풀라이프와 발칙한로맨스는 각각 2관과 4관에서 관람할 수 있으며</p>
                    		<p>각 공연관 마다 200석 이상의 팔걸이가 있는 쾌적하고 안락한 좌석이 배치되어 있다.</p>
                    		<br>
                    	</div>
                    </div>

                </div>
                <!-- /.col-md-9 -->

            </div>
            <!-- /.container -->
        </div>
   </div>
<style>
	#introduce{
    display:block;
    margin-left:auto;
    margin-right:auto;	
	}
	#introbox{
	font-size: 20px;
	width: 80%;
    display:block;
    margin-left:auto;
    margin-right:auto;	
	}
</style>       
<%@include file="/WEB-INF/views/90_footer.jsp" %>