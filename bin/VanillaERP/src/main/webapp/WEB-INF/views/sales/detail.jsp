<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업상세보기</title>
<!-- 헤더 -->
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/sales/css2.css"/>
<style type="text/css">
.updateBtn{
border: 1px solid lightgray;
 	color:#515151;
 	outline-color: #d5e4f1;
	height:30px;
	width: 50px;
 	outline-color: #d5e4f1;
	cursor: pointer;
	}
.searchText{
	width : 90%;
	height : 30px;
}
.zz{
	font-size :15px;
}
.tableSuggest td {
	border-bottom: 1px solid lightgray;
	
}

.tableSuggest tbody tr:hover {
	background-color: #dae2f1;	
	cursor: pointer;
}
.table2 td {
	border-bottom: 1px solid lightgray;
	
}

.table2 tbody tr:hover {
	background-color: #dae2f1;	
	cursor: pointer;
}
</style>




<script type="text/javascript">

$(document).ready(function() {
							reloadSalesList();
							opnreloadList();
							newschdlReload();
							if("${data.BSNS_STATE}" == "2","3","4"){ 
							itemsListsgstn();
							}else if ("${data.BSNS_STATE}" == "3","4"){
							itemsListngtn();
							}else if("${data.BSNS_STATE}" == "4"){
							itemsListorder();
							}
							
								$(".silmscroll").slimScroll({
									height : "700px"
								})
								
								$("#chancehide").on("click",function(){
									    if($("#1").css('display') == 'none'){
								            $('#1').show();
								        }else{
								            $("#1").hide();
								        }	
									});
								
								$("#sghide").on("click",function(){
									    if($("#2").css('display') == 'none'){
								            $('#2').show();
								        }else{
								            $("#2").hide();
								        }
									});
								
								$("#nghide").on("click",function(){
								    if($("#3").css('display') == 'none'){
								        $('#3').show();
								    }else{
								        $("#3").hide();
								    }
								});
								
								$("#orderhide").on("click",function(){
								    if($("#4").css('display') == 'none'){
								        $('#4').show();
								    }else{
								        $("#4").hide();
								    }
								});//막대바
							
								
								
						 let today = new Date();
						 let year = today.getFullYear();
						 let month = today.getMonth() + 1;
						 let date = today.getDate();
	//기본 날짜 (오늘)
	
	
//일정팝업
/* 일정등록 */
	$("#sche").on("click",function(){		
		

			var html ="";
			html +="<form action=\"#\" id=\"actionFormSche\" method =\"post\">";
			
			html +="<input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";
			html +="<input type=\"hidden\" name=\"schdlNo\" id =\"schdlNo\" value=\"${data.SCHDL_NO}\">";
			html += "<input type=\"hidden\" name=\"sEmplyNo\" id=\"sEmplyNo\" value=\"${sEmplyNo}\">";
			html+="<table  cellspacing =\"0\">";
			html+="<colgroup>";
			html+="<col width=\"100px\"/>";
			html+="<col width=\"350px\"/>";
			html+="<col width=\"100px\"/>";
			html+="<col width=\"350px\"/>";
			html+="</colgroup>";
			html+="<tbody>";
			html+="<tr height=\"50px\">";	
			html+="<td>시작날짜</td>";
			html+="<td><input type= \"date\" class =\"text1\" name =\"startDate\" id =\"startDate\"  /></td>";
			html+="<td>종료날짜</td>";
			html+="<td><input type= \"date\" class =\"text1\" name =\"endDate\" id =\"endDate\" /></td>";
			html+="</tr>";
			html+="<tr height=\"50px\">";	
			html+="<td>일정이름</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"schdlName\" id =\"schdlName\"   /></td>";
			html+="<td>일정장소</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"place\" id =\"place\"   /></td>";
			html+="</tr>";
			html +="<tr height=\"50px\">";
			html +="<td>일정내용</td>";
			html +="<td colspan=\"3\"><input type= \"text\" class =\"text4\" name =\"cntnt\" id =\"cntnt\"  /></td>";
			html +="</tr>";
			html+="</tbody>";
			html+="</table>";
			html+="</form>";
			
			makeTwoBtnPopup(1, "일정등록", html, true, 900, 750, function(){
				
						 
			}, "저장", function() {
				//Ajax저장버튼 누를때
				if($.trim($("#startDate").val()) == ""){
					alert("시작날짜를 입력하여주세요");
				} else if ($.trim($("#endDate").val())== ""){
					alert("종료날짜를 입력하여주세요");
				} else if ($.trim($("#place").val())== ""){
					alert("장소를 입력하여주세요");
				} else if ($.trim($("#cntnt").val())== ""){
						alert("내용을 입력하여주세요");
				}else if ($.trim($("#schdlName").val())== ""){
						alert("일정이름을 입력하여주세요");
				}  
				else{
					var params = $("#actionFormSche").serialize();
					console.log(params);
					$.ajax({
						type : "post",
						url : "schdlAjax",//등록
						dataType : "json",
						data : params,
						success : function(res){
							console.log("액션폼2의 res: " + res);
							closePopup(1);
						if(res.result == "success"){  
							
								newschdlReload();
								location.reload();
								reloadSalesList();
								//reloadList();
								closePopup(1);
							
						}else {
							alret("오류가 발생하였습니다");
						}
						},
						error : function(request, status, error){
							console.log("text : " + request.responseText);
							console.log("error :" + error);
						}
					});
					}
			}, "닫기", function() {	
			
				closePopup(1);
			});

	}); //일정등록팝업
	
	
	
	
	
	//일정확인
$("#table2 tbody ").on("click",  "tr" ,function(){
	
	$("#schdlNo").val($(this).attr("name"));
	
	var params = $("#actionFormSchetable").serialize();
	
	$.ajax({
		type : "post",//전송방식
		url : "getSchdlAjax",//주소
		dataType : "json",//데이터형태
		data : params,//보낼데이터
		success : function(res) {//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
			console.log(res);
			if (res.result == "success") {
				getone1(res.data);
			}else if (res.result == "fail") {
				alret("수정데이터에 문제");
			} else {
				alret("오류문제");
			}
		},
		error : function(request, status, error) {//실행중 에러 발생시
			console.log("text : " + request.responseText);//반환텍스트
			console.log("error :" + error);//에러ㄴㅐ용
		}
	});//ajax
});//END


function getone1(data) {

	var SCHDL_NO = data.SCHDL_NO;
	var SCHDL_NAME = data.SCHDL_NAME;
	var START_DATE = data.START_DATE;
	var END_DATE = data.END_DATE;
	var PLACE = data.PLACE;
	var CNTNT = data.CNTNT;

	var html = "";
	html +="<form action=\"#\" id=\"actionFormSche\" method =\"post\">";
	html +="<input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";
	html +="<input type=\"hidden\" name=\"schdlNo\" id =\"schdlNo\" value=\"" + SCHDL_NO + "\">";
	html += "<input type=\"hidden\" name=\"sEmplyNo\" id=\"sEmplyNo\" value=\"${sEmplyNo}\">";
	html+="<table  cellspacing =\"0\" id =\"vvvv\">";
	html+="<colgroup>";
	html+="<col width=\"150px\"/>";
	html+="<col width=\"350px\"/>";
	html+="<col width=\"150px\"/>";
	html+="<col width=\"350px\"/>";
	html+="</colgroup>";
	html+="<tbody>";
	html+="<tr height=\"50px\">";	
	html+="<td>시작날짜</td>";
	html+="<td>"+START_DATE+"</td>";
	html+="<td>종료날짜</td>";
	html+="<td>"+END_DATE+"</td>";
	html+="</tr>";
	html+="<tr height=\"50px\">";	
	html+="<td>일정이름</td>";
	html+="<td>"+SCHDL_NAME+"</td>";
	html+="<td>일정장소</td>";
	html+="<td>"+PLACE+"</td>";
	html+="</tr>";
	html +="<tr height=\"50px\">";
	html +="<td>일정내용</td>";
	html +="<td colspan=\"3\">"+CNTNT+"</td>";
	html +="</tr>";
	html+="</tbody>";
	html+="</table>";
	html+="</form>";
	
	makeTwoBtnPopup(3, "팝업제목", html, true, 700, 500, null, "삭제", function() {
		
		if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionFormSche").serialize();
			$.ajax({
				type : "post",//전송방식
				url : "DeleteAjax",//주소
				dataType : "json",//데이터형태
				data : params,//보낼데이터
				success : function(res) {//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
					console.log(res);
					if (res.result == "success") {
						closePopup(3);
						newschdlReload();
					} else if (res.result == "fail") {
						 alret("삭제정보가 옳바르지않아요");
					} else {
						alert("삭제문제");
					}
				},
				error : function(request,status, error) {//실행중 에러 발생시
					console.log("text : "+ request.responseText);//반환텍스트
					console.log("error :"+ error);//에러ㄴㅐ용
				}
			});//ajax
		}
		
	}, "확인", function() {
		closePopup(3);
	});
}//GETONE1


//의견opn 내가 쓴거 불러오기, 남이 쓴거 불러오기(사원번호. 영업번호), cnt, 사원번호 비교했을때 나이면 오른쪽에 draw, 남이면 왼쪽에draw, 
$("#bopnBtn").on("click",function(){
	
	if ($.trim($("#opnCon").val()) == "") {
		alert("내용을 입력하여주세요");
	} else {
		var params = $("#actionFormopn").serialize();
		$.ajax({
			type : "post",	
			url : "obWriteAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.result == "success") {
					opnreloadList();
				} else {
					alret("오류가 발생하였습니다");
				}
			},error : function(request,status,error) {
				console.log("text : "+ request.responseText);
				console.log("error :"+ error);
			}
		});
									
	}
});

//의견end


//수정하나가져오기
$(".con_con").on("click", "#getOne" ,function(){

	$("#bsnsOpnNo").val($(this).attr("class"));
		console.log($("#bsnsOpnNo"))
		var params = $("#actionFormopn").serialize();
		
		$.ajax({
			type : "post",
			url : "getoneAjax",
			dataType : "json",
			data : params,
			success : function(res) {
				console.log(res);
				if (res.result == "success") {
					//해당 date가져오면 수정버튼을 누르면 
					getone(res.data);
					
					function getone(data) {

						var temp = data.CNTNT;
						console.log(temp);//해당내용

						var html = "";
						html +="<textarea class  =\"sizebottom_1\"  id=\"opnCon\" name =\"opnCon\" style=\"resize: none;\">" + temp +"</textarea>";
							
						$(".best").html(html);
						
					}
					$("#bopnBtn").attr("type", "hidden");//작성버튼은hide
					$("#rewriteBtn").attr("type", "button");//수정버튼은 보이게
					
				} else if (res.result == "fail") {
					alret("수정데이터에 문제");
				} else {
					alret("오류문제");
				}
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error :" + error);
			}
		});//ajax 
});//rewriteBtn 수정시 수정완료 버튼 클릭시
	
	//rewriteBtn 수정시 수정완료 버튼 클릭시
	$("#rewriteBtn").on("click",function() {
		if ($.trim($("#opnCon").val()) == "") {
			alert("내용을 입력하여주세요");
		} else {
			var params = $("#actionFormopn").serialize();
			$.ajax({
				type : "post",
				url : "obupdateAjax",
				dataType : "json",
				data : params,
				success : function(res) {
					console.log(res);
					if (res.result == "success") {
						/* location.href = "bsnsMngmnt"; */
						opnreloadList();
						
					} else {
						alret("오류가 발생하였습니다");
					}
				},
				error : function(request, status, error) {
					console.log("text : " + request.responseText);
					console.log("error :"+ error);
				}
			});
		}
	});
	
	
	
	//opnreloadList();
	function opnreloadList() {
	var params = $("#actionFormopn").serialize();

	$.ajax({
		type : "post",
		url : "oBlistAjax",
		dataType : "json",
		data : params,//보낼데이터
		success : function(res) {
			if (res.result == "success") {
				opnredrawList(res.list);
				
			} else {
				alert("조회중문제가 발생");
			}
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error :" + error);
		}
	});
}
	//opnredrawList
	function opnredrawList(list) {
		//의견LIST불러오기
		if (list.length == 0) {
			var html = "";
			
			html += "<조회결과가없음>";
			$(".silmscroll").html(html);
			//list는 배열같이 쓸수있음
		} else {
			
			var html = "";
			
			for (var i = 0; i < list.length; i++) {
				if ("${sEmplyNo}" == list[i].EMPLY_NO){
				html += "<input type =\"hidden\" value =" + list[i].BSNS_OPN_NO + " id=\"bsnsOpnNo\"  name =\"bsnsOpnNo\"/>"; 
				
				html += "<div class =\"dat2\" id =\"table\">"; 
				//내가 쓴건 오른쪽으로 
				html += "<div class =\"dat1\">";
				html += "		<div class =\"dat1-2\">";
				html += "			<div class =\"dat1-3\" id =\"dat\">"; 
				html += "<input type =\"button\" value =\"수정하기\" id=\"getOne\" name =\"getOne\" class=\"" + list[i].BSNS_OPN_NO + "\"/>";
				html += "<input type =\"button\" value =\"삭제\" id=\"deleteBtn\" name =\"deleteBtn\" class=\"" + list[i].BSNS_OPN_NO + "\"/>";
				html += "</div>";
				html +="			<div class =\"dat1-3\">"+list[i].RDT+"</div>";
				html +="			<div class =\"dat1-4\">"+ list[i].EMPLY_NAME+"</div>";
				html +="			<div class  =\"text13\">" +list[i].CNTNT+"</div>";
				html +="		</div>";
				html +="</div>";
				html +="</div>";
				scrollDown();
				}else {
					
					console.log("${sEmplyNo}");
					 html += "<input type =\"hidden\" value =" + list[i].BSNS_OPN_NO + " id=\"bsnsOpnNo\"  name =\"bsnsOpnNo\"/>"; 
					html += "	<div class =\"dat\">";
					html += "	<div class =\"dat1\">"
					html += "		<div class =\"dat1-1\"><input type=\"image\" class =\"inmu\" src=\"resources/images/sales/inmu.png\"/></div>";
					html += "		<div class =\"dat1-2\">";
					html += "			<div>"+ list[i].EMPLY_NAME+"</div>";
					html += "			<div class= \"text12\">" +list[i].CNTNT+ "</div>";
					html += "		<div class =\"dat1-3\"> "+list[i].RDT+ "</div>";
					html += "		</div>";
					html += "</div>";
					html += "	</div>";
					scrollDown();
				}
				
			}
			
			$(".silmscroll").html(html);
			
			function scrollDown(){
				$(".curRoomBody").animate({
					scrollTop : $(".curRoomBody").prop("scrollHeight")
				}, 'slow', function(){
				});					
				}
			}
		}//opnredrawList
	
	//삭제
	$(".con_con").on("click", "#deleteBtn" ,function(){
		
			 $("#bsnsOpnNo").val($(this).attr("class"));  
			 console.log($("#bsnsOpnNo"))	
					
			var params = $("#actionFormopn").serialize();
					$.ajax({
						type : "post",
						url : "obDeleteAjax",
						dataType : "json", 
						data : params,
						success : function(res) { 
							console.log(res);
							if (res.result == "success") {
								alert("삭제성공");
								opnreloadList();
								/* location.reload(); */
							} else if (res.result == "fail") {
								 alret("삭제정보가 옳바르지않아요");
							} else {
								alert("삭제문제");
							}
						},
						error : function(request,status, error) {
							console.log("text : "+ request.responseText);
							console.log("error :"+ error);
						}
					});//ajax
		});//deleteBtn

		
		
		
		
		
		
		
		//수주선택시 확인 그리고 삭제
		$(".tableSuggestOrder tbody ").on("click",  "tr" ,function(){
		
		 $("#itemNo").val($(this).attr("name")); 
		 
		var params = $("#actionFormItemtableorder").serialize();
		
		$.ajax({
			type : "post",//전송방식
			url : "getOrderItemlAjax",//주소
			dataType : "json",//데이터형태
			data : params,//보낼데이터
			success : function(res) {//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
				console.log(res);
				if (res.result == "success") {
					getoneorder(res.data);
				}else if (res.result == "fail") {
					alret("수정데이터에 문제");
				} else {
					alret("오류문제");
				}
			},
			error : function(request, status, error) {//실행중 에러 발생시
				console.log("text : " + request.responseText);//반환텍스트
				console.log("error :" + error);//에러ㄴㅐ용
			}
		});//ajax
	});//END


	function getoneorder(data) {

		var ITEM_NO = data.ITEM_NO;
		var ITEM_NAME = data.ITEM_NAME;
		var COST = data.COST;
		var QNTY = data.QNTY;
		

		var html = "";
		html +="<form action=\"#\" id=\"actionFormitem2\" method =\"post\">";
		html +="<input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";
		html +="<input type=\"hidden\" name=\"itemNo\" id =\"itemNo\" value=\"" + ITEM_NO + "\">";
		html +="<input type=\"hidden\" name=\"sgstnNo\" id =\"sgstnNO\" value=\"${data.SGSTN_NO}\">";
		html += "<input type=\"hidden\" name=\"sEmplyNo\" id=\"sEmplyNo\" value=\"${sEmplyNo}\">";
		html+="<table  cellspacing =\"0\" id =\"vvvv\">";
		html+="<colgroup>";
		html+="<col width=\"150px\"/>";
		html+="<col width=\"350px\"/>";
		html+="<col width=\"150px\"/>";
		html+="<col width=\"350px\"/>";
		html+="</colgroup>";
		html+="<tbody>";
		html+="<tr height=\"50px\">";	
		html+="<td>품목번호</td>";
		html+="<td>"+ITEM_NO+"</td>";
		html+="<td>품목이름</td>";
		html+="<td>"+ITEM_NAME+"</td>";
		html+="</tr>";
		html+="<tr height=\"50px\">";	
		html+="<td>가격</td>";
		html+="<td>"+COST+"</td>";
		html+="<td>수량</td>";
		html+="<td>"+QNTY+"</td>";
		html+="</tr>";
		html+="</tbody>";
		html+="</table>";
		html+="</form>";
		
		makeTwoBtnPopup(3, "품목", html, true, 700, 500, null, "삭제", function() {
			
			if(confirm("삭제하시겠습니까?")) {
				var params = $("#actionFormitem2").serialize();
				$.ajax({
					type : "post",//전송방식
					url : "DeleteorderItemAjax",//주소
					dataType : "json",//데이터형태
					data : params,//보낼데이터
					success : function(res) {//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
						console.log(res);
						if (res.result == "success") {
							closePopup(3);
							itemsListorder();
							location.reload();
						} else if (res.result == "fail") {
							 alret("삭제정보가 옳바르지않아요");
						} else {
							alert("삭제문제");
						}
					},
					error : function(request,status, error) {//실행중 에러 발생시
						console.log("text : "+ request.responseText);//반환텍스트
						console.log("error :"+ error);//에러ㄴㅐ용
					}
				});//ajax
			}
			
		}, "확인", function() {
			closePopup(3);
		});
	}//GETONE1	
		
		//협상선택시 확인 그리고 삭제
		$(".tableSuggestNgtn tbody ").on("click",  "tr" ,function(){
		
		 $("#itemNo").val($(this).attr("name")); 
		
		var params = $("#actionFormItemtablengtn").serialize();
		
		$.ajax({
			type : "post",//전송방식
			url : "getNgtnItemlAjax",//주소
			dataType : "json",//데이터형태
			data : params,//보낼데이터
			success : function(res) {//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
				console.log(res);
				if (res.result == "success") {
					getonengtn(res.data);
				}else if (res.result == "fail") {
					alret("수정데이터에 문제");
				} else {
					alret("오류문제");
				}
			},
			error : function(request, status, error) {//실행중 에러 발생시
				console.log("text : " + request.responseText);//반환텍스트
				console.log("error :" + error);//에러ㄴㅐ용
			}
		});//ajax
	});//END


	function getonengtn(data) {

		var ITEM_NO = data.ITEM_NO;
		var ITEM_NAME = data.ITEM_NAME;
		var NGTN_COST = data.NGTN_COST;
		var NGTN_QNTY = data.NGTN_QNTY;
		

		var html = "";
		html +="<form action=\"#\" id=\"actionFormitem2\" method =\"post\">";
		html +="<input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";
		html +="<input type=\"hidden\" name=\"itemNo\" id =\"itemNo\" value=\"" + ITEM_NO + "\">";
		html +="<input type=\"hidden\" name=\"sgstnNo\" id =\"sgstnNO\" value=\"${data.SGSTN_NO}\">";
		html += "<input type=\"hidden\" name=\"sEmplyNo\" id=\"sEmplyNo\" value=\"${sEmplyNo}\">";
		html+="<table  cellspacing =\"0\" id =\"vvvv\">";
		html+="<colgroup>";
		html+="<col width=\"150px\"/>";
		html+="<col width=\"350px\"/>";
		html+="<col width=\"150px\"/>";
		html+="<col width=\"350px\"/>";
		html+="</colgroup>";
		html+="<tbody>";
		html+="<tr height=\"50px\">";	
		html+="<td>품목번호</td>";
		html+="<td>"+ITEM_NO+"</td>";
		html+="<td>품목이름</td>";
		html+="<td>"+ITEM_NAME+"</td>";
		html+="</tr>";
		html+="<tr height=\"50px\">";	
		html+="<td>협상가격</td>";
		html+="<td>"+NGTN_COST+"</td>";
		html+="<td>협상수량</td>";
		html+="<td>"+NGTN_QNTY+"</td>";
		html+="</tr>";
		html+="</tbody>";
		html+="</table>";
		html+="</form>";
		
		makeTwoBtnPopup(3, "품목", html, true, 700, 500, null, "삭제", function() {
			
			if(confirm("삭제하시겠습니까?")) {
				var params = $("#actionFormitem2").serialize();
				$.ajax({
					type : "post",//전송방식
					url : "DeletengtnItemAjax",//주소
					dataType : "json",//데이터형태
					data : params,//보낼데이터
					success : function(res) {//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
						console.log(res);
						if (res.result == "success") {
							closePopup(3);
							itemsListngtn();
							location.reload();
						} else if (res.result == "fail") {
							 alret("삭제정보가 옳바르지않아요");
						} else {
							alert("삭제문제");
						}
					},
					error : function(request,status, error) {//실행중 에러 발생시
						console.log("text : "+ request.responseText);//반환텍스트
						console.log("error :"+ error);//에러ㄴㅐ용
					}
				});//ajax
			}
			
		}, "확인", function() {
			closePopup(3);
		});
	}//GETONE1	
		
		
		
		
		
		
		
		//품목선택시게 확인 그리고 삭제
	$(".tableSuggestSgstn tbody ").on("click",  "tr" ,function(){
		
		 $("#itemNo").val($(this).attr("name")); 
		
		var params = $("#actionFormItemtablesgstn").serialize();
		
		$.ajax({
			type : "post",//전송방식
			url : "getSgstnItemlAjax",//주소
			dataType : "json",//데이터형태
			data : params,//보낼데이터
			success : function(res) {//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
				console.log(res);
				if (res.result == "success") {
					getonesgstn(res.data);
				}else if (res.result == "fail") {
					alret("수정데이터에 문제");
				} else {
					alret("오류문제");
				}
			},
			error : function(request, status, error) {//실행중 에러 발생시
				console.log("text : " + request.responseText);//반환텍스트
				console.log("error :" + error);//에러ㄴㅐ용
			}
		});//ajax
	});//END


	function getonesgstn(data) {

		var ITEM_NO = data.ITEM_NO;
		var ITEM_NAME = data.ITEM_NAME;
		var SGSTN_COST = data.SGSTN_COST;
		var SGSTN_QNTY = data.SGSTN_QNTY;
		

		var html = "";
		html +="<form action=\"#\" id=\"actionFormitem2\" method =\"post\">";
		html +="<input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";
		html +="<input type=\"hidden\" name=\"itemNo\" id =\"itemNo\" value=\"" + ITEM_NO + "\">";
		html +="<input type=\"hidden\" name=\"sgstnNo\" id =\"sgstnNO\" value=\"${data.SGSTN_NO}\">";
		html += "<input type=\"hidden\" name=\"sEmplyNo\" id=\"sEmplyNo\" value=\"${sEmplyNo}\">";
		html+="<table  cellspacing =\"0\" id =\"vvvv\">";
		html+="<colgroup>";
		html+="<col width=\"150px\"/>";
		html+="<col width=\"350px\"/>";
		html+="<col width=\"150px\"/>";
		html+="<col width=\"350px\"/>";
		html+="</colgroup>";
		html+="<tbody>";
		html+="<tr height=\"50px\">";	
		html+="<td>품목번호</td>";
		html+="<td>"+ITEM_NO+"</td>";
		html+="<td>품목이름</td>";
		html+="<td>"+ITEM_NAME+"</td>";
		html+="</tr>";
		html+="<tr height=\"50px\">";	
		html+="<td>제안가격</td>";
		html+="<td>"+SGSTN_COST+"</td>";
		html+="<td>제안수량</td>";
		html+="<td>"+SGSTN_QNTY+"</td>";
		html+="</tr>";
		html+="</tbody>";
		html+="</table>";
		html+="</form>";
		
		makeTwoBtnPopup(3, "품목", html, true, 700, 500, null, "삭제", function() {
			
			if(confirm("삭제하시겠습니까?")) {
				var params = $("#actionFormitem2").serialize();
				$.ajax({
					type : "post",//전송방식
					url : "DeletesgstnItemAjax",//주소
					dataType : "json",//데이터형태
					data : params,//보낼데이터
					success : function(res) {//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
						console.log(res);
						if (res.result == "success") {
							closePopup(3);
							itemsListsgstn();
							location.reload();
						} else if (res.result == "fail") {
							 alret("삭제정보가 옳바르지않아요");
						} else {
							alert("삭제문제");
						}
					},
					error : function(request,status, error) {//실행중 에러 발생시
						console.log("text : "+ request.responseText);//반환텍스트
						console.log("error :"+ error);//에러ㄴㅐ용
					}
				});//ajax
			}
			
		}, "확인", function() {
			closePopup(3);
		});
	}//GETONE1		

		
		
		
		
		
		
		
		
		
		
		
		
//수주품목item조회후 추가
$("#suggestorder").on("click",function(){
		 
			var html ="";
			html+="<form action=\"#\" id=\"actionFormitem2\" method =\"post\">";
			html +=" <input type=\"hidden\" name=\"bsnsState\" id=\"bsnsState\" value=\"${data.BSNS_STATE}\" />";
			html +=" <input type=\"hidden\" name=\"chncNo\" id=\"chncNo\" value=\"${data.CHNC_NO}\" />";
			html +=" <input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value=\"${data2.SGSTN_NO}\" />";
		 	html +=" <input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value=\"${data3.NGTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"orderNo\" id=\"orderNo\" value=\"${data4.ORDER_NO}\" />"; 
			html +=" <input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";	
			/* html +=" <input type=\"hidden\" name=\"itemNo\" id =\"itemNo\" value=\"${data.ITEM_NO}\">"; */
			html+="<table  cellspacing =\"0\">";
			html+="<colgroup>";
			html+="<col width=\"100px\"/>";
			html+="<col width=\"350px\"/>";
			html+="<col width=\"100px\"/>";
			html+="<col width=\"350px\"/>";
			html+="</colgroup>";
			html+="<tbody>"; 
			html+="<tr height=\"50px\">";	
			html+="<td>품목번호</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"itemNo\" id =\"itemNo\"  /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
			html+="<td>품목명</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"itemName\" id =\"itemName\"  /></td>";
			html+="</tr>";
			html+="<tr height=\"50px\">";
			html+="<td>단가</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"Cost\"  id =\"Cost\"/></td>";
			html+="<td>수량</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"Quty\" id =\"Quty\" /></td>";
			html+="</tr>";
			html+="</tbody>";
			html+="</table>";
			html+="</form>";
		 
			makeTwoBtnPopup(1, "수주품목등록", html, true, 800, 500, function(){
		 
				$("#rhror").on("click",function(){
		 
		 Load();//제안품목LIST
			var html ="";
			html+="<form action=\"#\" id=\"actionFormitem\" >";
			html +=" <input type=\"hidden\" name=\"bsnsState\" id=\"bsnsState\" value=\"${data.BSNS_STATE}\" />";
			html +=" <input type=\"hidden\" name=\"chncNo\" id=\"chncNo\" value=\"${data.CHNC_NO}\" />";
			html +=" <input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value=\"${data2.SGSTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value=\"${data3.NGTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"orderNo\" id=\"orderNo\" value=\"${data4.ORDER_NO}\" />";
			html +=" <input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";	
			html += "<div class =\"silmscroll2\" id=\"silmscroll\" name =\"silmscroll\">";
			html +=" <table class=\"board\" id=\"suggesttable\">";
			html +=" <input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";	
			html +=" <input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value=\"${data2.SGSTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value=\"${data3.NGTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"orderNo\" id=\"orderNo\" value=\"${data4.ORDER_NO}\" />";
			html +="<colgroup>";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="</colgroup>";
			html +="<thead>";
			html +="<tr name =\"name\" id =\"name\">";
			html +="<td>NO</td>";
			html +="<td>품목명</td>";
			html +="<td>기준단가</td>";
			html +="<td>등록일</td>";
			html +="<td>삭제일</td>";
			html +="</tr>";
			html +="</thead>";
			html +="<tbody>";
			html +="</tbody>";
			html +="</table>";
			html+= "</div>";
			html += "<div class=\"paging\">";
			html += "</div>";
			html+="</form>";
			makeOneBtnPopup(2, "품목선택", html, true, 800, 800, function() {
				 Load();//제안품목LIST	
					$("#suggesttable tbody").on("click","tr", function() {
						
						//팝업창에 나타나는 것
					
						
						$("#Cost").val($(this).children().eq(2).html());
						$("#itemNo").val($(this).children().eq(0).html());
						$("#itemName").val($(this).children().eq(1).html());
						closePopup(2);
					});
				 
							}, "취소", function() {
								closePopup(2);
				 			}); 
				
					});
			}, "저장", function() {
				//Ajax저장버튼 누를때
				
				if($.trim($("#itemNo").val()) == ""){
					alert("아이템을 입력하여주세요");
				} else if ($.trim($("#itemName").val())== ""){
					alert("아이템이름을 입력하여주세요");
				}else if ($.trim($("#Cost").val())== ""){
					alert("단가을 입력하여주세요");
				}else if ($.trim($("#Quty").val())== ""){
					alert("수량을 입력하여주세요");
				} else{
			
					var params = $("#actionFormitem2").serialize();
					console.log(params);
					$.ajax({
						type : "post",
						url : "itemorderAjax",//제안품목저장후에 아이템TABLE
						dataType : "json",
						data : params,
						success : function(res){
							console.log("액션폼2의 res: " + res);
							closePopup(1);
						if(res.result == "success"){  
							//제안품목저장하고 내가 저장한 영업 제안품목itemsList
	 							itemsListorder();
								closePopup(1);
						}else {
							alret("오류가 발생하였습니다");
						}
						},
						error : function(request, status, error){
							console.log("text : " + request.responseText);
							console.log("error :" + error);
						}
					});
					}
			}, "닫기", function() {		
				location.reload();
				closePopup(1);
			});
	}); //제품선택저장
		
		
		
		
		
//협상품목item조회후 추가
$("#suggestngtn").on("click",function(){
		 
			var html ="";
			html+="<form action=\"#\" id=\"actionFormitem2\" method =\"post\">";
			html +=" <input type=\"hidden\" name=\"bsnsState\" id=\"bsnsState\" value=\"${data.BSNS_STATE}\" />";
			html +=" <input type=\"hidden\" name=\"chncNo\" id=\"chncNo\" value=\"${data.CHNC_NO}\" />";
			html +=" <input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value=\"${data2.SGSTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value=\"${data3.NGTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"orderNo\" id=\"orderNo\" value=\"${data4.ORDER_NO}\" />";
			html +=" <input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";	
			/* html +=" <input type=\"hidden\" name=\"itemNo\" id =\"itemNo\" value=\"${data.ITEM_NO}\">"; */
			html+="<table  cellspacing =\"0\">";
			
			html+="<colgroup>";
			html+="<col width=\"100px\"/>";
			html+="<col width=\"350px\"/>";
			html+="<col width=\"100px\"/>";
			html+="<col width=\"350px\"/>";
			html+="</colgroup>";
			html+="<tbody>"; 
			html+="<tr height=\"50px\">";	
			html+="<td>품목번호</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"itemNo\" id =\"itemNo\"  /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
			html+="<td>품목명</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"itemName\" id =\"itemName\" /></td>";
			html+="</tr>";
			html+="<tr height=\"50px\">";
			html+="<td>협상단가</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"ngtnCost\"  id =\"ngtnCost\"/></td>";
			html+="<td>협상수량</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"ngtnQuty\" id =\"ngtnQuty\" /></td>";
			html+="</tr>";
			html+="</tbody>";
			html+="</table>";
			html+="</form>";
		 
			makeTwoBtnPopup(1, "협상품목등록", html, true, 800, 500, function(){
		 
				$("#rhror").on("click",function(){
		 
		 Load();
		 
			
			var html ="";
			html+="<form action=\"#\" id=\"actionFormitem\">";
			html +=" <input type=\"hidden\" name=\"bsnsState\" id=\"bsnsState\" value=\"${data.BSNS_STATE}\" />";
			html +=" <input type=\"hidden\" name=\"chncNo\" id=\"chncNo\" value=\"${data.CHNC_NO}\" />";
			html +=" <input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value=\"${data2.SGSTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value=\"${data3.NGTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"orderNo\" id=\"orderNo\" value=\"${data4.ORDER_NO}\" />";
			html +=" <input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";	
			html += "<div class =\"silmscroll2\" id=\"silmscroll\" name =\"silmscroll\">";
			html +=" <table class=\"board\" id=\"suggesttable\">";
			html +=" <input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";	
			html +=" <input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value=\"${data2.SGSTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value=\"${data3.NGTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"orderNo\" id=\"orderNo\" value=\"${data4.ORDER_NO}\" />";
			html +="<colgroup>";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="</colgroup>";
			html +="<thead>";
			html +="<tr name =\"name\" id =\"name\">";
			html +="<td>NO</td>";
			html +="<td>품목명</td>";
			html +="<td>기준단가</td>";
			html +="<td>등록일</td>";
			html +="<td>삭제일</td>";
			html +="</tr>";
			html +="</thead>";
			html +="<tbody>";
			html +="</tbody>";
			html +="</table>";
			html+= "</div>";
			html += "<div class=\"paging\">";
			html += "</div>";
			html+="</form>";
			makeOneBtnPopup(2, "품목선택", html, true, 800, 800, function() {
				 Load();
					$("#suggesttable tbody").on("click","tr", function() {
						
						//팝업창에 나타나는 것
						$("#itemName").val($(this).children().eq(1).html());
						/* $("#itemName").val($(this).attr("name")); */
						$("#itemNo").val($(this).attr("name"));
						$("#ngtnCost").val($(this).children().eq(2).html());
					/* 	$("#itemNo").val($(this).children().eq(0).html()); */
						$("#itemNo").val($(this).children().eq(0).html());
						closePopup(2);
					});
				 
							}, "취소", function() {
								closePopup(2);
				 			}); 
				
					});
			}, "저장", function() {
				//Ajax저장버튼 누를때
				
				if($.trim($("#itemNo").val()) == ""){
					alert("아이템을 입력하여주세요");
				} else if ($.trim($("#itemName").val())== ""){
					alert("아이템이름을 입력하여주세요");
				}else if ($.trim($("#ngtnCost").val())== ""){
					alert("협상단가을 입력하여주세요");
				}else if ($.trim($("#ngtnQuty").val())== ""){
					alert("협상수량을 입력하여주세요");
				} else{
			
					var params = $("#actionFormitem2").serialize();
					console.log(params);
					$.ajax({
						type : "post",
						url : "itemngtnAjax",//제안품목저장후에 아이템TABLE
						dataType : "json",
						data : params,
						success : function(res){
							console.log("액션폼2의 res: " + res);
							closePopup(1);
						if(res.result == "success"){  
							//제안품목저장하고 내가 저장한 영업 제안품목itemsList
	 							itemsListngtn();
								closePopup(1);
						}else {
							alret("오류가 발생하였습니다");
						}
						},
						error : function(request, status, error){
							console.log("text : " + request.responseText);
							console.log("error :" + error);
						}
					});
					}
			}, "닫기", function() {		
				location.reload();
				closePopup(1);
			});
	}); //제품선택저장
		
		
		
		
		
 //제안품목item조회후 추가
	 $("#suggest").on("click",function(){
		 
			var html ="";
			html+="<form action=\"#\" id=\"actionFormitem2\" method =\"post\">";
			html +=" <input type=\"hidden\" name=\"bsnsState\" id=\"bsnsState\" value=\"${data.BSNS_STATE}\" />";
			html +=" <input type=\"hidden\" name=\"chncNo\" id=\"chncNo\" value=\"${data.CHNC_NO}\" />";
			html +=" <input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value=\"${data2.SGSTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value=\"${data3.NGTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"orderNo\" id=\"orderNo\" value=\"${data4.ORDER_NO}\" />";
			html +=" <input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";	
			/* html +=" <input type=\"hidden\" name=\"itemNo\" id =\"itemNo\" value=\"${data.ITEM_NO}\">"; */
			
			html+="<table  cellspacing =\"0\">";
			html+="<colgroup>";
			html+="<col width=\"100px\"/>";
			html+="<col width=\"350px\"/>";
			html+="<col width=\"100px\"/>";
			html+="<col width=\"350px\"/>";
			html+="</colgroup>";
			html+="<tbody>"; 
			html+="<tr height=\"50px\">";	
			html+="<td>품목번호</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"itemNo\" id =\"itemNo\"  /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
			html+="<td>품목명</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"itemName\" id =\"itemName\" /></td>";
			html+="</tr>";
			html+="<tr height=\"50px\">";
			html+="<td>제안단가</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"sgstnCost\"  id =\"sgstnCost\"/></td>";
			html+="<td>제안수량</td>";
			html+="<td><input type= \"text\" class =\"text1\" name =\"sgstnQnty\" id =\"sgstnQnty\" /></td>";
			html+="</tr>";
			html+="</tbody>";
			html+="</table>";
			html+="</form>";
		 
			makeTwoBtnPopup(1, "품목등록", html, true, 800, 500, function(){
		 
				$("#rhror").on("click",function(){
		 
		 Load();
			var html ="";
			html+="<form action=\"#\" id=\"actionFormitem\" method =\"post\">";
			html +=" <input type=\"hidden\" name=\"bsnsState\" id=\"bsnsState\" value=\"${data.BSNS_STATE}\" />";
			html +=" <input type=\"hidden\" name=\"chncNo\" id=\"chncNo\" value=\"${data.CHNC_NO}\" />";
			html +=" <input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value=\"${data2.SGSTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value=\"${data3.NGTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"orderNo\" id=\"orderNo\" value=\"${data4.ORDER_NO}\" />";
			html +=" <input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";	
			html += "<div class =\"silmscroll2\" id=\"silmscroll\" name =\"silmscroll\">";
			html +=" <table class=\"board\" id=\"suggesttable\">";
			html +=" <input type=\"hidden\" name=\"bsnsNo\" id =\"bsnsNo\" value=\"${data.BSNS_NO}\">";	
			html +=" <input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value=\"${data2.SGSTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value=\"${data3.NGTN_NO}\" />";
			html +=" <input type=\"hidden\" name=\"orderNo\" id=\"orderNo\" value=\"${data4.ORDER_NO}\" />";
			html +="<colgroup>";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="<col width=\"100px\" />";
			html +="</colgroup>";
			html +="<thead>";
			html +="<tr name =\"name\" id =\"name\">";
			html +="<td>NO</td>";
			html +="<td>품목명</td>";
			html +="<td>기준단가</td>";
			html +="<td>등록일</td>";
			html +="<td>삭제일</td>";
			html +="</tr>";
			html +="</thead>";
			html +="<tbody>";
			html +="</tbody>";
			html +="</table>";
			html+= "</div>";
			html += "<div class=\"paging\">";
			html += "</div>";
			html+="</form>";
			makeOneBtnPopup(2, "품목선택", html, true, 800, 800, function() {
				 Load();//제안품목LIST	
					$("#suggesttable tbody").on("click","tr", function() {
						
						//팝업창에 나타나는 것
					
						
						$("#sgstnCost").val($(this).children().eq(2).html());
						$("#itemNo").val($(this).children().eq(0).html());
						$("#itemName").val($(this).children().eq(1).html());
						closePopup(2);
					});
				 
							}, "취소", function() {
								closePopup(2);
				 			}); 
				
					});
			}, "저장", function() {
				//Ajax저장버튼 누를때
				
				if($.trim($("#itemNo").val()) == ""){
					alert("아이템을 입력하여주세요");
				} else if ($.trim($("#itemName").val())== ""){
					alert("아이템이름을 입력하여주세요");
				}else if ($.trim($("#sgstnCost").val())== ""){
					alert("제안단가을 입력하여주세요");
				}else if ($.trim($("#sgstnQnty").val())== ""){
					alert("제안수량을 입력하여주세요");
				} else{
			
					var params = $("#actionFormitem2").serialize();
					console.log(params);
					$.ajax({
						type : "post",
						url : "itemsgstnAjax",//제안품목저장후에 아이템TABLE
						dataType : "json",
						data : params,
						success : function(res){
							console.log("액션폼2의 res: " + res);
							closePopup(1);
						if(res.result == "success"){  
							//제안품목저장하고 내가 저장한 영업 제안품목itemsList
	 							itemsListsgstn();
	 							
								closePopup(1);
						}else {
							alret("오류가 발생하였습니다");
						}
						},
						error : function(request, status, error){
							console.log("text : " + request.responseText);
							console.log("error :" + error);
						}
					});
					}
			}, "닫기", function() {		
				location.reload();
				closePopup(1);
			});
	}); //제품선택저장
	
	
	
	
	$(".paging").on("click", "div", function(){
		$("#page").val($(this).attr("name")); 
		reloadSalesList();
		itemsListorder();
	})
	
	$(".paging").on("click", "div", function(){
		$("#page").val($(this).attr("name")); 
		
		itemsListorder();
	})
	
	
	
function itemsListorder() {
		
		var params = $("#actionFormItemtableorder").serialize();
		
		$.ajax({
			type : "post",
			url : "newsuggestListAjax3",//선택한 아이템 list
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.result == "success") {
					itemcheckList3(res.list);
					itemcheckPaging3(res.pb);
				} else {
					alert("조회중문제가 발생");
				}
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error :" + error);
			}
		});
	}
	
	
	function itemcheckList3(checkList) {
		if (checkList.length == 0) {
			var html = "";
			html += "<tr>";
			html += "<td colspan =\"7\">조회결과가없음.</td>";
			html += "</tr>";
			$(".tableSuggestOrder tbody").html(html);
			
		} else {
			//수주의 상태이면 제안, 협상, 수주 품목이 다 보여야 함
			var html = "";
			for (var i = 0; i < checkList.length; i++) {
				
				html += "<tr name =\"" + checkList[i].ITEM_NO + "\">";
				html += "<th>" + checkList[i].ITEM_NO + "</td>";
				html += "<th>" + checkList[i].ITEM_NAME  + "</td>";
				html += "<th>" + checkList[i].COST + "</td>";
				html += "<th>" + checkList[i].QNTY + "</td>";
				html += "<th>" + checkList[i].RGSTRTN_DATE + "</td>";
				html += "</tr>";
			}
			
			$(".tableSuggestOrder tbody").html(html);
		} 
		
	}

	function itemcheckPaging3(pb){
		
		var html ="<div class=\"pagingD\" id=\"first\" name=\"1\"></div>&nbsp;";
		
			if($("#page").val()=="1"){
				html += "<div class=\"pagingD\" id=\"before\" name=\"1\"></div>&nbsp;";
			}else{
				html +="<div class=\"pagingD\" id=\"before\" name=\""+ ($("#page").val()* 1 - 1)+"\"></div>&nbsp;";
			}
			
			for(var i = pb.startPcount ; i <= pb.endPcount ; i++){
				if(i == $("#page").val()){
					html +="<div class=\"pagingD\" name=\"" + i + "\"><b>" + i + "</b></div>&nbsp;";
				}else{
					html +="<div class=\"pagingD\" name=\"" + i + "\">" + i + "</div>&nbsp;";
				}
			}
			
			if($("#page").val()== pb.maxPcount){
				html += "<div class=\"pagingD\" id=\"next\" name=\""+ pb.maxPcount + "\"></div>&nbsp;";
			}else{
				html +="<div class=\"pagingD\" id=\"next\" name=\"" + ($("#page").val()* 1 + 1)+"\"></div>&nbsp;";
			}
			
			html += "<div class=\"pagingD\" id=\"last\" name=\"" + pb.maxPcount + "\"></div>";
			
			$(".paging").html(html);
			
	}	
	
function itemsListngtn() {
		
		var params = $("#actionFormItemtablengtn").serialize();
		
		$.ajax({
			type : "post",
			url : "newsuggestListAjax2",//선택한 아이템 list
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.result == "success") {
					itemcheckList2(res.list);
					itemcheckPaging2(res.pb);
				} else {
					alert("조회중문제가 발생");
				}
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error :" + error);
			}
		});
	}
	
	
	function itemcheckList2(checkList) {
		if (checkList.length == 0) {
			var html = "";
			html += "<tr>";
			html += "<td colspan =\"7\">조회결과가없음.</td>";
			html += "</tr>";
			$(".tableSuggestNgtn tbody").html(html);
			
		} else {
			//수주의 상태이면 제안, 협상, 수주 품목이 다 보여야 함
			var html = "";
			for (var i = 0; i < checkList.length; i++) {
				
				html += "<tr name =\"" + checkList[i].ITEM_NO + "\">";
				html += "<th>" + checkList[i].ITEM_NO + "</td>";
				html += "<th>" + checkList[i].ITEM_NAME  + "</td>";
				html += "<th>" + checkList[i].NGTN_COST + "</td>";
				html += "<th>" + checkList[i].NGTN_QNTY + "</td>";
				html += "<th>" + checkList[i].RGSTRTN_DATE + "</td>";
				html += "</tr>";
			}
			
			$(".tableSuggestNgtn tbody").html(html);
		} 
		
	}

	function itemcheckPaging2(pb){
		
		var html ="<div class=\"pagingD\" id=\"first\" name=\"1\"></div>&nbsp;";
		
			if($("#page").val()=="1"){
				html += "<div class=\"pagingD\" id=\"before\" name=\"1\"></div>&nbsp;";
			}else{
				html +="<div class=\"pagingD\" id=\"before\" name=\""+ ($("#page").val()* 1 - 1)+"\"></div>&nbsp;";
			}
			
			for(var i = pb.startPcount ; i <= pb.endPcount ; i++){
				if(i == $("#page").val()){
					html +="<div class=\"pagingD\" name=\"" + i + "\"><b>" + i + "</b></div>&nbsp;";
				}else{
					html +="<div class=\"pagingD\" name=\"" + i + "\">" + i + "</div>&nbsp;";
				}
			}
			
			if($("#page").val()== pb.maxPcount){
				html += "<div class=\"pagingD\" id=\"next\" name=\""+ pb.maxPcount + "\"></div>&nbsp;";
			}else{
				html +="<div class=\"pagingD\" id=\"next\" name=\"" + ($("#page").val()* 1 + 1)+"\"></div>&nbsp;";
			}
			
			html += "<div class=\"pagingD\" id=\"last\" name=\"" + pb.maxPcount + "\"></div>";
			
			$(".paging").html(html);
			
	}
	function itemsListsgstn() {
		
		var params = $("#actionFormItemtablesgstn").serialize();
		
		$.ajax({
			type : "post",
			url : "newsuggestListAjax",//선택한 아이템 list
			dataType : "json",
			data : params,
			success : function(res) {
				if (res.result == "success") {
					itemcheckList(res.list);
					itemchecksgstnPaging(res.pb);
				} else {
					alert("조회중문제가 발생");
				}
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error :" + error);
			}
		});
	}
	
	
	function itemcheckList(checkList) {
		if (checkList.length == 0) {
			var html = "";
			html += "<tr>";
			html += "<td colspan =\"7\">조회결과가없음.</td>";
			html += "</tr>";
			$(".tableSuggestSgstn tbody").html(html);
			
		} else {
			//수주의 상태이면 제안, 협상, 수주 품목이 다 보여야 함
			var html = "";
			for (var i = 0; i < checkList.length; i++) {
				
				html += "<tr name =\"" + checkList[i].ITEM_NO + "\">";
				html += "<th>" + checkList[i].ITEM_NO + "</td>";
				html += "<th>" + checkList[i].ITEM_NAME  + "</td>";
				html += "<th>" + checkList[i].SGSTN_COST + "</td>";
				html += "<th>" + checkList[i].SGSTN_QNTY + "</td>";
				html += "<th>" + checkList[i].RGSTRTN_DATE + "</td>";
				html += "</tr>";
			}
			
			$(".tableSuggestSgstn tbody").html(html);
		} 
		
	}

	function itemchecksgstnPaging(pb){
		
		var html ="<div class=\"pagingD\" id=\"first\" name=\"1\"></div>&nbsp;";
		
			if($("#page").val()=="1"){
				html += "<div class=\"pagingD\" id=\"before\" name=\"1\"></div>&nbsp;";
			}else{
				html +="<div class=\"pagingD\" id=\"before\" name=\""+ ($("#page").val()* 1 - 1)+"\"></div>&nbsp;";
			}
			
			for(var i = pb.startPcount ; i <= pb.endPcount ; i++){
				if(i == $("#page").val()){
					html +="<div class=\"pagingD\" name=\"" + i + "\"><b>" + i + "</b></div>&nbsp;";
				}else{
					html +="<div class=\"pagingD\" name=\"" + i + "\">" + i + "</div>&nbsp;";
				}
			}
			
			if($("#page").val()== pb.maxPcount){
				html += "<div class=\"pagingD\" id=\"next\" name=\""+ pb.maxPcount + "\"></div>&nbsp;";
			}else{
				html +="<div class=\"pagingD\" id=\"next\" name=\"" + ($("#page").val()* 1 + 1)+"\"></div>&nbsp;";
			}
			
			html += "<div class=\"pagingD\" id=\"last\" name=\"" + pb.maxPcount + "\"></div>";
			
			$(".paging").html(html);
			
	}
//김밥팝업
$(".pic").on("click",function(){
      $("#picFile").click();
   });//사진 업로드
   
   
   
   
	


///////////////////////////////////////////////////////////////////////////////////////////// 
//수주수정reBtn
$("#reBtn").on("click",function(){
		var html ="";
		html+="<form action=\"reBtn\" id=\"actionForm2\" method =\"post\">";
		html +="<input type=\"hidden\" name=\"bsnsNo\"  id =\"bsnsNo\" value=\"${param.bsnsNo}\">";
		html +="<input type=\"hidden\" name=\"cstmr_no\" id =\"cstmr_no\" value=\"${data4.CSTMR_NO}\">";
		html +="<input type=\"hidden\" name=\"order_no\" id =\"order_no\" value=\"${data4.ORDER_NO}\">";
		html +="<table cellspacing =\"0\">";
		html +="<colgroup>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="</colgroup>";
		html +="<tbody>";
		html +="<tr height=\"50px\">";
		html +="<td>영업명</td>";
		html +="<td colspan=\"3\"><input type= \"text\" class =\"text3\" name =\"bsns_name\" id =\"bsns_name\" value =\"${data4.BSNS_NAME}\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html+="<td>거래처담당자</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_name\" id =\"cstmr_name\" value = \"${data4.CSTMR_NAME}\"   /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
		html+="<td>거래처</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_cmpny_name\" id =\"cstmr_cmpny_name\" value =\"${data4.CSTMR_CMPNY_NAME}\" disabled/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>수주일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"order\" id =\"order\" value =\"${data4.ORDER_DATE}\"/></td>";
		html +="<td>계약완료일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"scs\" id =\"scs\" value=\"${data4.SCS_DATE}\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>내용</td>";
		html +="<td colspan=\"3\"><input type= \"text\" class =\"text4\" name =\"orderCntnt\" id=\"orderCntnt\" value=\"${data4.ORDER_CNTNT}\"/></td>";
		html +="</tr>";
		html +="</tbody>";
		html +="</table>";
		html+="</form>";
		makeTwoBtnPopup(1, "수주수정", html, true, 950, 600, function(){
			//버튼누를시
			$("#rhror").on("click",function(){
				var html2 ="";
				html2 +="<form action=\"#\" id=\"actionForm3\">"; 
				html2 +=" <input type=\"hidden\" name=\"cstmr_no\" id=\"cstmr_no\" />"
				html2 += "<div class=\"tbl1\">";
				html2 += "<select name=\"select\" id =\"select\" class=\"select\">";
				html2 += "<option value =\"0\">전체</option>";
				html2 += "<option value =\"1\">고객명</option>";
				html2 += "<option value =\"2\">고객사명</option>";
				html2 += "</select> ";
				html2 += "<input type=\"text\" class=\"select_txt\" name=\"search_cus\" ><input type=\"button\" value=\"검색\"class=\"searchBtn_cus\">";
				html2 += "<table class=\"board\" id=\"cstmrtable\">";
				html2 += "<colgroup>";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "</colgroup>";
				html2 += "<thead>";
				html2 += "<tr name =\"name\">";
				html2 += "<th class =\"CSTMR_NAME\" id =\"CSTMR_NAME\">고객명</th>";
				html2 += "<th>고객의 부서/직책</th>";
				html2 += "<th>연락처</th>";
				html2 += "<th>고객사명</th>";
				html2 += "</tr>";
				html2 += "</thead>";
				html2 += "<tbody>";
				html2 += "</tbody>";
				html2 += "</table>";
				html2 += "<div class=\"paging\">";
				html2 += "</div>";
				html2 += "</div>";
				html2 +="</form>";
				
				makeOneBtnPopup(2, "고객선택", html2, true, 900, 600, function() {
					//고객목록조회구현 
					 clientListLoad();
					//목록 클릭 시 고객  1번팝업에 넣기 + tr내용기반 1번팝업내용채우기 + 팝업닫기
					$("#cstmrtable tbody").on("click", "tr", function() {
						$("#actionForm2 #cstmr_no").val($(this).attr("name"));
						
						//actionForm2의 고객번호를--> 눌렀을때 값주기
					 console.log($(this).children().eq(0).html());
					console.log($(this).children().eq(1).html());
					console.log($(this).children().eq(2).html());	
						$("#cstmr_name").val($(this).children().eq(0).html());
						 $("#dprtmnt").val($(this).children().eq(1).html());
						$("#cstmr_cmpny_name").val($(this).children().eq(3).html());
						//cstmr_cmpny_name에 다가 html의 3번째값을 넣어주기
						closePopup(2);
					}); 
					
				}, "취소", function() {
					closePopup(2);
				}); 
			});

		}, "저장", function() {
			//Ajax저장버튼 누를때
			if($.trim($("#bsns_name").val()) == ""){
				alert("영업명을 입력하여주세요");
			}else if ($.trim($("#cstmr_name").val())== ""){
				alert("거래처담당자를 입력하여주세요");
			}else if ($.trim($("#cstmr_cmpny_name").val())== ""){
				alert("거래처을 입력하여주세요");
			}else if ($.trim($("#order").val())== ""){
				alert("수주일 입력하여주세요");
			}else if ($.trim($("#scs").val())== ""){
				alert("계약완료일 입력하여주세요");
			}else if ($.trim($("#orderCntnt").val())== ""){
				alert("내용을 입력하여주세요");
			}
			else{
				var params = $("#actionForm2").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "orderAjax",//수주수정
					dataType : "json",
					data : params,
					success : function(res){
						console.log("액션폼2의 res: " + res);
						closePopup(1);
					if(res.result == "success"){  
						makeAlert(1, "알림", "수정되었습니다.", true, function(){
							$("#backForm").submit();
						});
							location.reload();
							reloadSalesList();
							closePopup(1);
					}else {
						alret("오류가 발생하였습니다");
					}
					
					},
					error : function(request, status, error){
						console.log("text : " + request.responseText);
						console.log("error :" + error);
					}
				});
				}
		}, "닫기", function() {	
			location.reload();
			closePopup(1);
		});
});
//수주수정end


//수주등록write4
$("#write4").on("click",function(){
		var html ="";
		html +="<form action=\"#\" id=\"actionForm4\" >";
		html +="<input type=\"hidden\" name=\"bsnsNo\"  id =\"bsnsNo\" value=\"${param.bsnsNo}\">";
		html +="<input type=\"hidden\" name=\"orderNo\"  id =\"orderNo\" value=\"${data3.ORDER_NO}\">";
		html +="<input type=\"hidden\" name=\"cstmr_no\" id =\"cstmr_no\" value=\"${data3.CSTMR_NO}\">";
		html +="<table id =\"pt\" name =\"pt\" cellspacing =\"0\">";
		html +="<colgroup>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="</colgroup>";
		html +="<tbody>";
		html +="<tr name=\"bsnsNo\" id=\"bsnsNo\" height=\"50px\">";
		html +="<td>영업명</td>";
		html +="<td><input type= \"text\" class =\"text3\" name =\"bsns_name\" id =\"bsns_name\" value=\"${data.BSNS_NAME}\" disabled /></td>";
		html +="<td>수주등록일</td>";
		html +="<td>"+year+"년 "+ month +"월  "+date+"일 </td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>거래처담당자</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"cstmr_name\" id =\"cstmr_name\"value = \"${data.CSTMR_NAME}\" disabled /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
		html +="<td>거래처</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"cstmr_cmpny_name\" id =\"cstmr_cmpny_name\" value =\"${data.CSTNAME}\" disabled /></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>작성자(사원)</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"emply_name\" id =\"emply_name\" value=\"${sEmplyName}\" disabled /></td>";
		html +="<td>작성자부서</td>";
		html +="<td><input type= \"text\"  class=\"text1\" name =\"sDprtmntName\" id =\"sDprtmntName\" value =\"${sDprtmntName}\" disabled/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>수주일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"order\" id =\"order\"/></td>";
		html +="<td>계약완료일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"scs\" id =\"scs\" /></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>내용</td>";
		html +="<td colspan =\"3\"><input type= \"text\" class =\"text3\" name =\"orderCntnt\" id=\"orderCntnt\"/></td>";
		html +="</tr>";
		html +="</tbody>";
		html +="</table>";
		html +="</form>";
		makeTwoBtnPopup(1, "수주등록", html, true, 900, 600, function(){
			//버튼누를시
			$("#rhror").on("click",function(){
				/* $("#bsnNo").val("${param.bsnsNo}"); */
				var html2 ="";
		 	html2 +="<form action=\"#\" id=\"actionForm3\">"; 
				html2 +=" <input type=\"hidden\" name=\"cstmr_no\" id=\"cstmr_no\" />"
				html2 += "<div class=\"tbl1\">";
				html2 += "<select name=\"select\" id =\"select\" class=\"select\">";
				html2 += "<option value =\"0\">전체</option>";
				html2 += "<option value =\"1\">고객명</option>";
				html2 += "<option value =\"2\">고객사명</option>";
				html2 += "</select> ";
				html2 += "<input type=\"text\" class=\"select_txt\" name=\"search_cus\" ><input type=\"button\" value=\"검색\"class=\"searchBtn_cus\">";
				html2 += "<table class=\"board\" id=\"cstmrtable\">";
				html2 += "<colgroup>";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "</colgroup>";
				html2 += "<thead>";
				html2 += "<tr name =\"name\">";
				html2 += "<th class =\"CSTMR_NAME\" id =\"CSTMR_NAME\">고객명</th>";
				html2 += "<th>고객의 부서/직책</th>";
				html2 += "<th>연락처</th>";
				html2 += "<th>고객사명</th>";
				html2 += "</tr>";
				html2 += "</thead>";
				html2 += "<tbody>";
				html2 += "</tbody>";
				html2 += "</table>";
				html2 += "<div class=\"paging\">";
				html2 += "</div>";
				html2 += "</div>";
				html2 +="</form>";
				
				makeOneBtnPopup(2, "고객선택", html2, true, 900, 600, function() {
					//고객목록조회구현 
					 clientListLoad();
					
					//목록 클릭 시 고객  1번팝업에 넣기 + tr내용기반 1번팝업내용채우기 + 팝업닫기
					$("#cstmrtable tbody").on("click", "tr", function() {
					 console.log($(this).children().eq(0).html());
					console.log($(this).children().eq(1).html());
						$("#cstmr_name").val($(this).children().eq(0).html());
						$("#cstmr_cmpny_name").val($(this).children().eq(3).html());
						closePopup(2);
					}); 
				}, "취소", function() {
					closePopup(2);
				}); 
			});
		}, "저장", function() {
			//Ajax
			//저장버튼 누를때
			if($.trim($("#bsns_name").val()) == ""){
				alert("영업명을 입력하여주세요");
			}else if ($.trim($("#cstmr_name").val())== ""){
				alert("거래처담당자를 입력하여주세요");
			}else if ($.trim($("#cstmr_cmpny_name").val())== ""){
				alert("거래처를 입력하여주세요");
			}else if ($.trim($("#order").val())== ""){
				alert("수주일 입력하여주세요");
			}else if ($.trim($("#scs").val())== ""){
				alert("계약완료일 입력하여주세요");
			}else if ($.trim($("#orderCntnt").val())== ""){
				alert("내용 입력하여주세요");
			}
			else{
				var params = $("#actionForm4").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "order_Ajax",//수주등록
					dataType : "json",
					data : params,
					success : function(res){
					console.log("액션폼2의 res: " + res);
					if(res.result == "success"){  
						$("#page").val("1");
 						reloadSalesList();
 						location.reload();
 						closePopup(1);
					}else {
						alert("오류가 발생하였습니다");
					}		
					},
					error : function(request, status, error){
						console.log("text : " + request.responseText);
						console.log("error :" + error);
					}
				});
				
				}
		}, "닫기", function() {
			location.reload();
			closePopup(1);
		});
		
	});
//수주등록end


//협상등록write3
$("#write3").on("click",function(){
		var html ="";
		html +="<form action=\"#\" id=\"actionForm4\" method =\"post\">";
		html +="<input type=\"hidden\" name=\"bsnsNo\"  id =\"bsnsNo\" value=\"${param.bsnsNo}\">";
		html +="<input type=\"hidden\" name=\"cstmr_no\" id =\"cstmr_no\" value=\"${data.CSTMR_NO}\">";
		html+="<input type=\"hidden\" name=\"bsnsNo\" id=\"bsnsNo\" value =\"${param.bsnsNo}\" />"
		html+="<input type=\"hidden\" name=\"ngtnNo\" id=\"ngtnNo\" value =\"${data3.NGTN_NO}\" />"
		html +="<table id =\"pt\" name =\"pt\" cellspacing =\"0\">";
		html +="<colgroup>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="</colgroup>";
		html +="<tbody>";
		html +="<tr name=\"bsnsNo\" id=\"bsnsNo\" height=\"50px\">";
		html +="<td>영업명</td>";
		html +="<td><input type= \"text\" class =\"text3\" name =\"bsns_name\" id =\"bsns_name\" value=\"${data.BSNS_NAME}\" disabled /></td>";
		html +="<td>협상등록일(오늘)</td>";
		html +="<td>"+year+" 년 "+ month +" 월 "+date+" 일 </td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>거래처담당자</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"cstmr_name\" id =\"cstmr_name\"value = \"${data.CSTMR_NAME}\" disabled /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
		html +="<td>거래처</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"cstmr_cmpny_name\" id =\"cstmr_cmpny_name\" value =\"${data.CSTNAME}\" disabled /></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>요청일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"NgtnRqst\" id =\"NgtnRqst\"/></td>";
		html +="<td>마감일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"NgtnDln\" id =\"NgtnDln\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html+="<td>작성자(사원)</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"emply_name\" id =\"emply_name\" value='${sEmplyName}' disabled /></td>";
		html+="<td>작성자부서</td>";
		html+="<td><input type= \"text\"  class=\"text1\" name =\"sDprtmntName\" id =\"sDprtmntName\" value =\"${sDprtmntName}\" disabled/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>완료일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"Cmpltn\" id =\"Cmpltn\"/></td>";
		html +="<td>예상성공확률</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"NgtnExPro\" id =\"NgtnExPro\" /></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>내용</td>";
		html +="<td colspan =\"3\"><input type= \"text\" class =\"text3\" name =\"NgtnCntnt\" id=\"NgtnCntnt\"/></td>";
		html +="</tr>";
		html +="</tbody>";
		html +="</table>";
		html +="</form>";
		makeTwoBtnPopup(1, "협상등록", html, true, 900, 600, function(){
			//버튼누를시
			$("#rhror").on("click",function(){
				/* $("#bsnNo").val("${param.bsnsNo}"); */
				var html2 ="";
		 	html2 +="<form action=\"#\" id=\"actionForm3\">"; 
			
				html2 +=" <input type=\"hidden\" name=\"cstmr_no\" id=\"cstmr_no\" />"
				html2 += "<div class=\"tbl1\">";
				html2 += "<select name=\"select\" id =\"select\" class=\"select\">";
				html2 += "<option value =\"0\">전체</option>";
				html2 += "<option value =\"1\">고객명</option>";
				html2 += "<option value =\"2\">고객사명</option>";
				html2 += "</select> ";
				html2 += "<input type=\"text\" class=\"select_txt\" name=\"search_cus\" ><input type=\"button\" value=\"검색\"class=\"searchBtn_cus\">";
				html2 += "<table class=\"board\" id=\"cstmrtable\">";
				html2 += "<colgroup>";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "</colgroup>";
				html2 += "<thead>";
				html2 += "<tr name =\"name\">";
				html2 += "<th class =\"CSTMR_NAME\" id =\"CSTMR_NAME\">고객명</th>";
				html2 += "<th>고객의 부서/직책</th>";
				html2 += "<th>연락처</th>";
				html2 += "<th>고객사명</th>";
				html2 += "</tr>";
				html2 += "</thead>";
				html2 += "<tbody>";
				html2 += "</tbody>";
				html2 += "</table>";
				html2 += "<div class=\"paging\">";
				html2 += "</div>";
				html2 += "</div>";
				html2 +="</form>";
				makeOneBtnPopup(2, "고객선택", html2, true, 900, 600, function() {
					//고객목록조회구현 
					 clientListLoad();
					
					//목록 클릭 시 고객  1번팝업에 넣기 + tr내용기반 1번팝업내용채우기 + 팝업닫기
					$("#cstmrtable tbody").on("click", "tr", function() {
					 console.log($(this).children().eq(0).html());
					console.log($(this).children().eq(1).html());
						$("#cstmr_name").val($(this).children().eq(0).html());
						$("#cstmr_cmpny_name").val($(this).children().eq(3).html());
						closePopup(2);
					}); 
				}, "취소", function() {
					closePopup(2);
				}); 
			});
		}, "저장", function() {
			//Ajax
			//저장버튼 누를때
			$("#bsnNo").val("${param.bsnsNo}");
			if($.trim($("#bsns_name").val()) == ""){
				alert("영업명을 입력하여주세요");
			}else if ($.trim($("#cstmr_name").val())== ""){
				alert("거래처담당자를 입력하여주세요");
			}else if ($.trim($("#cstmr_cmpny_name").val())== ""){
				alert("거래처를 입력하여주세요");
			}else if ($.trim($("#NgtnRqst").val())== ""){
				alert("요청일을 입력하여주세요");
			}else if ($.trim($("#NgtnDln").val())== ""){
				alert("마감일을 입력하여주세요");
			}else if ($.trim($("#Cmpltn").val())== ""){
				alert("완료일 입력하여주세요");
			}else if ($.trim($("#NgtnExPro").val())== ""){
				alert("예상성공확률을 입력하여주세요");
			}else if ($.trim($("#NgtnCntnt").val())== ""){
				alert("내용을 입력하여주세요");
			}
			else{
				var params = $("#actionForm4").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "ngtn_Ajax",//협상등록
					dataType : "json",
					data : params,
					success : function(res){
					console.log("액션폼2의 res: " + res);
					if(res.result == "success"){  
						$("#page").val("1");
 						reloadSalesList();
 						location.reload();
 						closePopup(1);
					}else {
						alert("오류가 발생하였습니다");
					}		
					},
					error : function(request, status, error){
						console.log("text : " + request.responseText);
						console.log("error :" + error);
					}
				});
				
				}
		
		}, "닫기", function() {
			location.reload();
			closePopup(1);
		});
		
	});
//협상등록end

//협상수정update3
$("#update3").on("click",function(){
		var html ="";
		html+="<form action=\"update1\" id=\"actionForm2\" method =\"post\">";
		html +="<input type=\"hidden\" name=\"bsnsNo\" value=\"${param.bsnsNo}\">";
		html +="<input type=\"hidden\" name=\"cstmr_no\" id =\"cstmr_no\" value=\"${data.CSTMR_NO}\">";
		html +="<table cellspacing =\"0\">";
		html +="<colgroup>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="</colgroup>";
		html +="<tbody>";
		html +="<tr height=\"50px\">";
		html +="<td>영업명</td>";
		html +="<td colspan =\"3\"><input type= \"text\" class =\"text3\" name =\"bsns_name\" id =\"bsns_name\" value =\"${data3.BSNS_NAME}\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html+="<td>거래처담당자</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_name\" id =\"cstmr_name\" value = \"${data3.CSTMR_NAME}\"   /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
		html+="<td>거래처</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_cmpny_name\" id =\"cstmr_cmpny_name\" value =\"${data3.CSTNAME}\" disabled/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>완료일 </td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"cmpltn\" id =\"cmpltn\" value=\"${data3.CMPLTN}\"/></td>";
		html +="<td>요청일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"ngtnrqst\" id =\"ngtnrqst\" value =\"${data3.NGTNRQST}\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>마감일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"ngtndln\" id =\"ngtndln\" value =\"${data3.NGTNDLN}\"/></td>";
		html +="<td>예상성공확률</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"ngexpro\" id =\"ngexpro\" value=\"${data3.NGEXPRO }\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>내용</td>";
		html +="<td colspan =\"3\"><input type= \"text\" class =\"text4\" name =\"ngtnCntnt\" id=\"ngtnCntnt\" value=\"${data3.NGTN_CNTNT}\"/></td>";
		html +="</tr>";
		html +="</tbody>";
		html +="</table>";
		html+="</form>";
		makeTwoBtnPopup(1, "협상수정", html, true, 900, 600, function(){
			//버튼누를시
			$("#rhror").on("click",function(){
				var html2 ="";
				html2 +="<form action=\"#\" id=\"actionForm3\">"; 
				html2 +=" <input type=\"hidden\" name=\"cstmr_no\" id=\"cstmr_no\" />"
				html2 += "<div class=\"tbl1\">";
				html2 += "<select name=\"select\" id =\"select\" class=\"select\">";
				html2 += "<option value =\"0\">전체</option>";
				html2 += "<option value =\"1\">고객명</option>";
				html2 += "<option value =\"2\">고객사명</option>";
				html2 += "</select> ";
				html2 += "<input type=\"text\" class=\"select_txt\" name=\"search_cus\" ><input type=\"button\" value=\"검색\"class=\"searchBtn_cus\">";
				html2 += "<table class=\"board\" id=\"cstmrtable\">";
				html2 += "<colgroup>";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "</colgroup>";
				html2 += "<thead>";
				html2 += "<tr name =\"name\">";
				html2 += "<th class =\"CSTMR_NAME\" id =\"CSTMR_NAME\">고객명</th>";
				html2 += "<th>고객의 부서/직책</th>";
				html2 += "<th>연락처</th>";
				html2 += "<th>고객사명</th>";
				html2 += "</tr>";
				html2 += "</thead>";
				html2 += "<tbody>";
				html2 += "</tbody>";
				html2 += "</table>";
				html2 += "<div class=\"paging\">";
				html2 += "</div>";
				html2 += "</div>";
				html2 +="</form>";
				
				makeOneBtnPopup(2, "고객선택", html2, true, 900, 600, function() {
					//고객목록조회구현 
					 clientListLoad();
					//목록 클릭 시 고객  1번팝업에 넣기 + tr내용기반 1번팝업내용채우기 + 팝업닫기
					$("#cstmrtable tbody").on("click", "tr", function() {
						$("#actionForm2 #cstmr_no").val($(this).attr("name"));
						
						//actionForm2의 고객번호를--> 눌렀을때 값주기
					 console.log($(this).children().eq(0).html());
					console.log($(this).children().eq(1).html());
					console.log($(this).children().eq(2).html());	
						$("#cstmr_name").val($(this).children().eq(0).html());
						 $("#dprtmnt").val($(this).children().eq(1).html());
						$("#cstmr_cmpny_name").val($(this).children().eq(3).html());
						//cstmr_cmpny_name에 다가 html의 3번째값을 넣어주기
						closePopup(2);
					}); 
					
				}, "취소", function() {
					closePopup(2);
				}); 
			});
		}, "저장", function() {
			//Ajax저장버튼 누를때
			if($.trim($("#bsns_name").val()) == ""){
				alert("영업명을 입력하여주세요");
			}else if ($.trim($("#cstmr_name").val())== ""){
				alert("거래처담당자를 입력하여주세요");
			}else if ($.trim($("#cstmr_cmpny_name").val())== ""){
				alert("거래처을 입력하여주세요");
			}else if ($.trim($("#cmpltn").val())== ""){
				alert("완료일을 입력하여주세요");
			}else if ($.trim($("#ngtnrqst").val())== ""){
				alert("요청일을  입력하여주세요");
			}else if ($.trim($("#ngtndln").val())== ""){
				alert("마감일을 입력하여주세요");
			}else if ($.trim($("#ngexpro").val())== ""){
				alert("예상성공확률 입력하여주세요");
			}else if ($.trim($("#ngtnCntnt").val())== ""){
				alert("내용 입력하여주세요");
			}
			else{
				var params = $("#actionForm2").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "ngtnupdate_Ajax",//협상수정
					dataType : "json",
					data : params,
					success : function(res){
						console.log("액션폼2의 res: " + res);
						closePopup(1);
					if(res.result == "success"){  
						makeAlert(1, "알림", "수정되었습니다.", true, function(){
							$("#backForm").submit();
						});
							location.reload();
							reloadSalesList();
							closePopup(1);
					}else {
						alret("오류가 발생하였습니다");
					}
					
					},
					error : function(request, status, error){
						console.log("text : " + request.responseText);
						console.log("error :" + error);
					}
				});
				}
		}, "닫기", function() {		
			location.reload();
			closePopup(1);
		});

}); //협상수정end
//제안수정update2
$("#update2").on("click",function(){
		var html ="";
		html+="<form action=\"update1\" id=\"actionForm2\" method =\"post\">";
		html +="<input type=\"hidden\" name=\"bsnsNo\" value=\"${param.bsnsNo}\">";
		html +="<input type=\"hidden\" name=\"cstmr_no\" id =\"cstmr_no\" value=\"${data.CSTMR_NO}\">";
		html +="<table cellspacing =\"0\">";
		html +="<colgroup>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="</colgroup>";
		html +="<tbody>";
		html +="<tr height=\"50px\">";
		html +="<td>영업명</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"bsns_name\" id =\"bsns_name\" value =\"${data2.BSNS_NAME}\"/></td>";
		html +="<td>기타</td>";
		html +="<td><input type= \"text\" class =\"text3\" name =\"ancon\" id=\"ancon\" value =\"${data2.OTHERS}\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html+="<td>거래처담당자</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_name\" id =\"cstmr_name\" value = \"${data2.CSTMR_NAME}\"   /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
		html+="<td>거래처</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_cmpny_name\" id =\"cstmr_cmpny_name\" value =\"${data2.CSTNAME}\" disabled/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>요청일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"rqstDate\" id =\"rqstDate\" value =\"${data2.RDATE}\"/></td>";
		html +="<td>마감일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"end_date\" id =\"end_date\" value=\"${data2.EDATE}\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>예상성공확률</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"expctn_scs_prblty2\" id =\"expctn_scs_prblty2\" value=\"${data2.PR}\"/></td>";
		html +="<td>내용</td>";
		html +="<td><input type= \"text\" class =\"text1\"name =\"con\" id=\"con\" value=\"${data2.SGSTN_CNTNT}\"/></td>";
		html +="</tr>";
		html +="</tbody>";
		html +="</table>";
		html+="</form>";
		makeTwoBtnPopup(1, "제안수정", html, true, 900, 600, function(){
			//버튼누를시
			$("#rhror").on("click",function(){
				var html2 ="";
				html2 +="<form action=\"#\" id=\"actionForm3\">"; 
				html2 +=" <input type=\"hidden\" name=\"cstmr_no\" id=\"cstmr_no\" />"
				html2 += "<div class=\"tbl1\">";
				html2 += "<select name=\"select\" id =\"select\" class=\"select\">";
				html2 += "<option value =\"0\">전체</option>";
				html2 += "<option value =\"1\">고객명</option>";
				html2 += "<option value =\"2\">고객사명</option>";
				html2 += "</select> ";
				html2 += "<input type=\"text\" class=\"select_txt\" name=\"search_cus\" ><input type=\"button\" value=\"검색\"class=\"searchBtn_cus\">";
				html2 += "<table class=\"board\" id=\"cstmrtable\">";
				html2 += "<colgroup>";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "</colgroup>";
				html2 += "<thead>";
				html2 += "<tr name =\"name\">";
				html2 += "<th class =\"CSTMR_NAME\" id =\"CSTMR_NAME\">고객명</th>";
				html2 += "<th>고객의 부서/직책</th>";
				html2 += "<th>연락처</th>";
				html2 += "<th>고객사명</th>";
				html2 += "</tr>";
				html2 += "</thead>";
				html2 += "<tbody>";
				html2 += "</tbody>";
				html2 += "</table>";
				html2 += "<div class=\"paging\">";
				html2 += "</div>";
				html2 += "</div>";
				html2 +="</form>";
				makeOneBtnPopup(2, "고객선택", html2, true, 900, 600, function() {
					//고객목록조회구현 
					 clientListLoad();
					//목록 클릭 시 고객  1번팝업에 넣기 + tr내용기반 1번팝업내용채우기 + 팝업닫기
					$("#cstmrtable tbody").on("click", "tr", function() {
						$("#actionForm2 #cstmr_no").val($(this).attr("name"));
						
						//actionForm2의 고객번호를--> 눌렀을때 값주기
					 console.log($(this).children().eq(0).html());
					console.log($(this).children().eq(1).html());
					console.log($(this).children().eq(2).html());	
						$("#cstmr_name").val($(this).children().eq(0).html());
						 $("#dprtmnt").val($(this).children().eq(1).html());
						$("#cstmr_cmpny_name").val($(this).children().eq(3).html());
						//cstmr_cmpny_name에 다가 html의 3번째값을 넣어주기
						closePopup(2);
					}); 
					
				}, "취소", function() {
					closePopup(2);
				}); 
			});

		}, "저장", function() {
			//Ajax저장버튼 누를때
			if($.trim($("#bsns_name").val()) == ""){
				alert("영업명을 입력하여주세요");
			}else if ($.trim($("#cstmr_name").val())== ""){
				alert("거래처담당자를 입력하여주세요");
			}else if ($.trim($("#cstmr_cmpny_name").val())== ""){
				alert("거래처을 입력하여주세요");
			}else if ($.trim($("#rqstDate").val())== ""){
				alert("요청일 입력하여주세요");
			}else if ($.trim($("#end_date").val())== ""){
				alert("마감일	 입력하여주세요");
			}else if ($.trim($("#expctn_scs_prblty2").val())== ""){
				alert("예상성공확률을 입력하여주세요");
			}else if ($.trim($("#con").val())== ""){
				alert("내용 입력하여주세요");
			}
			else{
				var params = $("#actionForm2").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "suggestAjax",//제안수정
					dataType : "json",
					data : params,
					success : function(res){
						console.log("액션폼2의 res: " + res);
						closePopup(1);
					if(res.result == "success"){  
						makeAlert(1, "알림", "수정되었습니다.", true, function(){
							$("#backForm").submit();
						});
										location.reload();
							reloadSalesList();
							closePopup(1);
					}else {
						alret("오류가 발생하였습니다");
					}
					
					},
					error : function(request, status, error){
						console.log("text : " + request.responseText);
						console.log("error :" + error);
					}
				});
				}
		}, "닫기", function() {	
			location.reload();
			closePopup(1);
		});
}); //제안수정
//제안등록바로가기
	$("#write2").on("click",function(){
		var html ="";
		html+="<form action=\"write2\" id=\"actionForm4\" method =\"post\">";
		html +="<input type=\"hidden\" name=\"bsnsNo\"  id =\"bsnsNo\" value=\"${param.bsnsNo}\">";
		html +="<input type=\"hidden\" name=\"cstmr_no\" id =\"cstmr_no\" value=\"${data.CSTMR_NO}\">";
	
		html+="<input type=\"hidden\" name=\"sgstnNo\" id=\"sgstnNo\" value =\"${data.SGSTN_NO}\" />"
		html +="<table id =\"pt\" name =\"pt\"cellspacing =\"0\">";
		html +="<colgroup>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="</colgroup>";
		html +="<tbody>";
		html +="<tr  name=\"bsnsNo\" id=\"bsnsNo\" height=\"50px\">";
		html +="<td>영업명</td>";
		html +="<td><input type= \"text\" class =\"text3\" name =\"bsns_name\" id =\"bsns_name\" value=\"${data.BSNS_NAME}\" disabled /></td>";
		html +="<td>제안등록일(오늘)</td>";
		html +="<td>"+year+" 년 "+ month +" 월 "+date+" 일 </td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html+="<td>거래처담당자</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_name\" id =\"cstmr_name\"value = \"${data.CSTMR_NAME}\" disabled /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
		html+="<td>거래처</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_cmpny_name\" id =\"cstmr_cmpny_name\" value =\"${data.CSTNAME}\" disabled /></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html+="<td>작성자(사원)</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"emply_name\" id =\"emply_name\" value='${sEmplyName}' disabled /></td>";
		html+="<td>작성자부서</td>";
		html+="<td><input type= \"text\"  class=\"text1\" name =\"sDprtmntName\" id =\"sDprtmntName\" value =\"${sDprtmntName} disabled\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>요청일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"rqstDate\" id =\"rqstDate\"/></td>";
		html +="<td>마감일</td>";
		html +="<td><input type= \"date\" class =\"text1\" name =\"end_date\" id =\"end_date\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>예상성공확률</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"expctn_scs_prblty2\" id =\"expctn_scs_prblty2\" /></td>";
		html +="<td>기타</td>";
		html +="<td><input type= \"text\" class =\"text3\" name =\"ancon\" id=\"ancon\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>내용</td>";
		html +="<td colspan =\"3\"><input type= \"text\" class =\"text3\" name =\"con\" id=\"con\"/></td>";
		html +="</tr>";
		html +="</tbody>";
		html +="</table>";
		html +="</from>";
		makeTwoBtnPopup(1, "제안등록", html, true, 900, 600, function(){
			//버튼누를시
			$("#rhror").on("click",function(){
				$("#bsnNo").val("${param.bsnsNo}");
				var html2 ="";
			 	html2 +="<form action=\"#\" id=\"actionForm3\">"; 
				html2 +=" <input type=\"hidden\" name=\"cstmr_no\" id=\"cstmr_no\" />"
				html2 += "<div class=\"tbl1\">";
				html2 += "<select name=\"select\" id =\"select\" class=\"select\">";
				html2 += "<option value =\"0\">전체</option>";
				html2 += "<option value =\"1\">고객명</option>";
				html2 += "<option value =\"2\">고객사명</option>";
				html2 += "</select> ";
				html2 += "<input type=\"text\" class=\"select_txt\" name=\"search_cus\" ><input type=\"button\" value=\"검색\"class=\"searchBtn_cus\">";
				html2 += "<table class=\"board\" id=\"cstmrtable\">";
				html2 += "<colgroup>";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "</colgroup>";
				html2 += "<thead>";
				html2 += "<tr name =\"name\">";
				html2 += "<th class =\"CSTMR_NAME\" id =\"CSTMR_NAME\">고객명</th>";
				html2 += "<th>고객의 부서/직책</th>";
				html2 += "<th>연락처</th>";
				html2 += "<th>고객사명</th>";
				html2 += "</tr>";
				html2 += "</thead>";
				html2 += "<tbody>";
				html2 += "</tbody>";
				html2 += "</table>";
				html2 += "<div class=\"paging\">";
				html2 += "</div>";
				html2 += "</div>";
				html2 +="</form>";
				
				makeOneBtnPopup(2, "고객선택", html2, true, 900, 600, function() {
					//고객목록조회구현 
					 clientListLoad();
				
					$("#cstmrtable tbody").on("click", "tr", function() {
					console.log($(this).children().eq(0).html());
					console.log($(this).children().eq(1).html());
					$("#cstmr_name").val($(this).children().eq(0).html());
					$("#cstmr_cmpny_name").val($(this).children().eq(3).html());
			
						closePopup(2);
					}); 
					
				}, "취소", function() {
					closePopup(2);
				}); 
			});
		}, "저장", function() {
			//Ajax저장버튼 누를때
			$("#bsnNo").val("${param.bsnsNo}");
			if($.trim($("#bsns_name").val()) == ""){
				alert("영업명을 입력하여주세요");
			}else if ($.trim($("#cstmr_name").val())== ""){
				alert("(고객명)거래처담당자를 입력하여주세요");
			}else if ($.trim($("#cstmr_cmpny_name").val())== ""){
				alert("거래처를 입력하여주세요");
			}else if ($.trim($("#rqstDate").val())== ""){
				alert("요청일을 입력하여주세요");
			}else if ($.trim($("#end_date").val())== ""){
				alert("마감일을 입력하여주세요");
			}else if ($.trim($("#expctn_scs_prblty2").val())== ""){
				alert("예상성공확률을 입력하여주세요");
			}else if ($.trim($("#con").val())== ""){
				alert("내용을 입력하여주세요");
			}
			else{
				var params = $("#actionForm4").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "writeSugajax",//제안등록
					dataType : "json",
					data : params,
					success : function(res){
					console.log("액션폼2의 res: " + res);
					if(res.result == "success"){  
						$("#page").val("1");
 						reloadSalesList();
 						location.reload();
 						closePopup(1);
					}else {
						alert("오류가 발생하였습니다");
					}		
					},
					error : function(request, status, error){
						console.log("text : " + request.responseText);
						console.log("error :" + error);
					}
				});
				
				}
		
		}, "닫기", function() {
			location.reload();
			closePopup(1);
		});
		
	});
	//기회수정
	$("#update1").on("click",function(){
		var html ="";
		html+="<form action=\"update1\" id=\"actionForm2\" method =\"post\">";
		html +="<input type=\"hidden\" name=\"bsnsNo\" value=\"${param.bsnsNo}\">";
		html +="<input type=\"hidden\" name=\"cstmr_no\" id =\"cstmr_no\" value=\"${data.CSTMR_NO}\">";
		html +="<table cellspacing =\"0\">";
		html +="<colgroup>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="<col width=\"100px\"/>";
		html +="<col width=\"350px\"/>";
		html +="</colgroup>";
		html +="<tbody>";
		html +="<tr height=\"50px\">";
		html +="<td>영업명</td>";
		html +="<td colspan =\"3\"><input type= \"text\" class =\"text3\" name =\"bsns_name\" id =\"bsns_name\" value =\"${data.BSNS_NAME}\"/></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html+="<td>거래처담당자</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_name\" id =\"cstmr_name\" value = \"${data.CSTMR_NAME}\"   /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
		html+="<td>거래처</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_cmpny_name\" id =\"cstmr_cmpny_name\" value =\"${data.CSTNAME}\" disabled/></td>";
		html +="<tr height=\"50px\">";
		html +="<td>예상성공확률</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"expctn_scs_prblty\" id =\"expctn_scs_prblty\" value=\"${data.EXPSP}\"/></td>";
		html +="<td>예상비용</td>";
		html +="<td><input type= \"text\" class =\"text1\" name =\"expctn_cost\" id =\"expctn_cost\" value=\"${data.EXPCTN_COST}\" /></td>";
		html +="</tr>";
		html +="<tr height=\"50px\">";
		html +="<td>기타</td>";
		html +="<td colspan=\"3\"><input type= \"text\" class =\"text3\" name =\"others\" id =\"others\" value =\"${data.OT}\" /></td>";
		html +="</tr>";
		html +="</tbody>";
		html +="</table>";
		html+="</form>";
		makeTwoBtnPopup(1, "기회수정", html, true, 900, 600, function(){
			//버튼누를시
			$("#rhror").on("click",function(){
				var html2 ="";
				html2 +="<form action=\"#\" id=\"actionForm3\">"; 
				html2 +=" <input type=\"hidden\" name=\"cstmr_no\" id=\"cstmr_no\" />"
				html2 += "<div class=\"tbl1\" id =\"table1\">";
				html2 += "<select name=\"select\" id =\"select\" class=\"select\">";
				html2 += "<option value =\"0\">전체</option>";
				html2 += "<option value =\"1\">고객명</option>";
				html2 += "<option value =\"2\">고객사명</option>";
				html2 += "</select> ";
				html2 += "<input type=\"text\" class=\"select_txt\" name=\"search_cus\" ><input type=\"button\" value=\"검색\"class=\"searchBtn_cus\">";
				html2 += "<table class=\"board\" id=\"cstmrtable\">";
				html2 += "<colgroup>";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "<col width=\"25%\" />";
				html2 += "</colgroup>";
				html2 += "<thead>";
				html2 += "<tr name =\"name\">";
				html2 += "<th class =\"CSTMR_NAME\" id =\"CSTMR_NAME\">고객명</th>";
				html2 += "<th>고객의 부서/직책</th>";
				html2 += "<th>연락처</th>";
				html2 += "<th>고객사명</th>";
				html2 += "</tr>";
				html2 += "</thead>";
				html2 += "<tbody>";
				html2 += "</tbody>";
				html2 += "</table>";
				html2 += "<div class=\"paging\">";
				html2 += "</div>";
				html2 += "</div>";
				html2 +="</form>";
				makeOneBtnPopup(2, "고객선택", html2, true, 900, 600, function() {
					//고객목록조회구현 
					 clientListLoad();
					//목록 클릭 시 고객  1번팝업에 넣기 + tr내용기반 1번팝업내용채우기 + 팝업닫기
					$("#table1 tbody").on("click", "tr", function() {
						$("#actionForm2 #cstmr_no").val($(this).attr("name"));
						
						//actionForm2의 고객번호를--> 눌렀을때 값주기
					 console.log($(this).children().eq(0).html());
					console.log($(this).children().eq(1).html());
					console.log($(this).children().eq(2).html());	
						$("#cstmr_name").val($(this).children().eq(0).html());
						 $("#dprtmnt").val($(this).children().eq(1).html());
						$("#cstmr_cmpny_name").val($(this).children().eq(3).html());
						//cstmr_cmpny_name에 다가 html의 3번째값을 넣어주기
						closePopup(2);
					}); 
					
				}, "취소", function() {
					closePopup(2);
				}); 
			});

		}, "저장", function() {

			//Ajax저장버튼 누를때
			if($.trim($("#bsns_name").val()) == ""){
				alert("영업명을 입력하여주세요");
			}else if ($.trim($("#cstmr_name").val())== ""){
				alert("(고객명)거래처담당자를 입력하여주세요");
			}else if ($.trim($("#cstmr_cmpny_name").val())== ""){
				alert("거래처를 입력하여주세요");
			}else if ($.trim($("#expctn_cost").val())== ""){
				alert("예상비용을 입력하여주세요");
			}else if ($.trim($("#expctn_scs_prblty").val())== ""){
				alert("예상성공확률을 입력하여주세요");
			}
			else{
				var params = $("#actionForm2").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "updatechance",//기회수정
					dataType : "json",
					data : params,
					success : function(res){
						console.log("액션폼2의 res: " + res);
						closePopup(1);
					if(res.result == "success"){  
						makeAlert(1, "알림", "수정되었습니다.", true, function(){
							$("#backForm").submit();
						});
						
							reloadSalesList();
							closePopup(1);
					}else {
						alret("오류가 발생하였습니다");
					}
					
					},
					error : function(request, status, error){
						console.log("text : " + request.responseText);
						console.log("error :" + error);
					}
				});
				}
		}, "닫기", function() {	
			location.reload();
			closePopup(1);
		});

}); //기회수정updatechance
	
});//end


/* 아이템파일조회 */
function Load(){
	var params = $("#suggesttable").serialize();
	
	$.ajax({
		type : "post",//전송방식
		url : "itemlistAjax",//주소 생김 --->controller아이템검색
		dataType : "json",//데이터형태
	 	data : params,//보낼데이터
		success : function(res){//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
			/* console.log(res); */
		if(res.result == "success"){
			
			redrawitem(res.list);
			redrawitemPaging(res.pb);
			
		}else{
			
		}
	},
	error : function(request, status, error) {
		console.log("text : " + request.responseText);
		console.log("error :" + error); 
		}
	});//ajax end
	
}// Load end
function redrawitem(iList){
	if(iList.length == 0){
			var html="";
			
			html +="<tr>";
			html +="<td colspan =\"5\">조회결과가없음.</td>";
			html +="</tr>";
			$("#suggesttable tbody").html(html);
			//list는 배열같이 쓸수있음
	}else{
		var html ="";
		for(var i = 0; i < iList.length; i++){
			html +="<tr name =\"" + iList[i].ITEM_NO + "\">";
			html += "<td>"+ iList[i].ITEM_NO+ "</td>";
			html += "<td>" + iList[i].ITEM_NAME+ "</td>";
			html += "<td>" + iList[i].STNDRD_PRICE + "</td>";
			html += "<td>" + iList[i].RGSTRTN + "</td>";
			html += "<td>" + iList[i].DLT + "</td>";
			html += "</tr>";
			
		}
		console.log("아이템제안길이는" + iList.length);
		
		$("#suggesttable tbody").html(html);
	}
}//redrawitem


function redrawitemPaging(itemListpb){
	var html ="<span name =\"1\">처음</span>&nbsp;";
	if($("#page").val() == "1"){
		 html +="<span name =\"1\">이전</span>&nbsp;";
	}else{
		 html +="<span name =\"" + ($("#page").val() * 1 - 1)+ "\">이전</span>&nbsp;";
	}
	for(var i = itemListpb.startPcount ; i <= itemListpb.endPcount ; i ++){
	//i가 p와 같으면 추가 하고
	//아님 없는것	
		if(i == $("#page").val()){
			 html +="<span name =\"" + i + "\"><b>" + i+ "</b></span>&nbsp;";
		} else{
			 html +="<span name =\"" + i + "\">" + i + "</span>&nbsp;"
		}
	}

		if($("#page").val() == itemListpb.maxPcount){
			html +="<span name =\"" + itemListpb.maxPcount + "\">다음</span>&nbsp;";
		} else{
			html +="<span name =\"" + ($("#page").val() * 1 + 1) + "\">다음</span>&nbsp;";
		}
		html += "<span name =\"" + itemListpb.maxPcount + "\">마지막</span>";
		$(".paging_area").html(html);	
		console.log("고객페이지")
}//아이템page
/* 아이템파일조회 */




//영업리스트
function reloadSalesList() {
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "listAjax",
		dataType : "json",
		data : params,
		success : function(res) {
			if (res.result == "success") {
				redrawSalesList(res.list);
				redrawSalesPaging(res.pb);
			} else {
				alert("조회중문제가 발생");
			}
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error :" + error);
		}
	});
}
function redrawSalesList(SalesList) {
	if (SalesList.length == 0) {//배열인식을 하여 0으로 하게 되면 값을 받아온 것이 없게됨 list 안에 값이 없다는 것
		var html = "";
		html += "<tr>";
		html += "<td colspan =\"7\">조회결과가없음.</td>";
		html += "</tr>";
		$(".board tbody").html(html);
	} else {
		var html = "";
		for (var i = 0; i < SalesList.length; i++) {
			<%-- html +="<option value="전체">전체</option>" --%>

			
			html += "<tr name =\"" + SalesList[i].BSNS_NO + "\">";
			html += "<th>" + SalesList[i].BSNS_NO + "</td>";
			html += "<th name =\""+ SalesList[i].BSNS_STATE +"\">" + SalesList[i].BSNS_STATE + "</td>";
			html += "<th>" + SalesList[i].BSNS_NAME + "</td>";
			html += "<th>" + SalesList[i].DT + "</td>";
			html += "<th>" + SalesList[i].CSTMR_NAME + "</td>";
			html += "<th>" + SalesList[i].CSTMR_CMPNY_NAME + "</td>";
			html += "</tr>";
		}
		$(".board tbody").html(html);
	}
};

function redrawSalesPaging(pb){
	
	var html ="<div class=\"pagingD\" id=\"first\" name=\"1\"></div>&nbsp;";
	
		if($("#page").val()=="1"){
			html += "<div class=\"pagingD\" id=\"before\" name=\"1\"></div>&nbsp;";
		}else{
			html +="<div class=\"pagingD\" id=\"before\" name=\""+ ($("#page").val()* 1 - 1)+"\"></div>&nbsp;";
		}
		
		for(var i = pb.startPcount ; i <= pb.endPcount ; i++){
			if(i == $("#page").val()){
				html +="<div class=\"pagingD\" name=\"" + i + "\"><b>" + i + "</b></div>&nbsp;";
			}else{
				html +="<div class=\"pagingD\" name=\"" + i + "\">" + i + "</div>&nbsp;";
			}
		}
		
		if($("#page").val()== pb.maxPcount){
			html += "<div class=\"pagingD\" id=\"next\" name=\""+ pb.maxPcount + "\"></div>&nbsp;";
		}else{
			html +="<div class=\"pagingD\" id=\"next\" name=\"" + ($("#page").val()* 1 + 1)+"\"></div>&nbsp;";
		}
		
		html += "<div class=\"pagingD\" id=\"last\" name=\"" + pb.maxPcount + "\"></div>";
		
		$(".paging").html(html);
		
}

//고객리스트
function clientListLoad(){
	var params = $("#actionForm3").serialize();
	
	$.ajax({
		type : "post",
		url : "cstmrlistajax",
		dataType : "json",
	 	data : params,
		success : function(res){
		
		if(res.result == "success"){
			redrawClientList(res.list);
			redrawClientPaging(res.pb);
			
		}else{
			alert("조회중문제가 발생");
		}
	},
	error : function(request, status, error) {
		console.log("text : " + request.responseText);
		console.log("error :" + error); 
		}
	});//ajax end
	
}// clientListLoad end
function redrawClientList(clientList){
	if(clientList.length==0){
		var html="";
	html +="<tr>";
	html +="<td colspan =\"5\">조회결과가없음.</td>";
	html +="</tr>";
	
	$("#cstmrtable tbody").html(html);
	//list는 배열같이 쓸수있음
	}else{
		var html ="";
		for(var i = 0; i < clientList.length; i++){
			html +="<tr name =\"" + clientList[i].CSTMR_NO + "\">";
			html += "<td>" + clientList[i].CSTMR_NAME+ "</td>";
			html += "<td>" + clientList[i].DPRTMNT +"/"+ clientList[i].PSTN + "</td>";
			html += "<td>" + clientList[i].CNTCT + "</td>";
			html += "<td>" + clientList[i].CSTMR_CMPNY_NAME + "</td>";
			html += "</tr>";
			console.log("클라이언트리스트는 " + i + ")" + clientList[i].CSTMR_NO);
			console.log("클라이언트리스트는 " + i + ")" + clientList[i].CSTMR_NAME);
			console.log("클라이언트리스트는 " + i + ")" + clientList[i].CNTCT);
			
		}
		console.log("클라이언트리스트 길이는" + clientList.length);
		
		$("#cstmrtable tbody").html(html);
	}
}//redrawClientList end
function redrawClientPaging(clientListpb){
	var html ="<span name =\"1\">처음</span>&nbsp;";
	
	if($("#page").val() == "1"){
		 html +="<span name =\"1\">이전</span>&nbsp;";
	}else{
		 html +="<span name =\"" + ($("#page").val() * 1 - 1)+ "\">이전</span>&nbsp;";
	}
	for(var i = clientListpb.startPcount ; i <= clientListpb.endPcount ; i ++){
	//i가 p와 같으면 추가 하고
	//아님 없는것	
		if(i == $("#page").val()){
			 html +="<span name =\"" + i + "\"><b>" + i+ "</b></span>&nbsp;";
		} else{
			 html +="<span name =\"" + i + "\">" + i + "</span>&nbsp;"
		}
		
	}

		if($("#page").val() == clientListpb.maxPcount){
			html +="<span name =\"" + clientListpb.maxPcount + "\">다음</span>&nbsp;";
		} else{
			html +="<span name =\"" + ($("#page").val() * 1 + 1) + "\">다음</span>&nbsp;";
		}
	
		html += "<span name =\"" + clientListpb.maxPcount + "\">마지막</span>";
		
		$(".paging_area").html(html);	
		console.log("고객페이지")
	}
function come(data) {

	var html = "";
	html += "내용 : <textarea rows =\"5\" cols =\"50\" name =\"bCon\" id =\"bCon\">"
			+ temp + "</textarea>";
	$(".con").html(html);
	
}


function newschdlReload() {
	
	var params = $("#actionFormSchetable").serialize();
	
	$.ajax({
		type : "post",
		url : "newschdlReloadAjax",//일정LISTTABLE
		dataType : "json",
		data : params,
		success : function(res) {
			if (res.result == "success") {
				redrawschdlList(res.list);
				
			} else {
				alert("조회중문제가 발생");
			}
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error :" + error);
		}
	});
}
function redrawschdlList(List) {
	if (List.length == 0) {//배열인식을 하여 0으로 하게 되면 값을 받아온 것이 없게됨 list 안에 값이 없다는 것
		var html = "";
		html += "<tr>";
		html += "<td colspan =\"7\">조회결과가없음.</td>";
		html += "</tr>";
		$(".table2 tbody").html(html);
	} else {
		var html = "";
		for (var i = 0; i < List.length; i++) {
			<%-- html +="<option value="전체">전체</option>" --%>
			html +="<input type=\"hidden\" name=\"schdlNo\" id =\"schdlNo\" value=\"${data.SCHDL_NO}\">";
			html += "<tr name =\"" + List[i].SCHDL_NO + "\">";
			html += "<th name =\"" +List[i].START_DATE+ "\">" + List[i].START_DATE + "</td>";
			html += "<th name =\"" +List[i].END_DATE+ "\">" + List[i].END_DATE  + "</td>";
			html += "<th name =\"" +List[i].SCHDL_NAME+ "\">" + List[i].SCHDL_NAME + "</td>";
			html += "<th name =\"" +List[i].PLACE+ "\">" + List[i].PLACE + "</td>";
			html += "<th name =\"" +List[i].CNTNT+ "\">" + List[i].CNTNT + "</td>";
			
			html += "</tr>";
		}
		$(".table2 tbody").html(html);
	}
};

/*  new schdl 리로드 */

</script>
</head>
<body>
<!-- 탑/레프트 -->
<c:import url="/topLeft">
<%-- 현재 페이지 해당 메뉴번호 지정 --%>
	<c:param name="menuNo" value="30"></c:param>
</c:import>
<!-- 구현내용 -->
<div class="title_wrap">
	<div class="title_table">
		<div class="title_txt">영업세부사항</div>
	</div>
</div>
<div class="contents_area">
	<!-- 내용은 여기에 구현하세요. -->
	
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="page" id="page" value="${param.page}">
	<input type="hidden" name="sAthrtyNo" id="sAthrtyNo" value="${sAthrtyNo}">
	<input type="hidden" name="sEmplyNo" id="sEmplyNo" value="${sEmplyNo}">
	<input type="hidden" name="bsnsNo" id="bsnsNo" value="${param.bsnsNo}">
	
</form>	

<div class="tbl1">
		<div class ="zz">거래처 : <${data.CSTNAME}> 거래처 담당자 : <${data.CSTMR_NAME}> 영업명 :< ${data.BSNS_NAME}></div>
		<c:if test="${data.BSNS_STATE >= 4}">	
				<div class ="djqdosekdns" id ="orderhide"><div class ="cjaqndlalwl"></div>수주</div>
<div class ="4" id ="4">	
				<input type="button" value="수주수정" class="writeBtn" id="reBtn">
				<div class="con_con"><table cellspacing ="0" class ="table1">
							<colgroup>
								<col width="100px"/>
								<col width="350px"/>
								<col width="100px"/>
								<col width="350px"/>
							</colgroup>
									<tr height="50px">
										<td class ="p">영업명</td>
										<td class="ttop">${data4.BSNS_NAME}</td>
										<td class ="p">영업번호</td>
										<td class="ttop">${data4.BSNS_NO}</td>
									</tr>
									<tr height="50px">
										<td class ="p">수주번호</td>
										<td>${data4.ORDER_NO}</td>
										<td class="p">수주등록일</td>
										<td>${data4.ORDER_RGSTR}</td>
									</tr>
									<tr height="50px">
										<td class="p">수주일</td>
										<td>${data4.ORDER_DATE}</td>
										<td class ="p">계약완료일</td>
										<td>${data4.SCS_DATE}</td>
									</tr>
									<tr height="50px">
										<td class ="p">내용</td>
										<td colspan="3">${data4.ORDER_CNTNT}</td>
									</tr>
									</tbody>
									</table>
<form action="#" id="actionFormItemtableorder" method="post">
<%-- <input type="hidden" name="bsnsNo" id="bsnsNo" value="${data4.BSNS_NO}">  --%>
 <input type="hidden" name="sgstnNo" id="sgstnNo" value="${data2.SGSTN_NO}" >
<input type="hidden" name="ngtnNo" id="ngtnNo" value="${data3.NGTN_NO}" >
<input type="hidden" name="orderNo" id="orderNo" value="${param.ORDER_NO}" >

<input type="hidden" name="sEmplyNo" id="sEmplyNo" value="${sEmplyNo}">
 <input type="hidden" name="itemNo" id ="itemNo" value="${param.ITEM_NO}">
 <input type="hidden" name="bsnsNo" id="bsnsNo" value="${data.BSNS_NO}">
<input type="hidden" name="bsnsNo" id="bsnsNo" value="${param.bsnsNo}">
	
			<table class="tableSuggestOrder" id ="tableSuggest">
					
				<div class ="cjaqndlalwl" id=suggestorder ><input type="button" value="품목등록" class="writeBtn" id="itemadd"></div>
				<colgroup>
					<col width="120px"/>
					<col width="318px"/>
					<col width="150px"/>
					<col width="150px"/>
					<col width="150px"/>
				</colgroup>
				<thead>
					<tr height="40px" >
						<td>품목번호</td>
						<td>품목명</td>
						<td>단가</td>
						<td>수량</td>
						<td>등록일</td>
					</tr>				
				</thead>
				<tbody>
					<tr>
						<td colspan="5">null</td>
					</tr>
				</tbody>
			</table>
			
			<div class="rkdnsep">
				<div class="paging"></div>
			</div>
</form>		
</div>
</div><!-- 4 -->
									</c:if><!-- 수주 4 end -->	
	<c:if test="${data.BSNS_STATE >= 3}">	
			<div class ="djqdosekdns" id ="nghide"><div class ="cjaqndlalwl"></div>협상</div>		
			<div class ="3" id ="3">
			<c:if test="${data.BSNS_STATE <= 3}">	
			<input type="button" value="수주등록" class="writeBtn" id ="write4">
			</c:if>
			<input type="button" value="협상수정" class="writeBtn" id ="update3">
				<div class="con_con">
							<table  cellspacing ="0" class="table1">
								<colgroup>
									<col width="100px"/>
									<col width="350px"/>
									<col width="100px"/>
									<col width="350px"/>
								</colgroup>
									<tbody>
										<tr height="50px">
											<td class ="p">영업명</td>
											<td class="ttop">${data3.BSNS_NAME}</td>
											<td class ="p">영업번호</td>
											<td class="ttop">${data3.BSNS_NO}</td>
										</tr>
										 <tr height="50px">
											<td class ="p">협상번호</td>
											<td>${data3.NGTN_NO}</td>
											<td class ="p">완료일</td>
											<td>${data3.CMPLTN}</td>
										</tr>
										<tr height="50px">
											<td class ="p">요청일</td>
											<td>${data3.NGTNRQST}</td>
											<td class ="p">마감일</td>
											<td>${data3.NGTNDLN}</td>
										</tr>
										<tr height="50px">
											<td class ="p">협상등록일</td>
											<td>${data3.RGSTR}</td>
											<td class="p">예상성공확률</td>
											<td>${data3.NGEXPRO}</td>
										</tr>
										<tr height="50px">
											<td class="p">내용</td>
											<td colspan="3">${data3.NGTN_CNTNT}</td>
										</tr>
									</tbody>
								</table>
<form action="#" id="actionFormItemtablengtn" method="post">
<%--  <input type="hidden" name="bsnsNo" id="bsnsNo" value="${data3.BSNS_NO}">  --%>
     <input type="hidden" name="sgstnNo" id="sgstnNo" value="${data2.SGSTN_NO}" >
	 <input type="hidden" name="ngtnNo" id="ngtnNo" value="${data3.NGTN_NO}" >
	 <input type="hidden" name="orderNo" id="orderNo" value="${data4.ORDER_NO}" >

<input type="hidden" name="sEmplyNo" id="sEmplyNo" value="${sEmplyNo}">
 <input type="hidden" name="itemNo" id ="itemNo" value="${param.ITEM_NO}">
 <input type="hidden" name="bsnsNo" id="bsnsNo" value="${data.BSNS_NO}">
<input type="hidden" name="bsnsNo" id="bsnsNo" value="${param.bsnsNo}">
	
			<table class="tableSuggestNgtn" id ="tableSuggest">
					
				<div class ="cjaqndlalwl" id=suggestngtn ><input type="button" value="품목등록" class="writeBtn" id="itemadd"></div>
				<colgroup>
					<col width="120px"/>
					<col width="318px"/>
					<col width="150px"/>
					<col width="150px"/>
					<col width="150px"/>
				</colgroup>
				<thead>
					<tr height="40px" >
						<td>품목번호</td>
						<td>품목명</td>
						<td>단가</td>
						<td>수량</td>
						<td>등록일</td>
					</tr>				
				</thead>
				<tbody>
					<tr>
						<td colspan="5">null</td>
					</tr>
				</tbody>
			</table>
			
	
			<div class="rkdnsep">
				<div class="paging">	
				</div>
			</div>
</form>								
		</div><!-- con_con -->
	</div>
	</c:if><!-- 협상 3 end -->
		<c:if test="${data.BSNS_STATE >= 2}">	
				<div class ="djqdosekdns" id= "sghide" ><div class ="cjaqndlalwl"></div>제안</div>
			<div class ="2" id ="2">
			<%-- <c:if test="${sEmplyNo eq data.EMPLY_NO}"> --%>
			<c:if test="${data.BSNS_STATE <= 2}">
			<input type="button" value="협상등록" class="writeBtn" id ="write3">
			</c:if>
			<input type="button" value="제안수정" class="writeBtn" id ="update2">
			<%-- </c:if> --%>
				<div class="con_con">
							<table  cellspacing ="0" class="table1">
							<colgroup>
								<col width="100px"/>
								<col width="350px"/>
								<col width="100px"/>
								<col width="350px"/>
							</colgroup>
								<tbody>
									<tr height="50px">
										<td class ="p">영업명</td>
										<td class="ttop">${data2.BSNS_NAME}</td>
										<td class ="p">영업번호</td>
										<td class="ttop">${data2.BSNS_NO}</td>
									</tr>
									<tr height="50px">
										<td class ="p">제안번호</td>
										<td>${data2.SGSTN_NO}</td>
										<td class="p">기타</td>
										<td>${data2.OTHERS}</td>
									</tr >
									<tr height="50px">
										<td class="p">요청일</td>
										<td>${data2.RDATE}</td>
										<td class="p">마감일</td>
										<td>${data2.EDATE}</td>									
									</tr>
									<tr height="50px">
										<td class="p">제안등록일</td>
										<td>${data2.SGDATE}</td>
										<td class="p">예상성공확률</td>
										<td>${data2.PR}</td>
									</tr>
									<tr height="50px">
										<td class="p">내용</td>
										<td colspan="3">${data2.SGSTN_CNTNT}</td>
									</tr>
								</tbody>
							</table>
<form action="#" id="actionFormItemtablesgstn" method="post">

<input type="hidden" name="sgstnNo" id="sgstnNo" value="${data2.SGSTN_NO}" >
<input type="hidden" name="ngtnNo" id="ngtnNo" value="${data3.NGTN_NO}" >
<input type="hidden" name="orderNo" id="orderNo" value="${data4.ORDER_NO}" >

<input type="hidden" name="sEmplyNo" id="sEmplyNo" value="${sEmplyNo}">
<input type="hidden" name="itemNo" id ="itemNo" value="${param.ITEM_NO}">
<input type="hidden" name="bsnsNo" id="bsnsNo" value="${data.BSNS_NO}">
<input type="hidden" name="bsnsNo" id="bsnsNo" value="${param.bsnsNo}">
	
			<table class="tableSuggestSgstn" id ="tableSuggest">
		
				<div class ="cjaqndlalwl" id=suggest ><input type="button" value="품목등록" class="writeBtn" id="itemadd"></div>
				<colgroup>
					<col width="120px"/>
					<col width="318px"/>
					<col width="150px"/>
					<col width="150px"/>
					<col width="150px"/>
				</colgroup>
				<thead>
					<tr height="40px" >
						<td>품목번호</td>
						<td>품목명</td>
						<td>단가</td>
						<td>수량</td>
						<td>등록일</td>
					</tr>				
				</thead>
				<tbody>
					<tr>
						<td colspan="5">null</td>
					</tr>
				</tbody>
			</table>
			<div class="rkdnsep">
				<div class="paging">	
				</div>
			</div>
</form>	</div><!-- con_con -->
				</div>
				<!-- 제안 2 end -->
		</c:if>
		<c:if test="${data.BSNS_STATE >= 1}">	 
			<div class ="djqdosekdns" id ="chancehide"><div class ="cjaqndlalwl"></div>기회</div>
			<div class ="1" id ="1">	
			<%-- <c:if test="${sEmplyNo eq data.EMPLY_NO}"> --%>
				<c:if test="${data.BSNS_STATE <= 1}">
					<input type="button" value="제안등록" class="writeBtn" id ="write2">
				</c:if>	
					<input type="button" value="기회수정" class="writeBtn" id="update1">
			<%-- </c:if> --%>
						<div class="con_con">
									<table  cellspacing ="0" class="table1">
									<colgroup>
										<col width="100px"/>
										<col width="350px"/>
										<col width="100px"/>
										<col width="350px"/>
									</colgroup>
										<tbody>
												<tr height="50px">
													<td class ="p">영업명</td>
													<td class="ttop">${data.BSNS_NAME}</td>
													<td class ="p">매입매출</td>
													<td class="ttop">${data.DVSN} </td>
												</tr height="50px">
												<tr height="50px">
													<td class ="p">영업번호</td>
													<td>${data.BSNS_NO}</td>
													<td class ="p">기회번호</td>
													<td>${data.CHNC_NO}</td>
												</tr height="50px">
												<tr height="50px">
													<td class ="p">영업등록일</td>
													<td>${data.RGDATE}</td>
													<td class ="p">사업유형번호</td>
													<td>${data.ENTRPRS_TYPE_NO}</td>
												</tr>
												<tr height="50px">
													<td class ="p">작성자</td>
													<td>${data.EMPLY_NAME}</td>
													<td class ="p">작성자부서</td>
													<td>${data.CLPHN_NO}</td>
												</tr>
												<tr height="50px">
													<td class ="p">기타</td>
													<td>${data.OT}</td>
													<td class ="p">예상비용</td>
													<td>${data.EXPCTN_COST}</td>
												</tr>
												<tr height="50px">
													<td class ="p">기회등록일</td>
													<td>${data.CHDATE}</td>
													<td class ="p">예상성공확률</td>
													<td>${data.EXPSP}</td>
												</tr>
												</tbody>
									</table>	
					
						</div><!-- con_con -->
						</div>
			<!-- 기회1 end -->
		</c:if>
	
<!-- 제안파일 -->
<div class ="con_con">
<!-- 일정 actionFormSchetable-->
<form action="#" id="actionFormSchetable" method="post">
<input type="hidden" name="bsnsNo" id="bsnsNo" value="${data.BSNS_NO}">
<input type="hidden" name="bsnsNo" id="bsnsNo" value="${param.bsnsNo}">
<input type="hidden" name="sEmplyNo" id="sEmplyNo" value="${sEmplyNo}">
<input type="hidden" name="schdlNo" id ="schdlNo" value="${param.SCHDL_NO}">";
<%-- <input type="hidden" name="itemNo" id ="itemNo" value="${param.ITEM_NO}">"; --%>
		 <div class ="dlfwjd">
			<div class="dlfwjd_1">
			<input type="button" value="일정등록" class="writeBtn" id="sche"> 
			</div>		
			<table  class="table2" id ="table2">
					<colgroup>
						<col width="100px" />
						<col width="100px" />
						<col width="250px" />
						<col width="150px" />
						<col width="256px" />
					</colgroup>
					<thead>
				<tr height="40px" >
				<th>시작날짜</th>
				<th>종료날짜</th>
				<th>일정명</th>
				<th>장소</th>
				<th>내용</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
			</table>
		</div>
</form>		

		<!-- 대화 -->
		<div class ="con_con">
		
				<form action="#" id="actionFormopn" method="post">		
					<input type="hidden" name="page" id="page" value="${param.page}">
					<input type="hidden" name="sAthrtyNo" id="sAthrtyNo" value="${sAthrtyNo}">
					<input type="hidden" name="sEmplyNo" id="sEmplyNo" value="${sEmplyNo}">
					<input type="hidden" name="bsnsNo" id="bsnsNo" value="${data.BSNS_NO}">
					<input type="hidden" name="bsnsNo" id="bsnsNo" value="${param.bsnsNo}">
					<input type ="hidden" name ="bsnsOpnNo" id ="bsnsOpnNo"/>
							<div class ="size">
							<div class ="dat_title">영업의견</div>
								<div class ="con">
								<div class ="silmscroll" id="silmscroll" name ="silmscroll">
				
		
			
								</div>
								</div>
								<div class ="sizebottom">
									<div class ="best">
									<textarea class  ="sizebottom_1"  id="opnCon" name ="opnCon" style="resize: none;"></textarea>
									</div>
										<div class="bottomsize_1"><div class="bottomsize_2"  >
										<input type="button" value="작성" id="bopnBtn" />
										<input type="hidden" value="수정완료" id="rewriteBtn" /> 
										</div></div>
									<input type="image" class ="vkdlf" src="resources/images/sales/vkdlf.png"/>
								</div>
							</div>
				</form>	
	
		</div><!-- con_con end-->	
</div><!-- con_con end-->		
</div> <!-- tb1 -->
<!-- 구현끝 -->
<!-- 바텀 -->
<c:import url="/bottom"></c:import>
</body>
</html>