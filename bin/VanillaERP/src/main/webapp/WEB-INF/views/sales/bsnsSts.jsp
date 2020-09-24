<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/sales/bsnsSts.css" />
<meta charset="UTF-8">
<title>Vanilla ERP 영업현황</title>
<!-- 헤더 -->
<c:import url="/header"></c:import>
<script src="resources/script/highcharts/highcharts.js"></script>
<script src="resources/script/highcharts/modules/exporting.js"></script>
<script src="resources/script/highcharts/modules/data.js"></script>
<script type="text/javascript">
$(document).ready(function () {

 console.log("${param.search}");
	if("${param.paging}" != "") {
		$("#paging").val("${param.paging}");
	}

	if("${param.search}" != "") {
		$("#search").val("${param.search}");
	}
	
	if("${param.select}" != "") {
		$("#select").val("${param.select}");
	}
	
	$(".paging").on("click", "div", function () {
		$("#paging").val($(this).attr("name"));
		bsnsStslist();
	});// 페이지 버튼 클릭시 이동


	
	$("#searchBtn").on("click", function () {
		console.log("s")
		$("#paging").val("1");
		bsnsStslist();
	}); // 검색
	
	 $("[name='search']").on("keypress", function (event) {
		if(event.keyCode == 13) {
			$("#searchBtn").click();
			return false; // 브라우저가 가지고있는 기능을 취소한다.
		}
	});
	
	bsnsStslist();
	 


	 
	
	 
	 
	 /* chart */
		
		$(".bs tbody").on("click", "tr", function () {
			console.log("클릭됨");
			var params = $("#selectstsForm").serialize();
			
			$.ajax({
				type : "post", // 전송방식
				url : "chartAjax", // 주소
				dataType : "json", // 데이터형태
				data : params, // 보낼데이터
				success : function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다.
					if(res.result == "success") {
					 	var html = "";

						html+="<form action=\"#\" id=\"selectstsForm\" method=\"post\"> ";
						html+="<input type=\"hidden\" name=\"bsnsNo\" id=\"bsnsNo\" value=\"${data.BSNS_NO}\"/> ";
						html+="				<tr> ";
						html+="				<td> "+ res.chartAjax[i].CSTMR_CMPNY_NAME +"</td>";
						html+="				<td>"+ res.chartAjax[i].DATA +"</td>";
						html+="				<td>"+ res.chartAjax[i].DATA2 +"</td>";
						html+="				<td>"+ res.chartAjax[i].DATA3 +"</td>";
						html+="				<td>"+ res.chartAjax[i].DATA4 +"</td>";
						html+="				<td>"+ res.chartAjax[i].DATA5 +"</td>";
						html+="				<td>"+ res.chartAjax[i].DATA6 +"</td>";
						html+="				</tr>";
						html+="				</form>";
						$(".bs tbody").html(html);
						
						
					} else {
						alert("조회 중 문제가 발생하였습니다.");
					}
					
				},
				
				error : function (requset, status, error) { // 실행중 에러 발생 시
					console.log("text : " + request.responseText); // 반환텍스트
					console.log("error : " + error); // 에러 내용
				}
			});
			
	 
	 
	 
	 
	 

	
}); // 도큐먼트 끝


function makeChart() {
	
	console.log("차트 실행됨");
	
	$("#container").highcharts({
	    data: {
	        table: 'bs'
	    },
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '고객사 별 그래프'
	    },
	    colors: ['#5CB3FF', '#D462FF', '#FBB917', '#00B3A2', '#FB558A', 
            '#2870E3', '#FF8F00', '#B5BF07', '#3F9D00', '#CE3C92'],
	    yAxis: {
	        allowDecimals: false,
	        title: {
	            text: '개수'
	        }
	    },
	    tooltip: {
	        formatter: function () {
	            return '<b>' + this.series.name + '</b><br/>' +
	                this.point.y + ' ' + this.point.name.toLowerCase();
	        }
	    }
	    
	});

	
}







	
function bsnsStslist() { //리로드 리스트
		
		var params = $("#selectstsForm").serialize();
		
		$.ajax({
			type : "post", // 전송방식
			url : "bsnsStsAjax", // 주소
			dataType : "json", // 데이터형태
			data : params, // 보낼데이터
			success : function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다.
				if(res.result == "success") {
					bsnsStsredrawlist(res.bsnsStslist);
					bsnsStsredrawPagingcnt(res.pb);
				} else {
					alert("조회 중 문제가 발생하였습니다.");
				}
				
			},
			/* 에러 3줄 고정 */
			error : function (requset, status, error) { // 실행중 에러 발생 시
				console.log("text : " + request.responseText); // 반환텍스트
				console.log("error : " + error); // 에러 내용
			}
		});

	}

function bsnsStsredrawlist(bsnsStslist) {
	var html = "";

	if(bsnsStslist.length == 0) {
		html += "<tr>";
		html += "<td>조회 결과가 없습니다.</td>";
		html += "<td>조회 결과가 없습니다.</td>";
		html += "<td>조회 결과가 없습니다.</td>";
		html += "<td>조회 결과가 없습니다.</td>";
		html += "<td>조회 결과가 없습니다.</td>";
		html += "<td>조회 결과가 없습니다.</td>";
		html += "<td>조회 결과가 없습니다.</td>";
		html += "<td>조회 결과가 없습니다.</td>";
		html += "<td>조회 결과가 없습니다.</td>";
		html += "<tr>";

		$(".tbl tbody").html(html);
	} else {
		var html = "";
		
		for(var i = 0; i < bsnsStslist.length ; i++) {
			html += "<tr name=\"" + bsnsStslist[i].CSTMR_CMPNY_NO + "\">";
 			html +="<td>" + bsnsStslist[i].CSTMR_CMPNY_NAME + "</td>";
 			html +="<td>" + bsnsStslist[i].CHNC + "</td>";
 			html +="<td>" + bsnsStslist[i].SGSTN + "</td>";
 			html +="<td>" + bsnsStslist[i].NGTN + "</td>";
 			html +="<td>" + bsnsStslist[i].ORDERS + "</td>";
 			html +="<td>" + bsnsStslist[i].FAIL + "</td>";
 			html +="<td>" + bsnsStslist[i].TOT + "</td>";
 			
 			
			html += "</tr>";
			
		}
		
		$(".tbl1 tbody").html(html);
		makeChart();
	}
	
}	
function bsnsStsredrawPagingcnt(pb) {
	var html = "<div class=\"pagingD\"name=\"1\" id=\"first\"></div>&nbsp;";
	
	if($("#paging").val() == 1) {
		html += "<div class=\"pagingD\"name=\"1\" id=\"before\"></div>&nbsp;";
		
	} else {
		html += "<div class=\"pagingD\" name=\"" + ($("#paging").val() * 1 - 1) +  "\" id=\"before\"></div>&nbsp;";
		
	}
	
	for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
		if(i == $("#paging").val()) {
			html += "<div class=\"pagingD\" name=\"" + i + "\"><b>  " + i + " </b></div>&nbsp;";
		} else {
			html += "<div class=\"pagingD\" name=\"" + i + "\">  " + i + " </div>&nbsp;";
		}
		
	}
	if($("#paging").val() == pb.maxPcount) {
		html += "<div class=\"pagingD\" name=\"" + pb.maxPcount + "\" id=\"next\"></div>&nbsp;";	
	} else {
		html += "<div class=\"pagingD\" name=\"" + ($("#paging").val() * 1 + 1) + "\" id=\"next\"></div>&nbsp;";	
	}
	
	html += "<div class=\"pagingD\" name=\"" + pb.maxPcount + "\" id=\"last\"></div>&nbsp;";
		
	
	$(".paging").html(html);
}
	

	
	
		
 function chart() { //리로드 리스트
	
	var params = $("#selectstsForm").serialize();
	
	$.ajax({
		type : "post", // 전송방식
		url : "chartAjax", // 주소
		dataType : "json", // 데이터형태
		data : params, // 보낼데이터
		success : function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다.
			if(res.result == "success") {
				console.log(res.chart);
				redrawchart(res.chart);
			} else {
				alert("조회 중 문제가 발생하였습니다.");
			}
			
		},
		
		error : function (requset, status, error) { // 실행중 에러 발생 시
			console.log("text : " + request.responseText); // 반환텍스트
			console.log("error : " + error); // 에러 내용
		}
	});

}
	}); // html 그려줌
	

function redrawchart(chart) {
var html = "";

if(chart.length == 0) {
	html += "<tr>";
	html += "<td>조회 결과가 없습니다.</td>";
	html += "<tr>";

} else {
	var html = "";
	
	for(var i = 0; i < chart.length ; i++) {
		html += "<tr name=\"" + chart[i].CSTMR_CMPNY_NO + "\">";
			html +="<td>" + chart[i].CSTMR_CMPNY_NAME + "</td>";
			html +="<td>" + chart[i].CHNC + "</td>";
			html +="<td>" + chart[i].SGSTN + "</td>";
			html +="<td>" + chart[i].NGTN + "</td>";
			html +="<td>" + chart[i].ORDERS + "</td>";
			html +="<td>" + chart[i].FAIL + "</td>";
			html +="<td>" + chart[i].TOT + "</td>";
		html += "</tr>";
	}
	
}

}	
 

	 


</script>
</head>

<body>
<!-- 탑/레프트 -->
<c:import url="/topLeft">
<%-- 현재 페이지 해당 메뉴번호 지정 --%>
	<c:param name="menuNo" value="32"></c:param>
</c:import>
<!-- 구현내용 -->
<div class="title_wrap">
	<div class="title_table">
		<div class="title_txt">영업현황</div>
	</div>
</div>
<div class="contents_area">
	<!-- 내용은 여기에 구현하세요. -->
	
		<div class="all">
			<div class="cstmr_ing">		
				<div class="head1">고객사 진행현황 </div>
					<div class="tbl1" id="tbl1table">
			<form action="#" id="selectstsForm" method="post">
				<select class="select" id="select" name="select">
					<option value="0">고객사</option>
					<option value="1">담당자</option>

				</select> 
				<input type="text" class="search" id="search" name="search">
				<input type="button" class="searchBtn" id="searchBtn"> 
				<input type="hidden" name="paging" id="paging" value="1"/>
				<input type="hidden" name="bsnsStslist" id="bsnsStslist" value="1"/>
			</form>
				<table class="bs" id="bs">
				<colgroup>
				<col width="20%">
				<col width="20%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				</colgroup>
					<thead>
						<tr>
							<th>고객사</th>
							<th>기회</th>
							<th>제안</th>
							<th>협상</th>
							<th>수주</th>
							<th>실패</th>
							<th>진행총계</th>
							</tr>
					</thead>
					<tbody>
						<tr> 
						<td>akmobile</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
						<tr> 
						<td>Kakao</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
						<tr> 
						<td>naver</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
						<tr> 
						<td>nate</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
						<tr> 
						<td>google</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
						<tr> 
						<td>samsung</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
						<tr> 
						<td>apple</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
						<tr> 
						<td>고객사명</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
						<tr> 
						<td>고객사명</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
						<tr> 
						<td>고객사명</td>
						<td>60</td>
						<td>40</td>
						<td>30</td>
						<td>30</td>
						<td>30</td>
						<td>160</td>
						</tr>
					</tbody>
					</table>
		<div class="paging">
		<div class="pagingD" name="1" id="first"></div>
		<div class="pagingD" name="1" id="before"></div>
		<div class="pagingD" name="1"><b>1</b></div>
		<div class="pagingD" name="1">2</div>
		<div class="pagingD" name="1">3</div>
		<div class="pagingD" name="1">4</div>
		<div class="pagingD" name="1">5</div>
		<div class="pagingD" name="1" id="next"></div>
		<div class="pagingD" name="1" id="last"></div>
		</div>
	</div>
</div>
    <div id="container"></div>
</div>
</div>

  
<!-- 구현끝 -->
<!-- 바텀 -->
<c:import url="/bottom"></c:import>
</body>
</html>