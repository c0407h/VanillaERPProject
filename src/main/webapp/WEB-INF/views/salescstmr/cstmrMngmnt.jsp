<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vanilla ERP - 고객관리</title>
<!-- 헤더 -->
<c:import url="/header"></c:import>

<!-- 내 css  -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/cstmrMngmnt.css" />

<script type="text/javascript">
$(document).ready(function(){
	

	if("${param.page}" != ""){
		$("#page").val("${param.page}");
	}
	
	if("${param.search_cus}" != ""){
		$(".search_cus").val("${param.search_cus}");
	}
	
	if("${param.searchBtn_cus}" != ""){
		$(".searchBtn_cus").val("${param.searchBtn_cus}");
	}
	
	$(".check_cstmr tbody").on("click", "tr", function(){
		console.log("ㅎㅇㅎㅇ");
		/* 페이지전환해야함.  */
		if($(this).is("[name]")){
			$("#cstmrno").val($(this).attr("name"));
			$("#actionForm").attr("action","detailCstmr");
			$("#actionForm").submit();
		}
	})
	
	
	
	reloadList();
	
	$(".addBtn").on("click", function(){
		var html = "";
		
		html +="  <form action=\"cstmrMngmnt\" id=\"insertcstmrForm\" method=\"post\">";
		html +=" <input type=\"hidden\" name=\"cstmrcmpnyno2\" id=\"cstmrcmpnyno2\" />"
		html +=" <input type=\"hidden\" name=\"CstmrNoSeq\" id=\"CstmrNoSeq\" value='${prams.CstmrNoSeq}' />"
		html +=" <input type=\"hidden\" name=\"sEmplyNo\" id=\"sEmplyNo\" value='${sEmplyNo}' />"
		html +=" 				<table class=\"addcstmr\">";
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
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"empy\" value='${sEmplyName}' disabled /></td>";
		html +=" 							<th>부서/직책</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"pstn\" value='${sDprtmntName}/${sPstnName}' disabled/></td>";
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
		html +=" 							<th>고객</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmr\" name=\"cstmr\"/></td>";
		html +=" 							<th>연락처</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cntct\" name=\"cntct\" placeholder=\"- 포함 입력.\"/></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>직책</th>";	
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"Cpstn\" name=\"Cpstn\"/></td>";
		html +=" 							<th>이메일</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"Cemail\" name=\"Cemail\"/></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>부서</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"Cdptmnt\" name=\"Cdptmnt\"/></td>";
		html +=" 							<th>등급</th>";
		html +=" 							<td><select class=\"select_grade\" name=\"select_grade\"></select></td>";
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
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>고객사</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt1\" id=\"search_cstmr_cmpny\" name=\"search_cstmr_cmpny\" disabled /><input type=\"button\" class=\"search_cstmr_cmpny\" value=\"검색\"/></select></td>";
		html +=" 							<th>대표연락처</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmr_cntct\" name=\"cstmr_cntct\" disabled /></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>대표팩스</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmr_cmpny_fax\" name=\"cstmr_cmpny_fax\" disabled /></td>";
		html +=" 							<th>대표이메일</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmr_cmpny_email\" name=\"cstmr_cmpny_email\" disabled /></td>";
		html +="						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>주소</th>";
		html +=" 							<td colspan=\"3\"><input type=\"text\" class=\"inputaddtxt\" id=\"cstmr_cmpny_adrs\" name=\"cstmr_cmpny_adrs\" disabled /></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=8px>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 						</tr>";
		html +=" 							<tr class=\"empty\">";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 							<td></td>";
		html +=" 						</tr>			";	 		
		html +="	 					</tbody>";
		html +="</table>";
		
		
		makeTwoBtnPopup(1, "고객등록", html, true, 600, 600, function(){
			//등급조회
			$.ajax({
				type : "post", // 전송방식
				url : "CheckCsmrGradeAjax", //주소
				dataType : "json", //데이터 형태
				success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
					if(res.result == "success"){
						var html = "";
						
						for(var i = 0; i < res.gradelist.length ; i++){
							 html += "<option value=\"" + res.gradelist[i].GRADE_NO + "\">" + res.gradelist[i].GRADE_NAME + "</option>";
						}
						
						$(".select_grade").html(html); 
						
					}else{
						alert("조회중 문제 발생 1");
					}
				},
				error : function(request, status, error) { //실행 중 에러 발생 시
					console.log("txt : " + request.responseText); // 반환텍스트
					console.log("error : " + error); // 에러내용
					//예외 처리 할 거라 에러 날 일 업음
				}
			});
			
		$(".search_cstmr_cmpny").on("click", function(){
					var html2 = "";
					html2 +=" <form action=\"searchcstmrcmpny\" id=\"actionForm\" method=\"post\">";
					html2 +=" <input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\"/>"
					html2 +=" <input type=\"text\" class=\"search_cmpny_txt\" id=\"search_cmpny_txt\" name=\"search_cmpny_txt\"/><input type=\"button\" class=\"search_cmpny_btn\" value=\"검색\"/>";
					html2 +=" <table class=\"search_cmpny\">";
					html2 +="	<thead>";
					html2 +="		<tr>";
					html2 +="			<th>번호</th>";
					html2 +="			<th>고객사</th>";
					html2 +="			<th>대표연락처</th>";
					html2 +="			<th>대표팩스</th>";
					html2 +="			<th>대표이메일</th>";
					html2 +="			<th>주소</th>";
					html2 +="		</tr>";
					html2 +="	</thead>";
					html2 +="	<tbody>";
					html2 +="		<tr name=고객사>";
					html2 +="			<td id=\"cstmrcmpnyno\" name=\"cstmrcmpnyno\">null</td>";
					html2 +="			<td id=\"cstmrcmpnyname\" name=\"cstmrcmpnyname\">null</td>";
					html2 +="			<td id=\"cmpnycntct\" name=\"cmpnycntct\">null</td>";
					html2 +="			<td id=\"cstmrfax\" name=\"cstmrfax\">null</td>";
					html2 +="			<td id=\"cstmremail\" name=\"cstmremail\">null</td>";
					html2 +="			<td id=\"cstmradrs\" name=\"cstmradrs\">null</td>";
					html2 +="		</tr>";
					html2 +="	</tbody>";
					html2 +=" </table>";
					html2 +=" <div class=\"searchpaging\">";
					html2 +=" <div class=\"searchpagingD\" id=\"first2\" name=\"1\"></div>";
					html2 +=" <div class=\"searchpagingD\" id=\"before2\" name=\"1\"></div>";
					html2 +=" <div class=\"searchpagingD\" name=\"1\"><b>1</b></div>";
					html2 +=" <div class=\"searchpagingD\" id=\"next2\" name=\"1\"></div>";
					html2 +=" <div class=\"searchpagingD\" id=\"last2\" name=\"1\"></div>";
					html2 +=" </div>";
					html2 +=" </form>";
					
			makeOneBtnPopup(2, "고객사 검색", html2, true, 1000, 400, function(){
				if("${param.page}" !=""){
					$("#page").val("${param.page}");
				}
				if("${param.search_cmpny_txt}" != ""){
					$("#search_cmpny_txt").val("${param.search_cmpny_txt}");
				}
			
				
				reloadCmpnyList();
				
				$(".searchpaging").on("click", "div", function(){
					$("#page").val($(this).attr("name")); // 클릭한게 네임으로 들어감
					reloadCmpnyList();
				})
				
				$(".search_cmpny_btn").on("click", function(){
					$("#page").val("1");
					reloadCmpnyList();
				});

				$("[name='search_cmpny_txt']").on("keypress", function(){
					if(event.keyCode == 13){
						$(".search_cmpny_btn").click();
						return false;
					}
				});
				
				$(".search_cmpny tbody").on("click", "tr", function(){
					
					console.log($(this).children().eq(0).html());
					console.log($(this).children().eq(1).html());
					console.log($(this).children().eq(2).html());
					console.log($(this).children().eq(3).html());
					console.log($(this).children().eq(4).html());
					console.log($(this).children().eq(5).html());
					
					$("#cstmrcmpnyno2").val($(this).children().eq(0).html());
					$("#search_cstmr_cmpny").val($(this).children().eq(1).html());
					$("#cstmr_cntct").val($(this).children().eq(2).html());
					$("#cstmr_cmpny_fax").val($(this).children().eq(3).html());
					$("#cstmr_cmpny_email").val($(this).children().eq(4).html());
					$("#cstmr_cmpny_adrs").val($(this).children().eq(5).html());
					
					closePopup(2);
				})
		}, "취소", function() {
			closePopup(2);	
			});
		});
		
			
		}, "저장", function(){
			if($.trim($("#cstmr").val()) == ""){
				alert("고객을 입력하세요.")
			}else if($.trim($("#cntct").val()) == ""){
				alert("연락처를 입력하세요.")
			}else if($.trim($("#Cpstn").val()) == ""){
				alert("직책을 입력하세요.")
			}else if($.trim($("#Cemail").val()) == ""){
				alert("이메일을 입력하세요.")
			}else if($.trim($("#Cdptmnt").val()) == ""){
				alert("부서를 입력하세요.")
			}else if($.trim($("#search_cstmr_cmpny").val()) == ""){
				alert("고객사를 입력하세요.")
			}else{
				
			var params = $("#insertcstmrForm").serialize();
			console.log(params);
			
				$.ajax({
					type : "post", // 전송방식
					url : "cstmrAddAjax", //주소
					dataType : "json", //데이터 형태
					data : params,   //보낼데이터
					success :function(res) { // 성공시  다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
						console.log(params);
						if(res.result=="success"){
							$("#page").val("1");
							reloadList();
							closePopup(1);
						}else{
							alert("등록 중 오류 발생");
						}
					},
					error : function(request, status, error) { //실행 중 에러 발생 시
						console.log("txt : " + request.responseText); // 반환텍스트
						console.log("error : " + error); // 에러내용
						//예외 처리 할 거라 에러 날 일 업음
						
					}
				});	//ajax의 기본 형태
				
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
	
	$(".paging").on("click", "div", function(){
		$("#page").val($(this).attr("name")); // 클릭한게 네임으로 들어감
		reloadList();
	})
	
	
});

function reloadList(){
	var params = $("#actionForm").serialize();
	$.ajax({
			type : "post", // 전송방식
			url : "CSTMRListAjax", //주소
			dataType : "json", //데이터 형태
			data : params,   //보낼데이터
			success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
				if(res.result == "success"){
					redrawList(res.list);
					redrawPaging(res.pb);
				}else{
					alert("조회중 문제 발생2");
				}
			},
			error : function(request, status, error) { //실행 중 에러 발생 시
				console.log("txt : " + request.responseText); // 반환텍스트
				console.log("error : " + error); // 에러내용
				//예외 처리 할 거라 에러 날 일 업음
				
			}
			
			
	});
}

function redrawList(list){
	
	if(list.length == 0){
		var html = "";
		html += "<tr>";
		html += "<td colspan=\"7\">조회결과가 없습니다.</td>";
		html += "</tr>";
		
		$(".check_cstmr tbody").html(html);
	}else{
		var html = "";
		
		for(var i = 0; i < list.length ; i++){
			 html += "<tr name=\"" + list[i].CSTMR_NO + "\" >";
			 html += "<td>"+ list[i].CSTMR_NO + "</td>";
			 html += "<td>"+ list[i].CSTMR_NAME + "</td>";
			 html += "<td>"+ list[i].CSTMR_CMPNY_NAME + "</td>";
			 html += "<td>"+ list[i].PSTN + "</td>";
			 html += "<td>"+ list[i].CNTCT + "</td>";
			 html += "<td>"+ list[i].EMPLY_NAME + "</td>";
			 html += "<td>"+ list[i].RGSTRTN_DATE + "</td>";
			 html += "</tr>";
		}
		$(".check_cstmr tbody").html(html); 
		// html로 갈아엎음
	}
}
	
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









/* 등록할때 */


function reloadCmpnyList(){
	var params = $("#actionForm").serialize();
	console.log(params);
		$.ajax({
			type : "post", // 전송방식
			url : "searchCSTMRcmpnyListAjax", //주소
			dataType : "json", //데이터 형태
			data : params,   //보낼데이터
			success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
				
				if(res.result == "success"){
					redrawCstmrList(res.cmpnylist);
					redrawCstmrPaging(res.pb);
				}else{
					alert("조회중 문제 발생3");
				}
			},
			error : function(request, status, error) { //실행 중 에러 발생 시
				console.log("txt : " + request.responseText); // 반환텍스트
				console.log("error : " + error); // 에러내용
				//예외 처리 할 거라 에러 날 일 업음
				
			}
			
			
	});
}

function redrawCstmrList(cmpnylist){
	console.log(cmpnylist);
	if(cmpnylist.length == 0){
		var html2 = "";
		html2 += "<tr>";
		html2 += "<td colspan=\"5\">조회결과가 없습니다.</td>";
		html2 += "</tr>";
		
		$(".search_cmpny tbody").html(html2);
	}else{
		var html2 = "";
		
		for(var i = 0; i < cmpnylist.length ; i++){
			 html2 += "<tr name=\"" + cmpnylist[i].CSTMR_CMPNY_NO + "\" >";
			 html2 += "<td>"+ cmpnylist[i].CSTMR_CMPNY_NO + "</td>";
			 html2 += "<td>"+ cmpnylist[i].CSTMR_CMPNY_NAME + "</td>";
			 html2 += "<td>"+ cmpnylist[i].CMPNY_CNTCT + "</td>";
			 html2 += "<td>"+ cmpnylist[i].FAX + "</td>";
			 html2 += "<td>"+ cmpnylist[i].EMAIL + "</td>";
			 html2 += "<td>"+ cmpnylist[i].ADRS + "</td>";
			 html2 += "</tr>";
		}
		$(".search_cmpny tbody").html(html2); 
		// html로 갈아엎음
	}
};
function redrawCstmrPaging(pb){
	
	var html ="<div class=\"searchpagingD\" id=\"first2\" name=\"1\"></div>&nbsp;";
	
		if($("#page").val()=="1"){
			html += "<div class=\"searchpagingD\" id=\"before2\" name=\"1\"></div>&nbsp;";
		}else{
			html +="<div class=\"searchpagingD\" id=\"before2\" name=\""+ ($("#page").val()* 1 - 1)+"\"></div>&nbsp;";
		}
		
		for(var i = pb.startPcount ; i <= pb.endPcount ; i++){
			if(i == $("#page").val()){
				html +="<div class=\"searchpagingD\" name=\"" + i + "\"><b>" + i + "</b></div>&nbsp;";
			}else{
				html +="<div class=\"searchpagingD\" name=\"" + i + "\">" + i + "</div>&nbsp;";
			}
		}
		
		if($("#page").val()== pb.maxPcount){
			html += "<div class=\"searchpagingD\" id=\"next2\" name=\""+ pb.maxPcount + "\"></div>&nbsp;";
		}else{
			html +="<div class=\"searchpagingD\" id=\"next2\" name=\"" + ($("#page").val()* 1 + 1)+"\"></div>&nbsp;";
		}
		
		html += "<div class=\"searchpagingD\" id=\"last2\" name=\"" + pb.maxPcount + "\"></div>";
		
		$(".searchpaging").html(html);
		
}


</script>
</head>
<body>
<!-- 탑/레프트 -->
<c:import url="/topLeft">
<%-- 현재 페이지 해당 메뉴번호 지정 --%>
	<c:param name="menuNo" value="28"></c:param>
</c:import>
<!-- 구현내용 -->
<div class="title_wrap">
	<div class="title_table">
		<div class="title_txt">고객 관리</div>
	</div>
</div>
<div class="contents_area">
	<!-- 내용은 여기에 구현하세요. -->
<form action="cstmrMngmnt" id="actionForm" method="post">
<input type="hidden" name="page" id="page" value="1"/>
<input type="hidden" name="cstmrno" id="cstmrno" value="1"/>
	<br/>			
					<select class="select_cus" name="select_cus">
								<option value="0">전체</option>
								<option value="1">고객사</option>
								<option value="2">고객</option>
								<option value="3">담당자</option>
					</select> 
	<input type="text" class="search_cus" name="search_cus" id="search_cus"><input type="button" class="searchBtn_cus"><input type="button" value="등록" class="addBtn">
</form>
			<!-- 내용은 여기에 구현하세요. -->
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
						<col class="pstn">
						<col class="date">
					</colgroup>
				
					<thead>
						<tr>
							<th>No</th>
							<th>고객</th>
							<th>고객사</th>
							<th>직책</th>
							<th>전화번호</th>
							<th>담당자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="7">NULL</td>
						</tr>
					</tbody>
				</table>


		<div class="paging">
			<div class="pagingD" id="first" name="1"></div>
			<div class="pagingD" id="before" name="1"></div>
			<div class="pagingD" name="1"><b>1</b></div>
			<div class="pagingD" id="next" name="1"></div>
			<div class="pagingD" id="last" name="1"></div>
		</div>
			</div>
		</div>
	</div>
</div>
<!-- 구현끝 -->
<!-- 바텀 -->
<c:import url="/bottom"></c:import>
</body>
</html>