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

			<div class="col-md-12">
				<div class="box">
					<h1>문의 내용</h1>
					<p class="lead">Change your personal details or your password
						here.</p>
					<p class="text-muted">Pellentesque habitant morbi tristique
						senectus et netus et malesuada fames ac turpis egestas.</p>
					<form name="qnaDetail" action="qnaModifySubmit.do" method="post">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="password_1">제목</label> <input type="hidden"
										name="cidx" value="${dto.cidx }"> <input type="text"
										name="title" value="${dto.title }" class="form-control"
										id="password_1">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="password_old">문의사항</label>
									<textarea name="content" rows="10" cols="5" class="form-control" id="password_old">${dto.content }</textarea>
								</div>
							</div>
							<div class="col-sm-12 text-center">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-save"></i> 수정
								</button>
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
<%@include file="/WEB-INF/views/90_footer.jsp"%>