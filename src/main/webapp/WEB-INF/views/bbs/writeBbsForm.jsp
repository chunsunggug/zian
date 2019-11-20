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
                        <li>게시판</li>
                    </ul>

                </div>

                <div class="col-md-12">
                    <div class="box">
                        <h1>게시판 글쓰기</h1>
                        <p class="lead">Change your personal details or your password here.</p>
                        <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                        <form name="bbsWrite" action="bbsWriteSubmit.do" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label for="password_1">제목</label>
                                        <input type="text" name="title" class="form-control" id="password_1">
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <label for="password_2">작성자</label>
                                        <input type="text" name="writer" class="form-control" id="password_2" value="${sname }" readonly="readonly">
                                        <input type="hidden" name="id" value="${sid }">
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <label for="password_2">카테고리</label>
                                        <c:if test="${sgrade eq 1 }">
                                        <select name="category" class="form-control">
											<option value="공지">공지</option>
											<option value="이벤트">이벤트</option>
											<option value="일상">일상</option>
										</select>
                                        </c:if>
										<c:if test="${sgrade ne 1 }">
										<select name="category" class="form-control">
											<option value="일상">일상</option>
										</select>
										</c:if>
                                    </div>
                                </div>                                
                            </div>
                            <div class="row">
                            	<div class="col-sm-12">
                            		<ul id="file">
                            	 	<li>메인 이미지<input type="file" name="mainimg" id="file1"></li>
									<li>서브 이미지1<input type="file" name="subimg1" id="file2"></li>
									<li>서브 이미지2<input type="file" name="subimg2" id="file3"></li>
									<li>서브 이미지3<input type="file" name="subimg3" id="file4"></li>
									</ul>
                            	</div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" id="img-group">
                                	<div class="col-sm-12">
                                		<img src="" id="mainimg" width="70%">
                                	</div>
                                	<br>
                                	<div class="col-sm-12">
                                		<img src="" id="subimg1" width="70%">
                                	</div>
                                	<br>
                                	<div class="col-sm-12">
                                		<img src="" id="subimg2" width="70%">
                                	</div>
                                	<br>
                                	<div class="col-sm-12">
                                		<img src="" id="subimg3" width="70%">
                                	</div>
                                </div>
                                <div class="col-md-12">
          	                        <div class="form-group">
            	                        <label for="password_old">내용</label>
                	                    <textarea name="content" rows="10" cols="5" name="content" class="form-control" id="password_old"></textarea>
                    	            </div>                                
                                </div>
                             	<div class="col-sm-12 text-center">
                                	<button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 등록</button>
                          		</div>
                            </div>
                            <!-- /.row -->
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
 	#file li{
	display: inline-block;
	width: 250px;
	}
	 
</style>
<script>
	//이미지 미리보기 스크립트
	document.getElementById("file1").onchange = function() {
		var reader = new FileReader();

		reader.onload = function(e) {
			document.getElementById("mainimg").src = e.target.result;
		};
		reader.readAsDataURL(this.files[0]);
	};
	document.getElementById("file2").onchange = function() {
		var reader = new FileReader();

		reader.onload = function(e) {
			document.getElementById("subimg1").src = e.target.result;
		};
		reader.readAsDataURL(this.files[0]);
	};
	document.getElementById("file3").onchange = function() {
		var reader = new FileReader();

		reader.onload = function(e) {
			document.getElementById("subimg2").src = e.target.result;
		};
		reader.readAsDataURL(this.files[0]);
	};
	document.getElementById("file4").onchange = function() {
		var reader = new FileReader();

		reader.onload = function(e) {
			document.getElementById("subimg3").src = e.target.result;
		};
		reader.readAsDataURL(this.files[0]);
	};	
</script>
<%@include file="/WEB-INF/views/90_footer.jsp" %>