<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
	#detailinfo{

		background-color:#f1f1f1;
		height:300px;
		flex:3;
	
		margin-right:5%;
		
	}
	#img{
	flex:1;
	border:1px solid #fde978;
	height:300px;
	margin-right:5%
	}
	td{
	border-bottom: 1px solid #2f2f2f;
	}
	.dd{
	font-weight:700;
	}
	body{
		padding-left:10%;
		padding-right:10%;
	}
	.tt{
	text-align:right;
	font-size:small;
	color:#383838;
	}
	#sidebar{
	flex:1;
	float:left;
	border:2px solid #f1f1f1;
	height:300px;
	}
	#intro{

	width:77%;
	display:block;
	margin-top:5%;
	height:
	}
	#have{
	border:1px solid #4a8af4;
	width:60%;
	}
	#review{
	
	width:77%;
	}
	#container{
	display:flex;
	}
	#state{
	color:red;
	
	}
	#reviewlist{
	
	
	width:100%;
	}
</style>
<body>
<h1>상세보기</h1>
<div id="container">
<img src="${books.bk_image}" id="img">

	<table id="detailinfo">
		<tr><td class="tt">자료유형</td><td class="dd">${books.bk_bg_cate}/${books.bk_sg_cate}</td></tr>
		<tr><td class="tt" >책제목</td><td style="color:#2870bf;font-size:large;font-weight:800;"> ${books.bk_name}</td></tr>
		<tr><td class="tt">저자</td><td class="dd">${books.bk_writer }</td><td>
		<tr><td class="tt">발행사항</td><td class="dd">${books.bk_publisher },${books.bk_publicday }</td></tr>
		<tr><td class="tt">ISBN코드</td><td class="dd">${books.bk_code }</td></tr>
		<tr><td class="tt">소장정보</td><td class="dd" id="dd">${books.bk_lname } &nbsp;&nbsp;&nbsp;<span id="state"></span>
		<button style="float:right;margin-right:20px;" id="reserbtn">예약</button></td></tr>
		
	</table>

<div id="sidebar">
0명이 좋아합니다.<br>
평균평점 _____
</div>
</div>
<div id="intro"><h2>서평</h2>
  ${books.bk_introduction }</div>



 
 <div id="review">
 <h2>한줄평</h2>
	<table id="reviewlist">
	<tr>
	<th>아이디</th>
	<th>한줄평</th>
	<th>평점</th>
	</tr>
	<c:forEach var="review" items="${review}">
	 <tr>
	 	<td>${review.rv_id}</td>
	 	<td>${review.rv_contents}</td>
	 	<td>${review.rv_grade}</td>
	 </tr>
	 </c:forEach>
	</table>
 </div>
 
</body>
<script>
 //console.log("책정보",${books});
 console.log("책정보1",${books.bk_Quantity});
 console.log("책정보2",${books.bk_booklend});
 
if(${books.bk_Quantity}>${books.bk_booklend}) 
	$("#state").text("대출가능");
else
	$("#state").text("대출불가");


$("#reserbtn").on("click",function(){
	if($("#state").text()=="대출가능"){
		alert("예약 불가능 합니다.")
	} else if($("#state").text()=="대출불가"){
			var result1=confirm("예약하시겠습니까?");
		
			if(result1){
				$.ajax({
					type:'get',
			    	url:'reservation',
			    	data:{"rv_code":"${books.bk_code}","rv_lcode":${books.bk_lcode}},
			    	success:function(result){
			    		console.log("result="+result);
			    		console.log("test");
			    		alert("예약되었습니다.");
			    		//$("#reserbtn").replaceWith("<button onclick='reservCencel()' style='float:right;margin-right:20px;' id='reserccbtn'>예약취소</button>")
			    	},
			    	error:function(xhr,status){ 
				    	console.log("xhr=", xhr);
						console.log("status=", status);
				 }
				});//ajax End
			
			}else{
				alert("취소");
			}
	}
	
});
	
	window.onload = function () {
		
		
		$.ajax({
			type:'get',
	    	url:'reservationconfirm',
	    	data:{"rv_code":"${books.bk_code}","rv_lcode":${books.bk_lcode}},
	    	success:function(result){
	    		if(result=="성공"){
	    			$("#dd").append("<button style='float:right;margin-right:20px;' id='reserbtn'>예약</button>")
	    		}else if(reseult=="실패"){
	    			$("#dd").append("<button style='float:right;margin-right:20px;' id='reserbtn'>예약취소</button>")
	    		}
	    	},
	    	error:function(xhr,status){ 
		    	console.log("xhr=", xhr);
				console.log("status=", status);
		 }
		});//ajax End
	}




	 
 
	 
	 
 
</script>
</html>