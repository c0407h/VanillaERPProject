<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<!-- 헤더 -->
<c:import url="/header"></c:import>
<link rel="stylesheet" type="text/css" href="resources/css/sales/css.css"/>

<script type="text/javascript">
$(document).ready(function(){
	 let today = new Date();
	 let year = today.getFullYear();
	 let month = today.getMonth() + 1;
	 let date = today.getDate();
	if("${param.searchTxt}" != ""){
		$("#searchTxt").val("${param.searchTxt}");
	}
	reloadSalesList();
	
	$("#searchBtn").on("click",function(){
		$("#page").val("1");
		reloadSalesList();
	});
	
	$(".paging").on("click","div",function(){
		$("#page").val($(this).attr("name"));
		reloadSalesList();
	});
	
	 if("${param.select_txt}" != ""){
			$(".select_txt").val("${param.select_txt}");
		}
	
	$(".title_txt").on("click",function(){
		$("#searchTxt").val("");
		$("#page").val("1");
		reloadSalesList();
	});//새로
	
	$("#writeBtn").on("click",function(){
		
		var html ="";
		html+="<form action=\"#\" id=\"actionForm2\">";
		html+="<input type=\"hidden\" name=\"cstmr_no\" id=\"cstmr_no\" />"
		html+="<input type=\"hidden\" name=\"bsnsNo\" id=\"bsnsNo\" value =\"${data.BSNS_NO}\" />"
		html+="<input type=\"hidden\" name=\"bsnsNo\" id=\"bsnsNo\" value =\"${param.bsnsNo}\" />"
		html+="<input type=\"hidden\" name=\"chncNo\" id=\"chncNo\" value =\"${data.CHNC_NO}\" />"
			
		html+="<input type=\"hidden\" name=\"sEmplyNo\" id=\"sEmplyNo\" value=\"" + ${sEmplyNo} + "\"/>"
		html+="<table  cellspacing =\"0\">";
		html+="<colgroup>";
		html+="<col width=\"100px\"/>";
		html+="<col width=\"350px\"/>";
		html+="<col width=\"100px\"/>";
		html+="<col width=\"350px\"/>";
		html+="</colgroup>";
		html+="<tbody>";
		html+="<tr height=\"50px\">";
		html+="<td>영업명</td>";
		html+="<td><input type= \"text\" class =\"text3\" name =\"bsns_name\" id =\"bsns_name\" /></td>";
		html+="<td>매입매출</td>";
		html+="<td><input type=\"radio\"  name =\"prchs_sales_dvsn\" id =\"prchs_sales_dvsn\" value=\"0\">매입";
		html+="<input type =\"radio\"  name =\"prchs_sales_dvsn\" id =\"prchs_sales_dvsn\" value=\"1\">매출</td>";
		html+="</tr>";
		html+="<tr height=\"50px\">";
		html+="<td>기회등록일</td>";
		html +="<td>"+year+" 년 "+ month +" 월 "+date+" 일  </td>";
		html+="<td>사업유형번호</td>";
		html+="<td><input type=\"radio\"  name =\"entrprs_type_no\" id =\"entrprs_type_no\" value=\"0\">1";
		html+="<input type =\"radio\"  name =\"entrprs_type_no\" id =\"entrprs_type_no\" value=\"1\">2</td>";
		html+="</tr>"; 
		html+="<tr height=\"50px\">";	
		html+="<td>거래처담당자</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_name\" id =\"cstmr_name\" disabled  /><input type=\"button\" id=\"rhror\" value=\"검색\"/></td>";
		html+="<td>거래처</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"cstmr_cmpny_name\" id =\"cstmr_cmpny_name\" disabled/></td>";
		html+="</tr>";
		html+="<tr height=\"50px\">";
		html+="<td>거래처부서/직책</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"dprtmnt\"  id =\"dprtmnt\"disabled/></td>";
		html+="<td>작성자(사원)</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"emply_name\" id =\"emply_name\" value=\'${sEmplyName}\' disabled /></td>";
		html+="</tr>";
		html+="<tr height=\"50px\">";
		html+="<td>작성자부서</td>";
		html+="<td><input type= \"text\"  class=\"text1\" name =\"sDprtmntName\" id =\"sDprtmntName\" value =\"${sDprtmntName}\"/></td>";
		html+="<td>기타</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"others\" id =\"others\"/ ></td>";
		html+="</tr>";
		html+="<tr height=\"50px\">";
		html+="<td>예상비용</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"expctn_cost\" id =\"expctn_cost\" /></td>";
		html+="<td>예상성공확률</td>";
		html+="<td><input type= \"text\" class =\"text1\" name =\"expctn_scs_prblty\" id =\"expctn_scs_prblty\" /></td>";
		html+="</tr>";
		html+="</tbody>";
		html+="</table>";
		html+="</form>";
		
		makeTwoBtnPopup(1, "기회등록", html, true, 900, 750, function(){
			//버튼누를시
			$("#rhror").on("click",function(){
				
				var html2 ="";
				html2 +="<form action=\"#\" id=\"actionForm3\">"; 
				
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
				//검색버튼누르면 html로 그려지고 고객리스트
				makeOneBtnPopup(2, "고객선택", html2, true, 600, 600, function() {
					//고객목록조회구현 
					clientListLoad();
					
					//목록 클릭 시 고객  1번팝업에 넣기 + tr내용기반 1번팝업내용채우기 + 팝업닫기
								$("#cstmrtable tbody").on("click", "tr", function() {
									console.log($(this).children().eq(0).html());
									console.log($(this).children().eq(1).html());
									
									$("#cstmr_no").val($(this).attr("name"));
									console.log($("#cstmr_no").val());
									//팝업창에 나타나는 것
									$("#cstmr_name").val($(this).children().eq(0).html());
									 $("#dprtmnt").val($(this).children().eq(1).html());
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
			}/* else if ($.trim($("#chnc_rgstrtn_date").val())== ""){
				alert("기회등록일을 입력하여주세요");
			} */else if ($.trim($("#entrprs_type_no").val())== ""){
				alert("사업유형번호를 입력하여주세요");
			}else if ($.trim($("#cstmr_name").val())== ""){
				alert("(고객명)거래처담당자를 입력하여주세요");
			}else if ($.trim($("#cstmr_cmpny_name").val())== ""){
				alert("거래처를 입력하여주세요");
			}else if ($.trim($("#dprtmnt").val())== ""){
				alert("거래처담당자의 부서를 입력하여주세요");
			}else if ($.trim($("#emply_name").val())== ""){
				alert("작성자(사원)을 입력하여주세요");
			}else if ($.trim($("#expctn_cost").val())== ""){
				alert("예상비용을 입력하여주세요");
			}else if ($.trim($("#expctn_scs_prblty").val())== ""){
				alert("예상성공확률을 입력하여주세요");
			} else if (!$("input:radio[name='prchs_sales_dvsn']").is(':checked')) {
				alert("매입매출을 입력하여주세요.");
			} else if (!$("input:radio[name='entrprs_type_no']").is(':checked')) {
				alert("사업유형번호를 입력하여주세요.");
				
			} else{
				var params = $("#actionForm2").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "bsnswhole_ajax",//기회등록write후에영업TABLE
					dataType : "json",
					data : params,
					success : function(res){
						console.log("액션폼2의 res: " + res);
					if(res.result == "success"){ 
						
						$("#page").val("1");
						//기회등록후 영업listreload
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
			closePopup(1);
		});
		
	});
	
	
	
	$(".board tbody").on("click", "tr", function(){

		if($(this).is("[name]")){
			$("#bsnsNo").val($(this).attr("name"));//영업번호name BSNS_NO=bsnsNo
			$("#bsnsState").val($(this).attr("name"));
			console.log($("#bsnsNo"));
			console.log($("#bsnsState"));
			$("#actionForm").attr("action","detail");
			$("#actionForm").submit();
			$("#actionForm2").submit();
			$("#actionForm3").submit();
			
		}
		$("#bsnsState").val("{data.BSNS_STATE}");
		
		
	})
	
	$(".paging").on("click", "div", function(){
		$("#page").val($(this).attr("name")); 
		reloadSalesList();
	})
	
	$(".searchBtn_cus").on("click", function(){
		$("#page").val("1");
		clientListLoad();
	});

	$("[name='search_cus']").on("keypress", function(){
		if(event.keyCode == 13){
			$(".searchBtn_cus").click();
			return false;
		}
	});
});//document ready end



function getonecstmrajax(data){
	var temp = data.CSTMR_NO;	
	var html = "";
		html += "고객번호는 " + temp +"입니다"
		$(".cstmr_no").html(html);
}
function getonecstmr(data) {

	var temp = data.CON;
	console.log(temp);

	var html = "";
	html += "내용 : <textarea rows =\"5\" cols =\"50\" name =\"bCon\" id =\"bCon\">"
			+ temp + "</textarea>";
	$(".con").html(html);
}

function clientListLoad(){
 var params = $("#actionForm3").serialize(); 

	$.ajax({
		type : "post",//전송방식
		url : "cstmrlistajax",//주소 생김 --->controller고객리스트검색
		dataType : "json",//데이터형태
	 	data : params,//보낼데이터
		success : function(res){//성공시 다음함수를 실행하며, 돌아오는 값을 res란 이름으로 받는다
			/* console.log(res); */
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
	
function reloadSalesList() {
	//itemsList
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "listAjax",//영업TABLE
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
		<div class="title_txt">영업관리</div>
	</div>
</div>
<div class="contents_area">
	<!-- 내용은 여기에 구현하세요. -->
	<div class="tbl1">
		<form action="#" id="actionForm" method="post">
			<input type="hidden" name="bsnsNo" id="bsnsNo" />
			<input type="hidden" name="bstate" id="bstate"/>
			<input type="hidden" name="page" id="page" value="1"/>
	<%-- 		<input type="hidden"  id="page" name="page" value ="${page}"/> --%>
			<!-- <input type="hidden"  id="sellId" name="sellId"/> -->
			<select class="searchGbn" name="searchGbn">
				<option value ="0" selected>전체</option>
				<option value ="1" selected>기회</option>
				<option value ="2" selected>제안</option>
				<option value ="3" selected>협상</option>
				<option value ="4" selected>수주</option>
				<option value ="5" selected>실패</option>
			</select> 
			<input type="text" name="searchTxt" id="searchTxt"  class="search" placeholder="고객/고객사" />
			<span class="search_date_txt">등록일</span><input type ="date" class="search_date" name="searchDate">
			<input type="button" class="searchBtn" id="searchBtn">
			<input type="button" value="등록" class="writeBtn" id="writeBtn">
		</form>
			<table class="board">
					<colgroup>
						<col width="8%" />
						<col width="6%" />
						<col width="*" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
				<tr>
				<th>영업번호</th>
				<th>영업상태</th>
				<th>영업명</th>
				<th>등록일</th>
				<th>고객</th>
				<th>고객사</th>
				</tr>
				
			</thead>
			<tbody>
			</tbody>
		</table>
		<div class="paging">
		</div>
	</div>
</div>
<!-- 구현끝 -->
<!-- 바텀 -->
<c:import url="/bottom"></c:import>
</body>
</html>