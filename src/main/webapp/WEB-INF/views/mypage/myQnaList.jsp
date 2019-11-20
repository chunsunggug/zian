<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/00_header.jsp"%>
<%@include file="/WEB-INF/views/10_topbar.jsp"%>
<%@include file="/WEB-INF/views/20_navbar.jsp"%>

<div id="all">

	<div id="content">
		<div class="container">

			<div class="col-md-12">

				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li>문의사항</li>
				</ul>

			</div>
			
			<div class="col-md-3">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">MyPage section</h3>
                        </div>

                        <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="mypage.do"><i class="fa fa-user"></i>개인정보</a>
                                </li>
                                <li>
                               		<c:url var="contentUrl" value="myBbsList.do">
										<c:param name="id">${sid }</c:param>
									</c:url> 	
                                    <a href="${contentUrl }"><i class="fa fa-clipboard"></i>나의 게시글</a>
                                </li>
                                <li class="active">
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

			<div class="col-md-9" id="customer-orders">
				<div class="box">
					<h1>나의 문의사항</h1>
					<p class="lead">나의 문의 사항을 확인 할 수 있습니다..</p>
					<p class="text-muted">
						문의사항을 남기고 싶다면 하단의 문의하기 버튼을 눌러주세요.
					</p>

					<hr>

					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align: center;">no</th>
									<th style="text-align: center;" width="500">제목</th>
									<th style="text-align: center;">작성자</th>
									<th style="text-align: center;">작성일</th>
									<th style="text-align: center;">상태<th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
									<tr>
										<td colspan="4">등록된 문의사항이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="dto" items="${list }">
									<tr>
										<td style="text-align: center;">${dto.cidx}</td>
										<c:url var="contentUrl" value="qnaDetail.do">
											<c:param name="cidx">${dto.cidx }</c:param>
										</c:url>
										<td><a href="${contentUrl }">&nbsp;&nbsp;${dto.title}</a></td>
										<td style="text-align: center;">${dto.writer}</td>
										<td style="text-align: center;">${dto.writedate}</td>
										<c:if test="${dto.status eq 0 }">
											<td style="text-align: center;">답변 준비중</td>
										</c:if>
										<c:if test="${dto.status eq 1 }">
											<td style="text-align: center;">답변 완료</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					<div class="col-sm-12 text-center">
                         <button type="button" class="btn btn-primary" onclick="location.href='qnaWriteform.do'">문의하기</button>
                    </div>
					<div class="pages">
                        <ul class="pagination">
							${pageStr }
                        </ul>
                    </div>
					</div>
				</div>
			</div>

		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->
</div>
<!-- /#all -->


<%@include file="/WEB-INF/views/90_footer.jsp"%>	