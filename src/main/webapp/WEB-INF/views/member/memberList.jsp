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
                        <li><a href="#">Home</a></li>
                        <li>My Page</li>
                        <li>Member List</li>
                    </ul>

                </div>

                <div class="col-md-12" id="customer-orders">
                    <div class="box">
                        <h1>Member List</h1>
                        <hr>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
										<th>회원번호</th>
										<th>ID</th>
										<th>이름</th>
										<th>전화번호</th>
										<th>회원등급</th>
										<th>회원삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                              	<c:if test="${empty list }">
									<tr>	
										<td colspan="5">등록된 회원이 없습니다.</td>
									</tr>	
								</c:if>
								<c:forEach var="dto" items="${list }">  
                                    <tr>
										<td>${dto.idx }</td>
										<td>${dto.id }</td>
										<td>${dto.name }</td>
										<td>0${dto.phone }</td>
										<td>${dto.grade }</td>
										<c:url var="contentUrl" value="memberDel.do">
											<c:param name="idx">${dto.idx }</c:param>
										</c:url>
										<td><input type="button" value="회원삭제" onclick="location.href='${contentUrl}'" class="btn btn-primary btn-sm"></td>		
                                    </tr>
                                </c:forEach>   
                                </tbody>
                            </table>
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

<style>
	td, th{
		text-align: center;
	}
</style>

<%@include file="/WEB-INF/views/90_footer.jsp" %>