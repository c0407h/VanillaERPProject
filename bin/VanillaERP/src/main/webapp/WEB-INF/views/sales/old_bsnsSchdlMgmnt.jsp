<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vanilla ERP 영업일정</title>
<link rel="stylesheet" type="text/css" href="resources/css/sales/bsnsSchdlMgmnt.css" />
<link rel="stylesheet" type="text/css" href="resources/css/fullcalendar/main.css" />
<link rel="stylesheet" type="text/css" href="resources/css/sales/datetimepicker.css" />
<!-- 헤더 -->
<c:import url="/header"></c:import>
<script src= "resources/script/fullcalendar/main.js"></script>
<script src="resources/script/fullcalendar/locales-all.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script>
<script src="resources/script/datetimepicker/datetimepicker.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
    var now = new Date();
	var now2 = now.getFullYear() + "-";
	if(now.getMonth()+1 < 10) {
		now2 += "0" + (now.getMonth()+1); 
	} else {
		now2 += now.getMonth()+1; 
	}
	now2 += "-" + now.getDate();
	
	
	  $(".cal_sel_date").html(now2);
	
	reloadList(); //일정리로드
	
	
	
	if("${param.page}" != "") {
		$("#page").val("${param.page}");
	}

	if("${param.searchcc}" != "") {
		$("#searchcc").val("${param.searchcc}");
	}

	$(".paging_area").on("click", "div", function () {
		$("#page").val($(this).attr("name"));

	});
	
	
	$("#searchBtn").on("click", function () {
		$("#page").val("1");
		reloadcc();
	}); //고객사 리로드

	if("${param.page}" != "") {
		$("#page1").val("${param.page}");
	}

	if("${param.searchc}" != "") {
		$("#searchc").val("${param.searchc}");
	}

	$(".paging_area").on("click", "div", function () {
		$("#page1").val($(this).attr("name"));

	});
	
	$("#searchBtn").on("click", function () {
		$("#page1").val("1");
		reloadc();
	}); //고객 리로드
	
	
	$(".paging_area").on("click", "div", function () {
		$("#page3").val($(this).attr("name"));
		reloadList();
	}); // 일정
	
		
	var d = new Date();
	var calendarEl = document.getElementById('cal1');
	   var calendar = new FullCalendar.Calendar(calendarEl, {
		   

	   	customButtons: {
			prev: {
				text: 'Prev',
				click: function() {
					// 이전이벤트
					calendar.prev();
				
				}
			},
			next: {
				text: 'Next',
				click: function() {
					// 다음이벤트
					calendar.next();
					
				}
			}
	   	},
			
	   	headerToolbar: {
	   		left: 'prev',
	           center: 'title',
	           right: 'next'
		},
		
	      dateClick: function info(info) {
	        var params = $("#insertForm").serialize();
			var html4 = "";
			
				html4 +="<th colspan=\"2\" class=\"cal_sel_date\" name=\"cal_sel_date\">" + info.dateStr + "</th>"	 
				
				$(".cal_list_table thead th").eq(0).html(html4);
				
	    }, // date 클릭시 날짜 가져옴
		
		defaultDate: d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(),
		locale: "ko",
		editable: false,
		height: 700,
		width: "100%"

    });
	    
	calendar.render(); 
	
	$(".add_btn").on("click", function() {
		
		var html = "";
		
		html +="<form action=\"#\" id=\"insertForm\" method=\"post\">";
		html +="<input type=\"hidden\"  id=\"sEmplyNo\" name=\"sEmplyNo\" value='${sEmplyNo}' />";
		html +="<input type=\"hidden\"  id=\"cstmr_no\" name=\"cstmr_no\" />";
		html +="<input type=\"hidden\" id=\"cstmr_cmpny_no\" name=\"cstmr_cmpny_no\" />";
		html +="<input type=\"hidden\" id=\"rgstrn_date\" name=\"rgstrn_date\" />";
		html +="<input type=\"hidden\" id=\"dlt_type\" name=\"dlt_type\" />";
		html +="<input type=\"hidden\" id=\"cal_sel_date\" name=\"cal_sel_date\" />";
		
		html +="<table class=\"schedule_pop\">";
		html +="	<thead> ";
		html +="		</thead> ";
		html +="	<tbody> ";
		html +="		<tr> ";
		html +="		<th>일정명</th> ";
		html +="		<td> ";
		html +="		<input type=\"text\" name=\"SCHDL_NAME\" id=\"schdl_name\" placeholder=\"일정명을 입력해주세요\" maxlength=\"20\"/> ";
		html +="		</td>";
		html +="		</tr>";
		html +="		<tr>";
		html +="			<th>고객사</th>";
		html +="		<td> <input type=\"text\" disabled=\"disabled\"  name=\"cstmr_cmpny_name\" id=\"cstmr_cmpny_name\"/></td>";
		html +="		<td> <input type=\"button\" class=\"searchBtn\" id=\"cstmr_cmpny_name_search\"></td> ";
		html +="		</tr>";
		html +="		<tr>";
		html +="			<th>고객</th>";
		html +="		<td> <input type=\"text\" disabled=\"disabled\" placeholder=\"고객사 검색후 이용해주세요\" name=\"cstmr_name\" id=\"cstmr_name\"/>	</td>";
		html +="		<td> <input type=\"button\" class=\"searchBtn\" id=\"cstmr_name_search\"></td> ";
		html +="			</tr>";
		html +="	</tr>";
		html +="	<tr>";
		html +="		<th>활동분류</th>";
		html +="		<td>";
		html +="		<select name=\"actvt_dvsn_no\">";
		html +="		<option value=\"0\">전화</option>";
		html +="		<option value=\"1\">메일</option>";
		html +="		<option value=\"2\">방문</option>";
		html +="		<option value=\"3\">기타</option>";
		html +="		</select> ";
		html +="	</tr>";
		html +="	<tr>";
		html +="		<th>장소</th>";
		html +="		<td>";
		html +="		<input type=\"text\" name=\"place\" id=\"place\" placeholder=\"장소명을 입력해주세요\" maxlength=\"50\"/>";
		html +="		</td>";
		html +="	</tr>";
		html +="	<tr>";
		html +="		<th>중요도</th>";
		html +="		<td>";
		html +="		<select name=\"RPT_STNDR\">";
		html +="		<option value=\"0\">예</option>";
		html +="		<option value=\"1\">아니요</option>";
		html +="		</td>";
		html +="	</tr>";
		html +="	<tr>";
		html +="		<th>약속날짜</th>";
		html +="		<td>";
		html +="		<input class=\"date\" type=\"date\" name=\"start_date\"/>";
		html +="		<input class=\"time\" type=\"time\" name=\"start_time\"/>";
		html +="		<input class=\"date\" type=\"date\" name=\"end_date\"/>";
		html +="		<input class=\"time\" type=\"time\" name=\"end_time\"/>";
		html +="		</td>";
		html +="	<tr class=\"context\">";
		html +="		<th>내용</th>";
		html +="		 <td> <textarea name=\"CNTNT\"></textarea>";
		html +="		</td>";
		html +="	</tr>";
		html +=" </tbody>";
		html +=" </table>";
		html +=" </form>";
	
		makeTwoBtnPopup(1, "일정등록", html, true, 800,700, function () {
			
			 $("#cstmr_cmpny_name_search").on("click", function () {
				 
				 var html2 = "";
				 
				 	html2 +=	"<form action=\"cstmrForm\" id=\"cstmr_cmpnyForm\" method=\"post\">";
					html2 += 		"<input type=\"text\"class=\"search\" name=\"searchcc\" />";
					html2 += 		"<input type=\"button\" class=\"searchBtn2\"  />";
					

					html2 += " <table class=\"cc\">";
				 	html2 += "	<colgroup>";
				 	html2 += "		<col width=\"20%\" />";
					html2 += "		<col width=\"30%\" />";
				 	html2 += "		<col width=\"20%\" />";
				 	html2 += "		<col width=\"20%\" />";
				 	html2 += "		<col width=\"20%\" />";
				 	html2  +="	</colgroup>";
					html2 += "	<thead> ";
					html2 += "<tr>";
					html2 += 	"<th> 고객사번호 </th>";
					html2 += 	"<th> 고객사 </th>";
					html2 += 	"<th> 사업자등록번호 </th>";
					html2 += 	"<th> 대표자 </th>";
					html2 += 	"<th> 등급 </th>";
					html2 += "</tr>";
					html2 += "</thead>"
					html2 += "<tbody>"
					
					html2 += 	"<tr>";
					html2 += 		"<td id = \"cstmr_cmpny_no\" name = \"cstmr_cmpny_no \">NULL";
					html2 += 		"</td>";
					html2 += 		"<td id = \"cstmr_cmpny\" name = \"cstmr_cmpny \">NULL";
					html2 += 		"</td>";
					html2 += 		"<td id = \"crprt_rgstrtn_no\" name = \"crprt_rgstrtn_no \">NULL";
					html2 += 		"</td>";
					html2 += 		"<td id = \"rprsntv\" name = \"rprsntv \">NULL";
					html2 += 		"</td>";
					html2 += 		"<td id = \"grade_no\" name = \"grade_no \">NULL";
					html2 += 	"</td>";
					html2 += "</tr>";
					html2 += "</tbody>"
					html2 += "</table>";
					html2 +=" <input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\" />"
					html2 +=" <div class=\"popuppaging\">";
 					html2 +=" <div class=\"popuppagingD\" name=\"1\" id=\"first\"></div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\" id=\"before\"></div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\"><b>1</b></div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\">2</div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\">3</div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\">4</div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\">5</div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\" id=\"next\"></div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\" id=\"last\"></div>"; 
   
					html2 +=" </div>";
					html2 +=" </form>";// 고객사 popup
					
					
					
					  makeOneBtnPopup(2,"고객사 검색", html2, true, 400,400, function ()  {
					  
						  reloadcc();
						  
						  $(".popuppaging").on("click", "div", function () {
								$("#page").val($(this).attr("name"));
						  
						  reloadcc();
						  });
						  
						  $(".searchBtn2").on("click", function () {
							  $("#page").val("1");
							reloadcc();
						});
						  
						  $("[name='search']").on("keypress", function (event) {
								if(event.keyCode == 13) {
									$(".searchBtn2").click();
									
									return false; // 브라우저가 가지고있는 기능을 취소한다.
									
								}
							
						  });
						  
						  $(".cc tbody").on("click", "tr", function () {
							  $("#cstmr_cmpny_no").val($(this).children().eq(0).html());
							  $("#cstmr_cmpny_name").val($(this).children().eq(1).html());
							  
							$("#cstmr_name").val("");// 고객사 재검색시 고객명 초기화
							  
						 	  closePopup(2);
										
						  })
						  
					  },"닫기", function () {
						  closePopup(2);
					}); //고객사 정보
					
			 });
			 
			 $("#cstmr_name_search").on("click", function () {
				 
				 var html2 = "";
				 
				 	html2 +=	"<form action=\"#\" id=\"cstmrForm\" method=\"post\">";
					html2 += 		"<input type=\"text\"class=\"search\" name=\"searchc\" />";
					html2 += 		"<input type=\"button\" class=\"searchBtn3\"  />";
					html2 +="<input type=\"hidden\" id=\"cstmr_cmpny_no\" name=\"cstmr_cmpny_no\" value=\"" + $("#insertForm #cstmr_cmpny_no").val() + "\"/>";
					html2 += " <table class=\"cc\">";
				 	html2 += "	<colgroup>";
				 	html2 += "		<col width=\"30%\" />";
					html2 += "		<col width=\"30%\" />";
				 	html2 += "		<col width=\"20%\" />";
				 	html2 += "		<col width=\"20%\" />";
				 	html2 +="	</colgroup>";
					html2 += "	<thead> ";
					html2 += "<tr>";
					html2 += 	"<th> 고객 </th>";
					html2 += 	"<th> 부서 </th>";
					html2 += 	"<th> 직책 </th>";
					html2 += 	"<th> 연락처 </th>";
					html2 += "</tr>";
					html2 += "</thead>"
					html2 += "<tbody>"
					
					html2 += 	"<tr>";
					html2 += 		"<td id = cstmr_name\" name = cstmr_name\">NULL";
					html2 += 		"</td>";
					html2 += 		"<td id = \"DPRTMNT\" name = \"DPRTMNT \">NULL";
					html2 += 		"</td>";
					html2 += 		"<td id = \"PSTN\" name = \"PSTN \">NULL";
					html2 += 		"</td>";
					html2 += 		"<td id = \"CNTCT\" name = \"CNTCT \">NULL";
					html2 += 	"</td>";							
					html2 += "</tr>";
					html2 += "</tbody>"
					html2 += "</table>";
					html2 +=" <input type=\"hidden\" name=\"page1\" id=\"page1\" value=\"1\" />"
					html2 +=" <div class=\"popuppaging\">";
 					html2 +=" <div class=\"popuppagingD\" name=\"1\" id=\"first\"></div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\" id=\"before\"></div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\"><b>1</b></div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\">2</div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\">3</div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\">4</div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\">5</div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\" id=\"next\"></div>";
					html2 +=" <div class=\"popuppagingD\" name=\"1\" id=\"last\"></div>"; 
   
					html2 +=" </div>";
					html2 +=" </form>";
			
					
					   makeOneBtnPopup(2,"고객 검색", html2, true, 400,400, function ()  {
						   
							  reloadc();
							  
							  $(".popuppaging").on("click", "div", function () {
									$("#page1").val($(this).attr("name"));
							  
							  reloadc();
							  });
							  
							  $(".searchBtn3").on("click", function () {
								 // $("#cstmr_name").val();

								  $("#page").val("1");
								reloadc();
							});
							  
							  $("[name='search']").on("keypress", function (event) {
									if(event.keyCode == 13) {
										$(".searchBtn3").click();
										return false; // 브라우저가 가지고있는 기능을 취소한다.
										
									}
								
							  });
							  
							  $(".cc tbody").on("click", "tr", function () {
								  console.log($(this).children(0).html());
								  $("#cstmr_name").val($(this).children(0).html());
								  
								  closePopup(2);
						  })
						  
					  },"닫기", function () {
						  closePopup(2);
					}); //고객 검색 */
					
					
			 });
			 
			 
		
		},"등록", function () {
			
	//	   	var startDate = parseInt($("#start_date").val().replace("-", '').replace("-", ''));
		//    var endDate = parseInt($("#end_date").val().replace("-", '').replace("-", ''));
		  //  var stTime = parseInt($("#start_time").val().replace(":", ''));
		   // var edTime = parseInt($("#end_time").val().replace(":", ''));
			
		    
		  	 if ($.trim($("#schdml_name").val()) == "") {
		  		  alert("일정명을 입력하여 주세요.");
		  		  }else if ($.trim($("#place").val()) == "") {
		  		  alert("장소를 입력하여 주세요.");
		  		  }
		    
			
			var params = $("#insertForm").serialize();
			
		 	$.ajax({
				type : "post",
				url : "bsnsSchdlMgmntWriteAjax",
				dataType : "json", 
				data : params,
				success : function(res) {
					
					if(res.result == "success") {
						alert("등록완료");
						
					 	closePopup(1);


					} else {
						alert("등록 중 문제가 발생하였습니다.");
						console.log(res.pb);
					}
					
				},
				error : function (requset, status, error) { 
					console.log("text : " + request.responseText); 
					console.log("error : " + error); 
				}
			});
		  	 
			

		  	 

		
		}, "취소", function () {
			closePopup(1);
			
		});//2팝업
		
			
		});//일정 등록 팝업
		
		
$(".cal_list tbody").on("click", "tr", function () {
	var html5 = "";
	
 	html5 +="	<form action=\"#\" id=\"infoForm\" method=\"post\">";
 	html5 +="	<input type=\"hidden\" name=\"SCHDL_NO\" value=\"" + $(this).attr("name") + "\" >";
 	html5 +="	<input type=\"hidden\" name=\"CSTMR_CMPNY_NAME\" value=\"" + $(this).attr("name") + "\" >";
 	html5 +="	<input type=\"hidden\" name=\"CSTMR_NAME\" value=\"" + $(this).attr("name") + "\" >";
	html5 += "	</form>";
	makeThreeBtnPopup(1, "일정상세보기", html5, true, 800, 700, function () {
		var params = $("#infoForm").serialize();
			//Ajax
		$.ajax({
			type : "post", 
			url : "infoAjax", 
			dataType : "json", 
			data : params, 
			success : function(res) { 
				if(res.result == "success") {
					var html5 = "";

					html5 +="	<form action=\"#\" id=\"infoForm\" method=\"post\">";

					html5+= "	<table class=\"schedule_pop\">";
					html5+= "	<thead> ";
					html5+= "	</thead>";
					html5+= "		<tbody>";
					html5+= "			<tr>";
					html5+= "			<th>작성자</th>";
					html5+= "			<td> "+ res.infolist.EMPLY_NAME + " </td>";
					html5+= "			<th>부서/직책</th>";
					html5+= "			<td> " + res.infolist.DPRTMNT_NAME + "/" + res.infolist.PSTN_NAME + "</td>";
					html5+= "			</tr>";
					html5+= "			<tr>";
					html5+= "				<th>일정명</th>";
					html5+= "				<td colspan=\"3\"> "+ res.infolist.SCHDL_NAME +"</td>";
					html5+= "			</tr>";
					html5+= "			<tr>";
					html5+= "				<th>고객사</th>";
					html5+= "				<td> "+ res.infolist.CSTMR_CMPNY_NAME +"</td>";
					html5+= "				<th>고객</th>";
					html5+= "				<td> "+ res.infolist.CSTMR_NAME + " </td>";
					html5+= "			</tr>";
					html5+= "			<tr>";
					html5+= "				<th>활동분류</th>";
					html5+= "				<td colspan=\"3\"> " + res.infolist.CODE_NAME +"</td>";
					html5+= "			</tr>";
					html5+= "			<tr>";
					html5+= "				<th>장소</th>";
					html5+= "				<td colspan=\"3\"> " + res.infolist.PLACE +  "</td>";
					html5+= "			</tr>";
					html5+= "			<tr>";
					html5+= "				<th>중요도</th>";
										if(res.infolist.IMPRTNC_TYPE == 0){
					html5+= "				<td colspan=\"3\"> "+ "예"  +"</td>";
										} else {
					html5+= "				<td colspan=\"3\"> "+  "아니요" +"</td>";
										}
					html5+= "			</tr>";
					html5+= "			<tr>";
					html5+= "				<th>약속날짜</th>";
					html5+= "				<td colspan=\"3\"> "+ res.infolist.START_DATE +"</td>";
					html5+= "			</tr>";
					html5+= "			<tr>";
					html5+= "				<th>약속시간</th>";
					html5+= "				<td colspan=\"3\"> "+ res.infolist.TIME +"</td>";
					html5+= "			</tr>";
					html5+= "			<tr class=\"context\">";
					html5+= "				<th>내용</th>";
					html5+= "			 	<td colspan=\"3\">" + res.infolist.CNTNT +"</td>";
					html5+= "			</tr>";
					html5+= "		</tbody>";
					html5+= "	</table>";
					html5+= "	</form>";
					
					
					$("#infoForm").append(html5);
					
				}
				else {
					alert("조회 중 문제가 발생했습니다.");
					console.log();	
				}
				
			},
			/* 에러 3줄 고정 
			수행중 결과가 돌아오지 않을때 밑에있는 에러 코드가 실행됨*/
			error : function (requset, status, error) { // 실행중 에러 발생 시
				console.log("text : " + request.responseText); // 반환텍스트
				console.log("error : " + error); // 에러 내용
			}
		});
		reloadList();

	
		},
		
			"수정", function () {
			
			
			
		},
			"삭제", function () {
			
		},
			"닫기", function () {
		  		closePopup(2);
	}); //일정 클릭시 상세보기
	 
}); //클릭함수
	
		
		
		
});// 끝
		
		function reloadcc() {
			var params = $("#cstmr_cmpnyForm").serialize();
			$.ajax({
				type : "post",
				url : "cclistAjax",
				dataType : "json", 
				data : params,
				success : function(res) {
					if(res.result == "success") {
						redrawpopuppaging(res.pb);
						redrawlistcc(res.cclist);
					} else {
						alert("조회 중 문제가 발생하였습니다.");
						console.log(res.pb);
					}
					
				},
				error : function (requset, status, error) { 
					console.log("text : " + request.responseText); 
					console.log("error : " + error); 
				}
			});
		}// 고객사 조회	
		
		function redrawlistcc(cclist) {
			var html2 = "";

			if(cclist.length == 0) {
				html2 += "<tr>";
				html2 += "<td colspan=\"4\">조회 결과가 없습니다.</td>";
				html2 += "<tr>";

			$(".cc tbody").html(html2);
			} else {
				var html2 = "";
				
				for(var i = 0; i < cclist.length ; i++) {
					
					html2 += "<tr name=\"" + cclist[i].CSTMR_CMPNY_NO + "\">";
					html2 +="<td>" + cclist[i].CSTMR_CMPNY_NO + "</td>";
					html2 +="<td>" + cclist[i].CSTMR_CMPNY_NAME + "</td>";
					html2 +="<td>" + cclist[i].CRPRT_RGSTRTN_NO  + "</td>";
					html2 +="<td>" + cclist[i].RPRSNTV  + "</td>";
					html2 +="<td>" + cclist[i].GRADE_NAME + "</td>";
					html2 += "</tr>";
				}
				
				$(".cc tbody").html(html2);
			}
			
			
		}
		
		
		function redrawpopuppaging(pb) {
			var html2 = "<div class=\"popuppagingD\" name=\"1\" id=\"first\"></div>&nbsp;";
			
			if($("#page").val() == 1) {
				html2 += "<div class=\"popuppagingD\" name=\"1\" id=\"before\"></div>&nbsp;";
				
			} else {
				html2 += "<div class=\"popuppagingD\" name=\"" + ($("#page").val()*1 - 1) + "\" id=\"before\"></div>&nbsp;";
				
			}
			
			for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
				if(i == $("#page").val()) {
					html2 += "<div class=\"popuppagingD\" name=\"" + i + "\"><b>" + i + "</b> </div>&nbsp;";
				} else {
					html2 += "<div class=\"popuppagingD\" name=\"" + i + "\">" + i + "</div>&nbsp;";
				}
				
			}
			if($("#page").val() == pb.maxPcount) {
				html2 += "<div class=\"popuppagingD\" name=\"" + pb.maxPcount + "\" id=\"next\"></div>&nbsp;";
				} else {
					html2 += "<div class=\"popuppagingD\" name=\"" + ($("#page").val()*1 + 1) + "\" id=\"next\"></div>&nbsp;";
			}
			html2 += "<div class=\"popuppagingD\" name=\"" + pb.maxPcount + "\" id=\"last\"></div>";
			$(".popuppaging").html(html2);
			
		} //고객사페이징 구현
		
		function reloadc() {
			var params = $("#cstmrForm").serialize();
			$.ajax({
				type : "post",
				url : "clistAjax",
				dataType : "json", 
				data : params,
				success : function(res) {
					if(res.result == "success") {
						redrawpopuppaging2(res.pb);
						redrawlistc(res.clist);
					} else {
						alert("조회 중 문제가 발생하였습니다.");
						console.log(res.pb);
						console.log(res.clist);
					}
					
				},
				error : function (requset, status, error) { 
					console.log("text : " + request.responseText); 
					console.log("error : " + error); 
				}
			});
			
		}// 고객 리로드
		
		function redrawlistc(clist) {
			var html2 = "";

			if(clist.length == 0) {
				html2 += "<tr>";
				html2 += "<td colspan=\"4\">조회 결과가 없습니다.</td>";
				html2 += "<tr>";

			$(".cc tbody").html(html2);
			} else {
				var html2 = "";
				
				for(var i = 0; i < clist.length ; i++) {
					html2 += "<tr name=\"" + clist[i].CSTMR_NO + "\">";
					html2 +="<td>" + clist[i].CSTMR_NAME + "</td>";
					html2 +="<td>" + clist[i].DPRTMNT  + "</td>";
					html2 +="<td>" + clist[i].PSTN  + "</td>";
					html2 +="<td>" + clist[i].CNTCT + "</td>";
					html2 += "</tr>";
				}
				
				$(".cc tbody").html(html2);
			}
			
			
		}// 고객 리드로우
		
		function redrawpopuppaging2(pb) {
			var html2 = "<div class=\"popuppagingD\" name=\"1\" id=\"first\"></div>&nbsp;";
			
			if($("#page1").val() == 1) {
				html2 += "<div class=\"popuppagingD\" name=\"1\" id=\"before\"></div>&nbsp;";
				
			} else {
				html2 += "<div class=\"popuppagingD\" name=\"" + ($("#page1").val()*1 - 1) + "\" id=\"before\"></div>&nbsp;";
				
			}
			
			for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
				if(i == $("#page1").val()) {
					html2 += "<div class=\"popuppagingD\" name=\"" + i + "\"><b>" + i + "</b> </div>&nbsp;";
				} else {
					html2 += "<div class=\"popuppagingD\" name=\"" + i + "\">" + i + "</div>&nbsp;";
				}
				
			}
			if($("#page1").val() == pb.maxPcount) {
				html2 += "<div class=\"popuppagingD\" name=\"" + pb.maxPcount + "\" id=\"next\"></div>&nbsp;";
				} else {
					html2 += "<div class=\"popuppagingD\" name=\"" + ($("#page1").val()*1 + 1) + "\" id=\"next\"></div>&nbsp;";
			}
			html2 += "<div class=\"popuppagingD\" name=\"" + pb.maxPcount + "\" id=\"last\"></div>";
			$(".popuppaging").html(html2);
			
		}// 고객 팝업 페이징
		
		
		function cal_list() {
			var html3 = "";
			
			html3+="		<tr>";
			html3+="			<td><div class=\"cal_flag_red\"></div></td>";
			html3+="				<td colspan=\"2\">";
			html3+="				<div class=\"cal_time_area\">14:00 - 16:00 (장소정보)</div>";
			html3+="				<div class=\"cal_name\">[담당자이름] 담당자부서명이 들어갑니다.</div>";
			html3+="				<div class=\"cal_dtl\">[활동구분] 일정명이 들어갑니다.</div>";
			html3+="			</td>";
			html3+="		</tr>";
			
			$(".cal_list tbody").html(html3);
		}
	/* 영업일정 코드  */
		
function reloadList() {
	var params = $("#insertForm").serialize();
	console.log(params);
	$.ajax({
		type : "post", // 전송방식
		url : "cal_listAjax", // 주소
		dataType : "json", // 데이터형태
		data : params, // 보낼데이터
		success : function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다.
			if(res.result == "success") {
				redrawList(res.redrawList);
				cal_listpaging(res.pb);
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
} // 일정 리로드

function reloadList2() {
	var params = $("#insertForm").serialize();
	$.ajax({
		type : "post", // 전송방식
		url : "cal_list2Ajax", // 주소
		dataType : "json", // 데이터형태
		data : params, // 보낼데이터
		success : function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다.
			if(res.result == "success") {
				 console.log(res.list);
				  //기존이벤트 제거
				  var old = calendar.getEventSources();
				  for(var i in old) {
				  old[i].remove();
				  }
				  //신규이벤트 추가
				  calendar.addEventSource(res.list);
				  //새로 그리기
				  calendar.refetchEvents();
				  }else{
				  alert("조회중 문제가 발생하였습니다.")
				  }
				  },
				  error: function(request, status, error){//실행 중 에러 발생 시 경우 해당 함수를 실행하겠다.
				  console.log("txt : " + request.responseText); //반환 텍스트
				  console.log("error : " + error); //에러 내용
				  } 
					});//ajax end
					
} // 일정 리로드2 달력 바 이벤트

function redrawList(cal_list) {
	var html3 = "";

	if(cal_list.length == 0) {
		html3 +="<tr>";
		html3 +=" <td colspan=\"3\">조회결과가 없습니다.</td>";
		html3 +="</tr>";
		
	} else {
		for(var i = 0; i < cal_list.length ; i++) {
			html3 +="<tr name=\"" + cal_list[i].SCHDL_NO + "\">";
 			
			switch(cal_list[i].COLOR) {
			case 1 : 
				html3 +=" <td><div class=\"cal_flag_green\"></div></td>";
				break;
			case 2 : 
				html3 +=" <td><div class=\"cal_flag_blue\"></div></td>";
				break;
			case 3 : 
				html3 +=" <td><div class=\"cal_flag_red\"></div></td>";

				break;
			}
 //			html3 +=" <td><div class=\"cal_flag_no" + cal_list[i].COLOR + "\"></div></td>";
			
			html3 +="<td colspan=\"2\">";
			html3 +="	<div class=\"cal_time_area\"> " + cal_list[i].START_TIME + " - " + cal_list[i].END_TIME + "(" + cal_list[i].PLACE + ")</div>";
			html3 +="	<div class=\"cal_name\">[" + cal_list[i].EMPLY_NAME + "] " + cal_list[i].PSTN_NAME + "</div>";
			html3 +="	<div class=\"cal_dtl\">[" + cal_list[i].CODE_NAME + "] " + cal_list[i].SCHDL_NAME + "</div>";
			html3 +=" </td>";
			html3 +="</tr>";
		}
	}
	
	$(".cal_list tbody").html(html3);
	
}//일정 리드로우
		
		function cal_listpaging(pb) {
			var html3 = "<div class=\"popuppagingD\" name=\"1\" id=\"first\"></div>&nbsp;";
			
			if($("#page3").val() == 1) {
				html3 += "<div class=\"popuppagingD\" name=\"1\" id=\"before\"></div>&nbsp;";
				
			} else {
				html3 += "<div class=\"popuppagingD\" name=\"" + ($("#page3").val()*1 - 1) + "\" id=\"before\"></div>&nbsp;";
				
			}
			
			for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
				if(i == $("#page3").val()) {
					html3 += "<div class=\"popuppagingD\" name=\"" + i + "\"><b>" + i + "</b> </div>&nbsp;";
				} else {
					html3 += "<div class=\"popuppagingD\" name=\"" + i + "\">" + i + "</div>&nbsp;";
				}
				
			}
			if($("#page3").val() == pb.maxPcount) {
				html3 += "<div class=\"popuppagingD\" name=\"" + pb.maxPcount + "\" id=\"next\"></div>&nbsp;";
				} else {
					html3 += "<div class=\"popuppagingD\" name=\"" + ($("#page3").val()*1 + 1) + "\" id=\"next\"></div>&nbsp;";
			}
			html3 += "<div class=\"popuppagingD\" name=\"" + pb.maxPcount + "\" id=\"last\"></div>";
			$(".paging").html(html3);
			
		}// 일정페이징
		
			
</script>

</head>
<body>

<!-- 탑/레프트 -->
<c:import url="/topLeft">
<%-- 현재 페이지 해당 메뉴번호 지정 --%>
	<c:param name="menuNo" value="29"></c:param>
</c:import>
<!-- 구현내용 -->
<div class="title_wrap">
	<div class="title_table">
		<div class="title_txt">영업일정</div>
	</div>
</div>
<div class="contents_area">
	<!-- 내용은 여기에 구현하세요. -->
		<form action="#" id="insertForm">
		<input type="hidden" name="page3" id="page3" value="1"/> 
			<input type="hidden" name="pagecc" id="pagecc" value="1" />
		</form>
			<div class="cal">
				<div class="cal1" id="cal1">
				</div>
				<table class="colorname2">
					<thead>
					</thead>
						<tbody>
							<tr>
								<th>계획</th>
									<td class="cal_color1"></td>
								<th>진행중</th>
									<td class="cal_color2"></td>
								<th>진행완료</th>
									<td class="cal_color3"></td>
							</tr>
					</tbody>
				</table>
			</div>				
 			<div class="cal_list">
				<table class="cal_list_table">
					<colgroup>
						<col width="40px" />
						<col width="*" />
						<col width="40px" />
					</colgroup>
					<thead>
						<tr>
							<th colspan="2" class="cal_sel_date" name="cal_sel_date">null</th>
							<th>
							<div class="add_btn">
							<input type="image" src="" width="50" height="50" alt="일정추가" > </div>
							</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr>
							<td><div class="cal_flag_red"></div></td>
							<td colspan="2">
								<div class="cal_time_area">14:00 - 16:00 (장소정보)</div>
								<div class="cal_name">[담당자이름] 담당자부서명이 들어갑니다.</div>
								<div class="cal_dtl">[활동구분] 일정명이 들어갑니다.</div>
							</td>
						</tr>
						<tr>
							<td><div class="cal_flag_red"></div></td>
							<td colspan="2">
								<div class="cal_time_area">14:00 - 16:00 (장소정보)</div>
								<div class="cal_name">[담당자이름] 담당자부서명이 들어갑니다.</div>
								<div class="cal_dtl">[활동구분] 일정명이 들어갑니다.</div>
							</td>
						</tr> -->
					</tbody>
				</table>
		
		<div class="paging">
			
			<div class="popuppagingD" name="1" id="first"></div>
			<div class="popuppagingD" name="1" id="before"></div>
			<div class="popuppagingD" name="1"><b>1</b></div>
			<div class="popuppagingD" name="1">2</div>
			<div class="popuppagingD" name="1">3</div>
			<div class="popuppagingD" name="1">4</div>
			<div class="popuppagingD" name="1">5</div>
			<div class="popuppagingD" name="1" id="next"></div>
			<div class="popuppagingD" name="1" id="last"></div>
			</div>
</div>
</div>
	


<!-- 구현끝 -->
<!-- 바텀 -->
<c:import url="/bottom"></c:import>
</body>
</html>