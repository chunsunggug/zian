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
					<li>게시판</li>
				</ul>

			</div>

			<div class="col-md-12">
				<div class="box">
					<form name="bbsWrite" action="bbsModify.do" method="post">
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group">
									<input type="hidden" name="cidx" value="${bdto.cidx }">
									<input type="hidden" name="id" value="${bdto.id }">
									<label for="password_1">제목</label>
									<input type="text" name="title" value="${bdto.title }" readonly="readonly" class="form-control" id="password_1">
								</div>
							</div>
							<div class="col-sm-2">
								<div class="form-group">
									<label for="password_2">작성자</label>
									<input type="text" name="writer" value="${bdto.writer }"
									       class="form-control" id="password_2" readonly="readonly">
								</div>
							</div>
							<div class="col-sm-2">
								<div class="form-group">
									<label for="password_2">카테고리</label>
									<select name="category" class="form-control" onselect="">
										<option value="${bdto.category }" selected="selected">${bdto.category }</option>
										<option value="공지">공지</option>
										<option value="이벤트">이벤트</option>
										<option value="일상">일상</option>
									</select>
								</div>
							</div>
						</div>
						<br>
						<br>
						<div>
							<input type="hidden" name="mainimg" value="${bdto.mainimg }">
							<input type="hidden" name="subimg1" value="${bdto.subimg1 }">
							<input type="hidden" name="subimg2" value="${bdto.subimg1 }">
							<input type="hidden" name="subimg3" value="${bdto.subimg1 }">
							
							     <div class="col-md-12" id="img-group">
							     	<c:if test="${bdto.mainimg ne 'null'}">
							     		<div class="col-sm-12">
                                			<img src="upload/${bdto.mainimg }" width="70%">
                               			</div>
							     	</c:if>
                                	<br>
                                	<c:if test="${bdto.subimg1 ne 'null'}">
                               	 		<div class="col-sm-12">
                                			<img src="upload/${bdto.subimg1 }" width="70%">
                               		 	</div>                                	
                                	</c:if>
                                	<br>
                                	<c:if test="${bdto.subimg2 ne 'null'}">
                                		<div class="col-sm-12">
                                			<img src="upload/${bdto.subimg2 }" width="70%">
                             		  	</div>                                	
                                	</c:if>
                                	<br>
                                	<c:if test="${bdto.subimg3 ne 'null'}">
                                		<div class="col-sm-12">
                                			<img src="upload/${bdto.subimg3 }" width="70%">
                             		  	</div>                                	
                                	</c:if>
                                	
                                	<input type="hidden" name="content" value="${bdto.content }">
									<p style="font-size: 18px;">${bdto.content }</p>
                                </div>

						</div>
						<div class="row">
							<c:if test="${sname eq bdto.writer or sgrade==1}">
							<div class="col-sm-12 text-center">
								<button type="submit" class="btn btn-primary">수정하기</button>
								&nbsp;&nbsp;
								<c:url var="contentUrl2" value="bbsDel.do">
									<c:param name="mainimg">${bdto.mainimg }</c:param>
                      	    	    <c:param name="subimg1">${bdto.subimg1 }</c:param>
                        		    <c:param name="subimg2">${bdto.subimg2 }</c:param>
                           			<c:param name="subimg3">${bdto.subimg3 }</c:param>
									<c:param name="cidx">${bdto.cidx }</c:param>
								</c:url>
								<button type="button" onclick="location.href='${contentUrl2}'"
									class="btn btn-primary">삭제하기</button>
							</div>							
							</c:if>
						</div>
					</form>
					<br>
					<br>
					<form name="replyWrite" action="bbsReplyWrite.do">
						<div class="row">
							
							<c:if test="${empty sname }">
							<div class="col-sm-10">
								<div class="form-group">
									<textarea name="reple" rows="1" cols="5" class="form-control" id="password_old">댓글 등록을 위해서 로그인을 해주세요!</textarea>
								</div>
							</div>						
							</c:if>
							<c:if test="${!empty sname }">
							<div class="col-sm-10">
								<div class="form-group">
									<input type="hidden" name="bcdix" value="${bdto.cidx }">
									<textarea name="reple" rows="1" cols="5" class="form-control" id="password_old"></textarea>
									<input type="hidden" name="writer" value="${sname }">
								</div>
							</div>
							<div class="col-sm-2 text-center">
								<button type="submit" class="btn btn-primary">댓글달기</button>
							</div>							
							</c:if>

						</div>						
						
					<div class="table-responsive">
						<table class="table table-hover">
							<tbody>
								<c:if test="${empty rlist}">
									<tr>
										<td colspan="5">등록된 댓글이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="rdto" items="${rlist }">
									<tr>
										<td style="text-align: center;">${rdto.writer }</td>
										<td width="500">&nbsp;&nbsp;${rdto.reple }</td>
										<td style="text-align: center;">${rdto.writedate }</td>
										
								<c:if test="${sname eq rdto.writer }">			
									<c:url var="contentUrl" value="bbsReplyDel.do">
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
					</form>
				</div>
			</div>

		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->
</div>

<style>
	#img-group{
		display: inline-block;
		text-align: center;
	}
</style>

<%@include file="/WEB-INF/views/90_footer.jsp"%>