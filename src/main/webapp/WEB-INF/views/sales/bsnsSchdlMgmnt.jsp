<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vanilla ERP 영업일정</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/sales/bsnsSchdlMgmnt.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/fullcalendar/main.css" />
<!-- 헤더 -->
<c:import url="/header"></c:import>
<style type="text/css">

</style>

<script src="resources/script/fullcalendar/main.js"></script>
<script src="resources/script/fullcalendar/locales-all.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script>
<script type="text/javascript">
var calendar = null;
$(document).ready(function() {

	reloadcallist();
	
$("#insertBtn").on("click", function() {
		
		var html = "";
		
		html +="<form action=\"#\" id=\"insertForm\" method=\"post\">";
		html +="<input type=\"hidden\"  id=\"sEmplyNo\" name=\"sEmplyNo\" value=\"${sEmplyNo}\" />";
		html +="<input type=\"hidden\"  id=\"cstmr_no2\" name=\"cstmr_no2\" />";
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
		html +="		<input type=\"text\" name=\"schdl_name\" id=\"schdl_name\" placeholder=\"일정명을 입력해주세요\" maxlength=\"20\"/> ";
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
				 	html2 += "	</colgroup>";
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
					html2 += "<input type=\"hidden\" id=\"cstmr_no\" name=\"cstmr_no\"/>";
					html2 += " <table class=\"cc\">";
				 	html2 += "	<colgroup>";
				 	html2 += "		<col width=\"20%\" />";
				 	html2 += "		<col width=\"20%\" />";
					html2 += "		<col width=\"20%\" />";
				 	html2 += "		<col width=\"20%\" />";
				 	html2 += "		<col width=\"20%\" />";
				 	html2 +="	</colgroup>";
					html2 += "	<thead> ";
					html2 += "<tr>";
					html2 += 	"<th> 고객 번호</th>";
					html2 += 	"<th> 고객 </th>";
					html2 += 	"<th> 부서 </th>";
					html2 += 	"<th> 직책 </th>";
					html2 += 	"<th> 연락처 </th>";
					html2 += "</tr>";
					html2 += "</thead>"
					html2 += "<tbody>"
					
					html2 += 	"<tr>";
					html2 += 		"<td id = \"cstmr_no\" name = cstmr_no\">NULL";
					html2 += 		"</td>";
					html2 += 		"<td id = \"cstmr_name\" name = cstmr_name\">NULL";
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
								  console.log($(this).children(1).html());
								 /*  $("#cstmr_no").val($(this).children(0).html());
								  $("#cstmr_no").val($(this).children(0).html());
								  */
								  $("#cstmr_no2").val($(this).children().eq(0).html());
								  $("#cstmr_name").val($(this).children().eq(1).html());
								  closePopup(2);	
						  })
						  
					  },"닫기", function () {
						  closePopup(2);
					}); //고객 검색 */
					
			 
			 });
		},"등록", function () {
			
				//	var startDate = parseInt($("#start_date").val().replace("-", '').replace("-", ''));
				//	var startTime = parseInt($("#start_time").val().replace(":", ''));
				//	var endDate = parseInt($("#end_date").val().replace("-", '').replace("-", ''));
				//	var endTime = parseInt($("#end_time").val().replace(":", ''));	
				    
				  	 if ($.trim($("#schdl_name").val()) == "") {
				  		 	 alert("일정명을 입력하여 주세요.");
				  		  }else if ($.trim($("#place").val()) == "") {
				  			  alert("장소를 입력하여 주세요.");
				  		  }/* else if ($.trim($("#start_date").val()) == "") {
				  			  alert("시작날짜를 입력하여 주세요.");
				  		  }else if ($.trim($("#start_time").val()) == "") {
				  		 	 alert("시작시간을 입력하여 주세요.");
				  		  }else if ($.trim($("#end_date").val()) == "") {
				  		  	alert("종료날짜를 입력하여 주세요.");
				  		  }else if ($.trim($("#end_time").val()) == "") {
				  		 	 alert("종료시간을 입력하여 주세요.");
				  		  } */
				  		  /* else if ($.trim($("#CNTNT").val()) == "") {
				  		 	 alert("업무내용을 입력하여 주세요.");
				  		  } else if("#end_date" < "#start_date") { 
				  		  	 alert("종료날짜가 시작날짜보다 전입니다..");
				  		           	$("#end_date").val("");
				  		  }else if("#end_date" == "#start_date" && "#end_time" < "#start_time") {
				  		     alert("종료시간이 시작시간보다 전입니다.");
				  		            $("#endDate").val("");
				  		            
				  		          
				  		  }*/
				  		  else {
				  		            		
							var params = $("#insertForm").serialize();
										console.log(params); 
						 	$.ajax({
								type : "post",
								url : "bsnsSchdlMgmntWriteAjax",
								dataType : "json", 
								data : params,
								success : function(res) {
									
									if(res.result == "success") {
										alert("등록완료");
									 	closePopup(1);
									 	reloadcallist();  //일정불러오기
									} else {
										alert("등록 중 문제가 발생하였습니다.");
										console.log( $("#schdl_no") );
									}
								},
								error : function (requset, status, error) { 
									console.log("text : " + request.responseText); 
									console.log("error : " + error); 
								}
							}); //등록 ajax끝
							
							
						  		            	
						 }
				  		            	
				
				}, "취소", function () {
					closePopup(1);
					
				});//2팝업
				
					
				});//일정 등록 팝업
	
	var d = new Date();
	var calendarEl = document.getElementById('cal1');
	var all = ""; 
	calendar = new FullCalendar.Calendar(calendarEl, {
		
			displayEventTime:false, 
			
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
				},
			defaultDate : d.getFullYear() + "-" + (d.getMonth() + 1) + "-" 	+ d.getDate(),
			locale : "ko",
			editable : false,
			height : 600,
		//	events : data,
			eventClick : function(info) { // 이벤트 클릭
				 $("#schdl_no").val(info.event.id);
				 
			console.log(info.event.id);
			 var params = $("#insertForm").serialize();
			$.ajax({
				type : "post", //전송방식
				url : "infolistAjax", //주소
				dataType : "json", //데이터형태
				data: params, //보낼 데이터
				success : function(res){

					
					console.log(res); 
					
						var html5 = "";

						html5 +="	<form action=\"#\" id=\"insertForm\" method=\"post\">";
						html5 +=" <input type=hidden id=\"schdl_no2\" name=\"schdl_no2\"/>";
						html5 +=" <input type=hidden id=\"sEmplyNo\" name=\"sEmplyNo\" value='${sEmplyNo}'/>";
						html5+= "	<table class=\"schedule_pop\">";
						html5+= "	<thead> ";
						html5+= "	</thead>";
						html5+= "		<tbody>";
						html5+= "			<tr>";
						html5+= "			<th>작성자</th>";
						html5+= "			<td> "+ res.infolist[0].EMPLY_NAME + " </td>";
						html5+= "			<th>부서/직책</th>";
						html5+= "			<td> " + res.infolist[0].DPRTMNT_NAME + "/" + res.infolist[0].PSTN_NAME + "</td>";
						html5+= "			</tr>";
						html5+= "			<tr>";
						html5+= "				<th>일정명</th>";
						html5+= "				<td colspan=\"3\"> "+ res.infolist[0].SCHDL_NAME +"</td>";
						html5+= "			</tr>";
						html5+= "			<tr>";
						html5+= "				<th>고객사</th>";
						html5+= "				<td> "+ res.infolist[0].CSTMR_CMPNY_NAME +"</td>";
						html5+= "				<th>고객</th>";
						html5+= "				<td> "+ res.infolist[0].CSTMR_NAME + " </td>";
						html5+= "			</tr>";
						html5+= "			<tr>";
						html5+= "				<th>활동분류</th>";
						html5+= "				<td colspan=\"3\"> " + res.infolist[0].CODE_NAME +"</td>";
						html5+= "			</tr>";
						html5+= "			<tr>";
						html5+= "				<th>장소</th>";
						html5+= "				<td colspan=\"3\"> " + res.infolist[0].PLACE +  "</td>";
						html5+= "			</tr>";
						html5+= "			<tr>";
						html5+= "				<th>중요도</th>";
											if(res.infolist[0].IMPRTNC_TYPE == 0){
						html5+= "				<td colspan=\"3\"> "+ "예"  +"</td>";
											} else {
						html5+= "				<td colspan=\"3\"> "+  "아니요" +"</td>";
											}
						html5+= "			</tr>";
						html5+= "			<tr>";
						html5+= "				<th>약속날짜</th>";
						html5+= "				<td colspan=\"3\"> "+ res.infolist[0].START_DATE +"</td>";
						html5+= "			</tr>";
						html5+= "			<tr>";
						html5+= "				<th>약속시간</th>";
						html5+= "				<td colspan=\"3\"> "+ res.infolist[0].TIME +"</td>";
						html5+= "			</tr>";
						html5+= "			<tr class=\"context\">";
						html5+= "				<th>내용</th>";
						html5+= "			 	<td colspan=\"3\">" + res.infolist[0].CNTNT +"</td>";
						html5+= "			</tr>";
						html5+= "		</tbody>";
						html5+= "	</table>";
						html5+= "	</form>";
						
						
					//	if("${sEmplyNo}" == res.infolist.EMPLY_NO) {
						makeThreeBtnPopup(1, "일정상세보기", html5, true, 800, 700, function () {
							 $("#schdl_no2").val(info.event.id);
							// $("#emply_no2").val($this.);
							
						}, "수정", function () {
							console.log(info.event.id);
										
							var params = $("#insertForm").serialize();
							
							$.ajax({
								type : "post", //전송방식
								url : "SchdlUpdateAjax", //주소
								dataType : "json", //데이터형태
								data: params, //보낼 데이터
								success : function(res){
								
								 console.log(res);
									if(res.result == "success"){
										alert("수정에 성공하였습니다.");
										closePopup(1);
										reloadcallist();
									}else{
										alert("수정중 문제가 발생하였습니다.");
										reloadcallist();
									}
										
								},
								error: function(request, status, error){//실행 중 에러 발생 시 경우 해당 함수를 실행하겠다.
									console.log("txt : " + request.responseText); //반환 텍스트
									console.log("error : " + error); //에러 내용
								} 
							});//ajax end
					
							
						} , "삭제", function(){
							
										console.log(info.event.id);
							if(confirm("삭제하시겠습니까?")){
										
										if(confirm("정말로 삭제하시겠습니까?")) {
											var params = $("#insertForm").serialize();
											
											$.ajax({
												type : "post", //전송방식
												url : "delSchdlUpdateAjax", //주소
												dataType : "json", //데이터형태
												data: params, //보낼 데이터
												success : function(res){
												
												 console.log(res);
													if(res.result == "success"){
														alert("삭제에 성공하였습니다.");
														closePopup(1);
														reloadcallist();
													}else{
														alert("삭제중 문제가 발생하였습니다.");
														reloadcallist();
													}
														
												},
												error: function(request, status, error){//실행 중 에러 발생 시 경우 해당 함수를 실행하겠다.
													console.log("txt : " + request.responseText); //반환 텍스트
													console.log("error : " + error); //에러 내용
												} 
											});//ajax end
										}
									}
									
							
						}, "닫기", function () {
						
						closePopup(1);

					})
				}
				
			})
		

		}
			
		}); // 바 캘린더 끝
calendar.render();
});// 다큐먼트레디 끝



function reloadcallist() {
	var params = $("#insertForm").serialize();
	
	$.ajax({
		type : "post", //전송방식
		url : "reloadcallistAjax", //주소
		dataType : "json", //데이터형태
		data: params, //보낼 데이터
		success : function(res){
			if(res.result == "success"){
			//	$("#sEmplyNo2").val("${sEmplyNo}");
				//기존이벤트 제거
				console.log(res.list);
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
	
}//reloadList end



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
			html2 +="<td>" + clist[i].CSTMR_NO + "</td>";
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









</script>
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
			<input type="hidden" id="sEmplyNo" name="sEmplyNo" value="${sEmplyNo}" />
			<input type="hidden" id="schdl_no" name="schdl_no"  />
					
			<input type="hidden" name="cal_no" id="cal_no" /> <!-- 달력 일정  -->
			
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
				<input type="button" value="등록" id="insertBtn"/>	
			</div>				
  
  
</div>

<!-- 구현끝 -->
<!-- 바텀 -->
<c:import url="/bottom"></c:import>
</body>
</html>