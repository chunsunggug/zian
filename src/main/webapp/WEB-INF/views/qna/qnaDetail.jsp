<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/00_header.jsp"%>
<%@include file="/WEB-INF/views/10_topbar.jsp"%>
<%@include file="/WEB-INF/views/20_navbar.jsp"%>
<body>
<div id="all">

	<div id="content">
		<div class="container">

			<div class="col-md-12">

				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li>문의사항</li>
				</ul>

			</div>

			<div class="col-md-12">
				<div class="box">
					<h1>문의 내용</h1>
					<p class="lead">Change your personal details or your password
						here.</p>
					<p class="text-muted">Pellentesque habitant morbi tristique
						senectus et netus et malesuada fames ac turpis egestas.</p>
					<form name="qnaDetail" action="qnaModify.do" method="post">
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group">
									<label for="password_1">제목</label>
									<input type="hidden" name="cidx" value="${qdto.cidx }">
									<input type="text" name="title" value="${qdto.title }" class="form-control" id="password_1" readonly="readonly">
								</div>
							</div>
							<div class="col-sm-2">
								<div class="form-group">
									<label for="password_2">작성자</label> 
									<input type="text" value="${qdto.writer }" readonly="readonly" class="form-control" id="password_2">
								</div>
							</div>
							<div class="col-sm-2">
								<div class="form-group">
									<label for="password_2">작성일</label> 
									<input type="text" value="${qdto.writedate }" class="form-control" readonly="readonly" id="password_2">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="password_old">문의사항</label>
									<textarea name="content" rows="10" cols="5" class="form-control" id="password_old" readonly="readonly">${qdto.content }</textarea>
								</div>
							</div>
							<c:if test="${sname eq qdto.writer }">
							<div class="col-sm-12 text-center">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-save"></i> 수정하기
								</button>
								<c:url var="contentUrl" value="qnaDel.do">
									<c:param name="cidx">${qdto.cidx }</c:param>
								</c:url>
								<button type="button" onclick="location.href='${contentUrl}'" class="btn btn-primary">
									<i class="fa fa-trash-o"></i> 삭제하기
								</button>
							</div>					
							</c:if>
						</div>
					</form>
					
					<br>
					<br>
					
					<c:if test="${sgrade eq 1||sname eq qdto.writer}">
					<form name="replyWrite" action="qnaReplyWrite.do">
					
						<div class="row">
							<div class="col-sm-10">
								<div class="form-group">
									<input type="hidden" name="cidx" value="${qdto.cidx }">
									<textarea name="reple" rows="2" cols="5" class="form-control" id="password_old"></textarea>
									<input type="hidden" name="writer" value="${sname }">
								</div>
							</div>
							<div class="col-sm-2 text-center">
								<button type="submit" class="btn btn-primary">답변하기</button>
							</div>
						</div>
					</form>	
					</c:if>
					
					<div class="table-responsive">
						<table class="table table-hover">
							<tbody>
								<c:if test="${empty rlist}">
									<tr>
										<td colspan="5">답변 준비중입니다.</td>
									</tr>
								</c:if>
								<c:forEach var="rdto" items="${rlist }">
									<tr>
										<td style="text-align: center;">${rdto.writer }</td>
										<td width="500">&nbsp;&nbsp;${rdto.reple }</td>
										<td style="text-align: center;">${rdto.writedate }</td>
										
								<c:if test="${sname eq rdto.writer }">			
									<c:url var="contentUrl" value="qnaReplyDel.do">
										<c:param name="writer">${rdto.writer }</c:param>
									</c:url>
									<td width="50"><button type="button" onclick="location.href='${contentUrl}'" class="btn btn-primary"><i class="fa fa-trash-o"></i></button></td>
								</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
						<div class="pages">
							<ul class="pagination">${pageStr }</ul>
						</div>
				</div>
			</div>
		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->
</div>


<%@include file="/WEB-INF/views/90_footer.jsp"%>
</body>