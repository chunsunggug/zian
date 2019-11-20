<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="index.jsp" data-animate-hover="bounce">
                    <img src="/JianProject/img/jianlogo.png" width="150" class="hidden-xs">
                    <img src="/JianProject/img/jianlogo.png" width="150" class="visible-xs"><span class="sr-only">Obaju - go to homepage</span>
                </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li>
                    	<a href="index.do" class="dropdown-toggle" data-hover="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;Home&nbsp;&nbsp;&nbsp;&nbsp; </a>
                    </li>
                    <li>
                        <a href="introduce.do" class="dropdown-toggle" data-hover="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;회사소개&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </li>   
                    <li class="dropdown yamm-fw">
                        <a href="beautiful.do" class="dropdown-toggle" data-hover="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;뷰티풀 라이프&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="romance.do" class="dropdown-toggle" data-hover="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;발칙한 로맨스&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </li>                    
					<li class="dropdown yamm-fw">
                        <a href="personList.do" class="dropdown-toggle" data-hover="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;배우소개&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </li>                     
                    <li class="dropdown yamm-fw">
                        <a href="bbsList.do" class="dropdown-toggle" data-hover="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;게시판&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="ticket.do" class="dropdown-toggle" data-hover="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;공연예매&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </li>                     
                    <li class="dropdown yamm-fw">
                        <a href="qnaList.do" class="dropdown-toggle" data-hover="dropdown">&nbsp;&nbsp;&nbsp;&nbsp;문의사항&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </li>                                      
                </ul>

            </div>

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->
    <div id="all">

        <div id="content">