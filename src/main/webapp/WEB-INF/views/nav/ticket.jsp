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
                        <li>공연예매</li>
                    </ul>
                    <div class="box">
			            <h1>공연예매</h1>
			            <br>
						<p class="lead">아래의 링크를 클릭하여 예매바랍니다.</p>
						<p class="text-muted">티켓 금액은 각 예매처의 할인정책에 따라 차이가 있을 수 있습니다.</p>
						<p class="text-muted">10인 이상의 단체관람 예매의 경우 02)719-0988로 문의 바랍니다.</p>
						<br>
						<br>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>예매처</th>
										<th><img src="img/beautiful2.jpg" width="170px;"></th>
										<th><img src="img/romance2.jpg" width="170px;"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>네이버</td>
										<td><a href="https://booking.naver.com/booking/12/bizes/162613?area=bni">예매하기</a></td>
										<td><a href="https://booking.naver.com/booking/12/bizes/167780?area=bni">예매하기</a></td>
									</tr>
									<tr>
										<td>인터파크 티켓</td>
										<td><a href="http://ticket.interpark.com/Ticket/Goods/GoodsInfo.asp?GoodsCode=18001569">예매하기</a></td>
										<td><a href="http://ticket.interpark.com/Ticket/Goods/GoodsInfo.asp?GoodsCode=18010295">예매하기</a></td>
									</tr>
									<tr>
										<td>YES24</td>
										<td><a href="http://ticket.yes24.com/Pages/Perf/Detail/Detail.aspx?IdPerf=29003&pid=cp03ud87l&cosemkid=nc15499536017009943&n_media=122875&n_query=%EC%97%B0%EA%B7%B9%EB%B7%B0%ED%8B%B0%ED%92%80%EB%9D%BC%EC%9D%B4%ED%94%84&n_rank=6&n_ad_group=grp-a001-01-000000009700891&n_ad=nad-a001-01-000000067625331&n_keyword_id=nkw-a001-01-000001797112701&n_keyword=%EC%97%B0%EA%B7%B9%EB%B7%B0%ED%8B%B0%ED%92%80%EB%9D%BC%EC%9D%B4%ED%94%84&n_campaign_type=1">예매하기</a></td>
										<td><a href="http://ticket.yes24.com/Pages/Perf/Detail/Detail.aspx?IdPerf=30524">예매하기</a></td>
									</tr>
									<tr>
										<td>타임티켓</td>
										<td><a href="https://timeticket.co.kr/?number=3471&utm_source=naver&utm_medium=cpc&utm_campaign=NSearchAD_PC_product&n_media=122875&n_query=%EC%97%B0%EA%B7%B9%EB%B7%B0%ED%8B%B0%ED%92%80%EB%9D%BC%EC%9D%B4%ED%94%84&n_rank=1&n_ad_group=grp-a001-01-000000001041846&n_ad=nad-a001-01-000000039492991&n_keyword_id=nkw-a001-01-000000174644449&n_keyword=%EC%97%B0%EA%B7%B9%EB%B7%B0%ED%8B%B0%ED%92%80%EB%9D%BC%EC%9D%B4%ED%94%84&n_campaign_type=1&NaPm=ct%3Dk18mehfs%7Cci%3D0H1Y003H0TfroPArtKXi%7Ctr%3Dsa%7Chk%3De93e79ebcd50350edc0971ee2f4d2973fd22cda2">예매하기</a></td>
										<td><a href="https://timeticket.co.kr/?number=3572&utm_source=naver&utm_medium=cpc&utm_campaign=NSearchAD_PC_product&n_media=27758&n_query=%EB%B0%9C%EC%B9%99%ED%95%9C%EB%A1%9C%EB%A7%A8%EC%8A%A4&n_rank=1&n_ad_group=grp-a001-01-000000006794422&n_ad=nad-a001-01-000000065216415&n_keyword_id=nkw-a001-01-000001263240567&n_keyword=%EB%B0%9C%EC%B9%99%ED%95%9C%EB%A1%9C%EB%A7%A8%EC%8A%A4&n_campaign_type=1&NaPm=ct%3Dk18n6vtc%7Cci%3D0z00000o2nfrI8hm4vnC%7Ctr%3Dsa%7Chk%3D1ffa939769044c55164b20ca4f25fc9925e77cfc">예매하기</a></td>
									</tr>
									<tr>
										<td>티켓수다</td>
										<td><a href="http://www.ticketsuda.com/?pn=product.view&pcode=S5568475&cuid=&sub_cuid=">예매하기</a></td>
										<td><a href="http://www.ticketsuda.com/?pn=product.view&pcode=S6180522&cuid=&sub_cuid=">예매하기</a></td>
									</tr>
									<tr>
										<td>쿠팡</td>
										<td><a href="https://trip.coupang.com/tp/products/100000013255?q=%EC%97%B0%EA%B7%B9%EB%B7%B0%ED%8B%B0%ED%92%80%EB%9D%BC%EC%9D%B4%ED%94%84&selectDate=&searchId=de91755106044cc2980c724e9492eba1&rank=1&listType=TSRP&linkCode=">예매하기</a></td>
										<td><a href="https://trip.coupang.com/tp/products/100000013223?q=%EB%B0%9C%EC%B9%99%ED%95%9C%EB%A1%9C%EB%A7%A8%EC%8A%A4&itemsCount=10&searchId=ef69b942da3340a09f2fcddd734f1c1d&rank=0">예매하기</a></td>
									</tr>
									<tr>
										<td>위메프</td>
										<td><a href="https://ticket.wemakeprice.com/product/3000000358?utm_source=naver&utm_medium=cpc&utm_campaign=r_sa&utm_term=cul%2D%EC%97%B0%EA%B7%B9%EB%B7%B0%ED%8B%B0%ED%92%80%EB%9D%BC%EC%9D%B4%ED%94%84&utm_content=culture">예매하기</a></td>
										<td><a href="https://ticket.wemakeprice.com/product/3000000186">예매하기</a></td>
									</tr>
									<tr>
										<td>11번가</td>
										<td><a href="http://search.11st.co.kr/Search.tmall?kwd=%25EC%2597%25B0%25EA%25B7%25B9%25EB%25B7%25B0%25ED%258B%25B0%25ED%2592%2580%25EB%259D%25BC%25EC%259D%25B4%25ED%2594%2584&code=1033&utm_term=%BF%AC%B1%D8%BA%E4%C6%BC%C7%AE%B6%F3%C0%CC%C7%C1&utm_campaign=0624_%B3%D7%C0%CC%B9%F6PC&utm_source=%B3%D7%C0%CC%B9%F6_PC_S&utm_medium=%B0%CB%BB%F6">예매하기</a></td>
										<td><a href="http://search.11st.co.kr/Search.tmall?kwd=%25EB%25B0%259C%25EC%25B9%2599%25ED%2595%259C%25EB%25A1%259C%25EB%25A7%25A8%25EC%258A%25A4&code=1033&utm_term=%B9%DF%C4%A2%C7%D1%B7%CE%B8%C7%BD%BA&utm_campaign=%C0%CE%BF%AC1&utm_source=%B3%D7%C0%CC%B9%F6_PC_S&utm_medium=%B0%CB%BB%F6">예매하기</a></td>
									</tr>
								</tbody>
							</table>
						</div>
                    </div>

                </div>
                <!-- /.col-md-9 -->

            </div>
            <!-- /.container -->
        </div>
   </div>
<style>
	th, td{
		text-align: center;
		font-size: 18px;
	}
</style>   
       
<%@include file="/WEB-INF/views/90_footer.jsp" %>