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
					<li>My Page</li>
					<li>나의 게시글</li>
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
                                <li class="active">
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

			<div class="col-md-9" id="customer-orders">
				<div class="box">
					<h1>나의 게시글</h1>
					<p class="lead">내가 작성한 글을 확인할 수 있습니다.</p>
					<p class="text-muted">
						게시글 작성을 원하시면 하단의 글쓰기 버튼을 눌러주세요.
					</p>

					<hr>

					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align: center;">No</th>
									<th style="text-align: center;">카테고리</th>
									<th style="text-align: center;">제목</th>
									<th style="text-align: center;">작성자</th>
									<th style="text-align: center;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
									<tr>
										<td colspan="5">등록된 게시글이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="dto" items="${list }">
									<td style="text-align: center;">${dto.cidx }</td>
									<c:url var="contentUrl" value="bbsDetail.do">
										<c:param name="cidx">${dto.cidx }</c:param>
									</c:url>
									<td style="text-align: center;">${dto.category }</td>
									<td width="500"><a href="${contentUrl }">${dto.title }</a></td>
									<td style="text-align: center;">${dto.writer }</td>
									<td style="text-align: center;">${dto.writedate }</td>
								</c:forEach>
							</tbody>
						</table>
					<div class="col-sm-12 text-center">
                         <button type="button" class="btn btn-primary" onclick="location.href='bbsWrite.do'">글쓰기</button>
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