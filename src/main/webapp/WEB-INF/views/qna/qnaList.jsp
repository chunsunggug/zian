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

			<div class="col-md-12" id="customer-orders">
				<div class="box">
					<h1>문의사항</h1>
					<p class="lead">무엇이든 문의 바랍니다.</p>
					<c:if test="${empty sid}">	
					<p class="text-muted">
						문의사항 작성을 위해 회원가입 후 로그인이 필요합니다.
					</p>
					</c:if>
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
						 <c:if test="${!empty sname }">
                         <button type="button" class="btn btn-primary" onclick="location.href='qnaWriteform.do'">문의하기</button>
                         </c:if>
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