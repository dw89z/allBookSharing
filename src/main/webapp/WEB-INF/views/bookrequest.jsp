<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="title" content="나의 도서관 > 희망도서 신청" />
<meta name="robots" content="noindex,nofollow" />
<meta name="author" content="skoinfo" />
<meta name="keywords" content="전주시립도서관, 자료검색, 독서문화행사, 이용안내, 책읽는전주, 나의도서관, 열린마당, 도서관소개" />
<meta name="description" content="전주시립도서관" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<!-- S:CSS 선언부 -->
<link rel="stylesheet" type="text/css" href="/rfc3/user/domain/lib.jeonju.go.kr.80/0/51.css" /><!-- #:대표도서관_base.css -->
<link rel="stylesheet" type="text/css" href="/rfc3/user/domain/lib.jeonju.go.kr.80/0/52.css" /><!-- #:대표도서관_layout.css -->
<link rel="stylesheet" type="text/css" href="/rfc3/user/domain/lib.jeonju.go.kr.80/0/64.css" /><!-- #:대표도서관_common.css -->
<link rel="stylesheet" type="text/css" href="/rfc3/user/domain/lib.jeonju.go.kr.80/0/65.css" /><!-- #:대표도서관_bbs.css -->
<link rel="stylesheet" type="text/css" href="/rfc3/user/domain/lib.jeonju.go.kr.80/0/94.css" /><!-- #:대표도서관_content.css -->
<link rel="stylesheet" href="/js/jquery-ui-1.12.1.custom/jquery-ui.min.css"><!-- #:jquery-ui.min.css -->
<!-- E:CSS 선언부 -->
<!-- S:Javascript 선언부 -->
<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script><!-- #:jquery-3.2.1.min.js -->
<script type="text/javascript" src="/js/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script><!-- #:jquery-ui.min.js -->

<script type="text/javascript" src="/js/jquery.bxslider.min.js"></script><!-- #:jquery.bxslider.min.js(슬라이드용) -->
<script type="text/javascript" src="/js/jquery.flexslider-min.js"></script><!-- #:jquery.flexslider.js(슬라이드용) -->
<script type="text/javascript" src="/js/common.js"></script><!-- #:common.js(반응형공통스크립트용) -->
<script type="text/javascript" src="/js/jquery.rss.js"></script><!-- #:rss.js(rss용) -->
<script type="text/javascript" src="/js/jquery.PrintArea.js"></script><!-- #:jquery.PrintArea.js(프린트용) -->
<!--<<script type="text/javascript" src="/js/prefixfree.min.js"></script>-->
<script type="text/javascript" src="/rfc3/user/domain/lib.jeonju.go.kr.80/0/81.js"></script>
</head>
<body>
 <%-- <jsp:include page="header.jsp" /> --%>

<h4>희망도서 신청 안내</h4>
<ul class="basic_ul">
	<li>신청일 포함 1주 3권 이내(권당 5만원 이하)</li>
	<li>신청대상 : 단행본(연속간행물, 비도서(전자책, 오디오북 등)은 신청 제외)</li>
	<li>희망도서 선정 : 도서관 운영위원회 심의를 거쳐 선정함</li>
 	<li>희망도서 비치 알림 : SMS 전송(안내 문자 수신을 위해 개인정보수정에서 SMS 수신 체크 확인)</li>
	<li>우선대출기간 : 신청도서관 도서 비치일로부터 주말까지 </li>
</ul>
<h4>희망도서 선정 제외기준</h4>
<div class="over_table">
	<table class="basic_table">
		<caption>
		희망도서 신청 제외기준 내용 및 종류 등 안내
		</caption>
		<thead>
			<tr>
				<th scope="col">기 준</th>
				<th scope="col">내  용</th>
				<th scope="col">비 고 </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>가격</td>
				<td>5만원 이상인 도서</td>
				<td class="txt_left">&nbsp;</td>
			</tr>
			<tr>
				<td rowspan="11">제외종류</td>
				<td>소장도서, 중복 신청도서, 신간 구입 예정도서</td>
				<td class="txt_left">&nbsp;</td>
			</tr>
			<tr>
				<td>문제집, 수험서, 참고서, 대학교재, 전문서적</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>서지사항이 불분명한 도서</td>
				<td>서명, 저자명, 출판사 등</td>
			</tr>
			<tr>
				<td>판타지,  로맨스, 무협지, 성인만화(학습만화 제외)</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>전집</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>미풍양속, 정서에 문제를 유발할 수 있는 유해도서</td>
				<td>음란서적, 폭력물 등</td>
			</tr>
			<tr>
				<td>영리 또는 정치 목적의 신청도서</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>간증 등 개인적 성향이 강한 종교 관련 도서</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>소장이 적합하지 않은 형태의 도서</td>
				<td>색칠, 스티커, 퍼즐, 컬러링북 등 교구가 많은 도서</td>
			</tr>
			<tr>
				<td>비슷한 주제를 여러 권 신청할 경우</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>정기간행물(잡지 등 연속간행물)</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>입수가능성</td>
				<td>품절 및 절판 도서, 미출간도서</td>
				<td>희망도서 선정시점에 시중에 판매되지 않은 자료</td>
			</tr>
			<tr>
				<td>최신성</td>
				<td>발행된 지 5년 이상인 도서</td>
				<td>컴퓨터, 과학, 신학문 분야는 출판된 지 2년 이상인 자료</td>
			</tr>
		</tbody>
	</table>
</div>
<p class="basic_p">※ 신청하신 자료는 자료선정위원회의 심의를 거쳐 구입, 정리 후 이용자에게 제공됩니다.</p>
<h4>희망도서 선정 확인</h4>
<ul class="basic_ul">
	<li>신청중 : 희망도서 담당자가 구입 타당성 검토 및 서지사항 확인 중인 상태</li>
	<li>처리중 : 희망도서를 구입에 반영하여 주문 중인 상태</li>
	<li>취소됨 : 구입에서 제외된 상태(취소 사유 확인 가능)</li>
	<li>소장중 : 희망도서를 자료실에 비치한 상태</li>
</ul>

<div class="btn_set"> <a href="http://localhost:8081/xxx/hopebookapply" class="book_btn01"><span>신청하기</span></a> <a href="/index.jeonju?menuCd=DOM_000000105002002000" class="book_btn02"><span>신청확인</span></a> </div>
</body>
</html>