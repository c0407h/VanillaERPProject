<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vanilla ERP - 고객사관리</title>
<!-- 헤더 -->
<c:import url="/header"></c:import>

<!-- 내 css  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/cstmrCmpnyMngmnt.css" />

<script type="text/javascript">
$(document).ready(function(){
	console.log("${param.search_cus}");
	
	if("${param.page}" !=""){
		$("#page").val("${param.page}");
	}
	if("${param.search_cus}" != ""){
		$("#search_cus").val("${param.search_cus}");
	}
	if("${param.select_cus}" != ""){
		$("#select_cus").val("${param.select_cus}");
	}	
	
	
	reloadList();
	$(".addBtn").on("click", function(){
		var html = "";
		html +="  <form action=\"CSTMRCMPNY\" id=\"insertForm\" method=\"post\">";
		html +=" 				<table class=\"addcstmrcm\">";
		html +=" 					<colgroup>";
		html +=" 						<col width=\"100px\">";
		html +=" 						<col width=\"100px\">";
		html +=" 						<col width=\"130px\">";
		html +=" 						<col width=\"110px\">";
		html +=" 					</colgroup>";
		html +=" 					<thead></thead> ";
		html +=" 					<tbody>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>작성자</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"empy\" value='${sEmplyName}' disabled /><input type=\"hidden\" name=\"sEmplyNo\" value='${sEmplyNo}'/></td>";
		html +=" 							<th>부서/직책</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"pstn\" value='${sDprtmntName}/${sPstnName}' disabled /></td>";
		html +=" 						</tr>";
		html +=" 						<tr class=\"empty\">";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +="	 						<td></td>";
		html +=" 							<td></td>";
		html +=" 						</tr>";						
		html +=" 						<tr height=8px>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 						</tr>";
		html +="  						<tr height=40px>";
		html +=" 							<th>고객사</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrname\" name=\"cstmrname\"/></td>";
		html +=" 							<th>사업자등록번호</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"crprtrgstrtnno\" name=\"crprtrgstrtnno\" /></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>대표</th>";	
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"rprsntv\" name=\"rprsntv\"/></td>";
		html +=" 							<th>대표연락처</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cmpnycntct\" name=\"cmpnycntct\" placeholder=\"- 포함 입력.\"/></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>주소</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"adrs\" name=\"adrs\"/></td>";
		html +=" 							<th>등급</th>";
		html +=" 							<td><select class=\"select_grade\" name=\"select_grade\"></select></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>유형</th>";
		html +=" 							<td><select class=\"select_type\" name=\"select_type\"></select></td>";
		html +=" 							<th>팩스</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmr_cmpny_fax\" name=\"cstmr_cmpny_fax\" placeholder=\"- 포함 입력.\"/></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>이메일</th>";
		html +=" 							<td colsapn=\"3\"><input type=\"text\" class=\"inputaddtxt\" id=\"cstmr_cmpny_email\" name=\"cstmr_cmpny_email\"/></td>";
		html +=" 						</tr>";
		html +=" 						<tr class=\"empty\">";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 						</tr>			";			
		html +=" 						<tr height=8px>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +="							<td></td>";
		html +=" 							<td></td>";
		html +="	 					</tbody>";
		html +="</table>";
		html +="</form>";
		
		makeTwoBtnPopup(1, "고객사등록", html, true, 600, 600, function(){
			
			$.ajax({
				type : "post", // 전송방식
				url : "CstmrCmpnyGradeAjax", //주소
				dataType : "json", //데이터 형태
				success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
					if(res.result == "success"){
						var html = "";
						
						for(var i = 0; i < res.gradelist.length ; i++){
							 html += "<option value=\"" + res.gradelist[i].GRADE_NO + "\">" + res.gradelist[i].GRADE_NAME + "</option>";
						}
						
						$(".select_grade").html(html); 
						
					}else{
						alert("조회중 문제 발생");
					}
				},
				error : function(request, status, error) { //실행 중 에러 발생 시
					console.log("txt : " + request.responseText); // 반환텍스트
					console.log("error : " + error); // 에러내용
					//예외 처리 할 거라 에러 날 일 업음
				}
		});
			
			$.ajax({
				type : "post", // 전송방식
				url : "CstmrCmpnyTypeAjax", //주소
				dataType : "json", //데이터 형태
				success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
					if(res.result == "success"){
						var html = "";
						
						for(var i = 0; i < res.typelist.length ; i++){
							 html += "<option value=\"" + res.typelist[i].CSTMR_CMPNY_TYPE_NO + "\">" + res.typelist[i].CSTMR_CMPNY_TYPE_NAME + "</option>";
						}
						
						$(".select_type").html(html); 
						
					}else{
						alert("등록중 문제 발생");
					}
				},
				error : function(request, status, error) { //실행 중 에러 발생 시
					console.log("txt : " + request.responseText); // 반환텍스트
					console.log("error : " + error); // 에러내용
					//예외 처리 할 거라 에러 날 일 업음
					
				}
				
				
		});	
			
			
		}, "저장", function(){
			
			if($.trim($("#cstmrname").val()) == ""){
				alert("고객사을 입력하세요.")
			}else if($.trim($("#crprtrgstrtnno").val()) == ""){
				alert("사업자등록번호를 입력하세요.")
			}else if($.trim($("#rprsntv").val()) == ""){
				alert("대표를 입력하세요.")
			}else if($.trim($("#cmpnycntct").val()) == ""){
				alert("대표연락처를 입력하세요.")
			}else if($.trim($("#adrs").val()) == ""){
				alert("주소를 입력하세요.")
			}else if($.trim($("#cstmr_cmpny_fax").val()) == ""){
				alert("팩스를 입력하세요.")
			}else if($.trim($("#cstmr_cmpny_email").val()) == ""){
				alert("이메일을 입력하세요.")
			}else{
				
			var params = $("#insertForm").serialize();
			console.log(params);
			$.ajax({
				type : "post", // 전송방식
				url : "CSTMRCMPNYAddAjax", //주소
				dataType : "json", //데이터 형태
				data : params,   //보낼데이터
				success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
					if(res.result == "success"){
						$("#page").val("1");
						reloadList();
						closePopup(1);
					}else{
						alert("조회중 문제 발생");
					}
				},
				error : function(request, status, error) { //실행 중 에러 발생 시
					console.log("txt : " + request.responseText); // 반환텍스트
					console.log("error : " + error); // 에러내용
					//예외 처리 할 거라 에러 날 일 업음
					
				}
				
				
		});
			
			}
			
			
			
			
		}, "취소", function() {
			closePopup(1);
		});
		
	});
	
	$(".searchBtn_cus").on("click", function(){
		$("#page").val("1");
		reloadList();
	});

	$("[name='search_cus']").on("keypress", function(){
		if(event.keyCode == 13){
			$(".searchBtn_cus").click();
			return false;
		}
	});
	
	$(".check_cstmr tbody").on("click", "tr", function(){
		console.log("ㅎㅇㅎㅇ");
		
		if($(this).is("[name]")){
			$("#cstmrcmpnyno").val($(this).attr("name"));
			$("#actionForm").attr("action","detailcstmrCmpny");
			$("#actionForm").submit();
		}
	})
	
	$(".paging").on("click", "div", function(){
		$("#page").val($(this).attr("name")); // 클릭한게 네임으로 들어감
		reloadList();
	})
	
	
	
})




function reloadList(){
	var params = $("#actionForm").serialize();
	console.log(params);
	$.ajax({
			type : "post", // 전송방식
			url : "CSTMRCMPNYListAjax", //주소
			dataType : "json", //데이터 형태
			data : params,   //보낼데이터
			success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
				if(res.result == "success"){
					redrawList(res.CMlist);
					redrawPaging(res.pb);
				}else{
					alert("조회중 문제 발생");
				}
			},
			error : function(request, status, error) { //실행 중 에러 발생 시
				console.log("txt : " + request.responseText); // 반환텍스트
				console.log("error : " + error); // 에러내용
				//예외 처리 할 거라 에러 날 일 업음
				
			}
			
			
	});
};

function redrawList(CMlist){
	if(CMlist.length == 0){
		var html = "";
		html += "<tr>";
		html += "<td colspan=\"7\">조회결과가 없습니다.</td>";
		html += "</tr>";
		
		$(".check_cstmr tbody").html(html);
	}else{
		var html = "";
		
		for(var i = 0; i < CMlist.length ; i++){
			 html += "<tr name=\"" + CMlist[i].CSTMR_CMPNY_NO + "\" >";
			 html += "<td>"+ CMlist[i].CSTMR_CMPNY_NO + "</td>";
			 html += "<td>"+ CMlist[i].CSTMR_CMPNY_NAME + "</td>";
			 html += "<td>"+ CMlist[i].CMPNY_CNTCT + "</td>";
			 html += "<td>"+ CMlist[i].CRPRT_RGSTRTN_NO + "</td>";
			 html += "<td>"+ CMlist[i].EMPLY_NAME + "</td>";
			 html += "<td>"+ CMlist[i].PSTN_NAME + "</td>";
			 html += "<td>"+ CMlist[i].RGSTRTN_DATE + "</td>";
			 html += "</tr>";
		}
		$(".check_cstmr tbody").html(html); 
		// html로 갈아엎음
	}
};
function redrawPaging(pb){
	
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
	<c:param name="menuNo" value="27"></c:param>
</c:import>
<!-- 구현내용 -->
<div class="title_wrap">
	<div class="title_table">
		<div class="title_txt">고객사 관리</div>
	</div>
</div>



<div class="contents_area">
	<!-- 내용은 여기에 구현하세요. -->
<form action="CSTMRCMPNY" id="actionForm" method="post">
<input type="hidden" name="page" id="page" value="1"/>
<input type="hidden" name="cstmrcmpnyno" id="cstmrcmpnyno" value="1"/>
	<br/>	
	<select class="select_cus" name="select_cus" id="select_cus">
					<option value="0">전체</option>
					<option value="1">고객사</option>
					<option value="2">작성자</option>
					</select> 
	<input type="text" class="search_cus" name="search_cus" id="search_cus"><input type="button" class="searchBtn_cus"><input type="button" value="등록" class="addBtn">
</form>
	<div class="tbl1">
			<br/>
				<table class="check_cstmr">
					<colgroup>
						<col class="b_No" >
						<col class="cstmr_com">
						<col class="cntct_adrs">
						<col class="crprt_rgstrtn">
						<col class="crprt_rgstrtn">
						<col class="sales_man">
						<col class="position">
						<col class="date">
					</colgroup>
				
					<thead>
						<tr>
							<th>No</th>
							<th>고객사</th>
							<th>연락처</th>
							<th>사업자번호</th>
							<th>작성자</th>
							<th>직책</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="7">NULL</td>
						</tr>
				</tbody>
</table>

<br/>
		<div class="paging">
			<div class="pagingD" id="first" name="1"></div>
			<div class="pagingD" id="before" name="1"></div>
			<div class="pagingD" name="1"><b>1</b></div>
			<div class="pagingD" id="next" name="1"></div>
			<div class="pagingD" id="last" name="1"></div>
		</div>
	</div>
</div>
<!-- 구현끝 -->
<!-- 바텀 -->
<c:import url="/bottom"></c:import>
</body>
</html>