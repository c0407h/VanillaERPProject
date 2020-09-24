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
<link rel="stylesheet" type="text/css" href="resources/css/sales/detailCstmr.css" />

<script type="text/javascript">
$(document).ready(function(){ 
	
	 $(".ChangeBtn").on("click", function(){
		
		var html = "";
		html +="<form action=\"detailCstmr\" id=\"actionForm\" method=\"post\">";
		html +="	<input type=\"hidden\" name=\"cstmrno\" value=\"${param.cstmrno}\">"
		html +="	<input type=\"hidden\" name=\"emplyno2\" id=\"emplyno2\">"
		html +=" 				<table class=\"updatecstmr\">";
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
		html +=" 							<td><input type=\"text\" class=\"inputtxt2\" id=\"empy\" value=\"${data.EMPLY_NAME}\" disabled /><input type=\"button\" class=\"search_emply\" value=\"검색\"/></td>";
		html +=" 							<th>부서/직책</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"pstn\" value=\"${data.DPRTMNT_NAME}/${data.PSTN_NAME}\" disabled/></td>";
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
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrname\" name=\"cstmrname\" value=\"${data.CSTMR_NAME}\" disabled/></td>";
		html +=" 							<th>연락처</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrcntct\" name=\"cstmrcntct\" value=\"${data.CNTCT}\" /></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>직책</th>";	
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrpstn\" name=\"cstmrpstn\" value=\"${data.PSTN}\"/></td>";
		html +=" 							<th>이메일</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmremail\" name=\"cstmremail\" value=\"${data.CSTMREMAIL}\"/></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>부서</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrdprtmnt\" name=\"cstmrdprtmnt\" value=\"${data.DPRTMNT}\"/></td>";
		html +=" 							<th>등급</th>";
		html +=" 							<td><select class=\"select_cstmrgrade\" name=\"select_cstmrgrade\"><option value=\"1\">A</option><option value=\"2\">B</option><option value=\"3\">C</option><option value=\"4\">D</option><option value=\"5\">E</option></select></td>";
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
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrcmpnyname\" name=\"cstmrcmpnyname\" value=\"${data.CSTMR_CMPNY_NAME}\" disabled/></td>";
		html +=" 							<th>대표연락처</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrcmpnycntct\" name=\"cstmrcmpnycntct\" value=\"${data.CMPNY_CNTCT}\"disabled/></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>대표팩스</th>";	
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrcmpnyfax\" name=\"cstmrcmpnyfax\" value=\"${data.FAX}\" disabled/></td>";
		html +=" 							<th>대표이메일</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrcmpnyemail\" name=\"cstmrcmpnyemail\" value=\"${data.CMPNYEMAIL}\" disabled/></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>주소</th>";
		html +=" 							<td colspan=\"3\"><input type=\"text\" class=\"inputaddtxt\" id=\"cstmrcmpnyadrs\" name=\"cstmrcmpnyadrs\" value=\"${data.ADRS}\" disabled/></td>";
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
		html +="	 					</tbody>";
		html +="	</table>";
		html +="</form>";
		
		makeTwoBtnPopup(1, "고객수정", html, true, 600, 600, function(){
			
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
						
						$(".select_cstmrgrade").html(html); 
						
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
			
			 $(".search_emply").on("click", function(){ 
				 var html3 ="";
				 
				 html3 +=" <form action=\"searchEmply\" id=\"actionForm\" method=\"post\">			";
				 html3 +=" <input type=\"hidden\" name=\"page\" id=\"page\" value=\"1\"/> 			";
				 html3 +=" <input type=\"text\" class=\"search_Emply\" id=\"search_Emply\" name=\"search_Emply\"/><input type=\"button\" class=\"search_emplyBtn\" value=\"검색\"/>";
				 html3 +="	<table class=\"searchEmply\">											";
				 html3 +="	<thead>																	";
				 html3 +="		<tr>																";
				 html3 +="			<th>이름</th>														";
				 html3 +="			<th>부서</th>														";
				 html3 +="			<th>직책</th>														";
				 html3 +="		</tr>																";
				 html3 +="	</thead>																";
				 html3 +="	<tbody>																	";
				 html3 +="		<tr>																";
				 html3 +="			<td id=\"emplyName\" name=\"emplyName\">null</td>				";
				 html3 +="			<td id=\"emplyDprt\" name=\"emplyDprt\">null</td>				";
				 html3 +="			<td id=\"pnst\" name=\"pnst\">null</td>							";
				 html3 +="		</tr>																";
				 html3 +="	</tbody>																";
				 html3 +=" </table>																	";
				 html3 +=" <div class=\"searchpaging\">												";
				 html3 +=" <div class=\"searchpagingD\" id=\"first2\" name=\"1\"></div>				";
				 html3 +=" <div class=\"searchpagingD\" id=\"before2\" name=\"1\"></div>			";
				 html3 +=" <div class=\"searchpagingD\" name=\"1\"><b>1</b></div>					";
				 html3 +=" <div class=\"searchpagingD\" id=\"next2\" name=\"1\"></div>				";
				 html3 +=" <div class=\"searchpagingD\" id=\"last2\" name=\"1\"></div>				";
				 html3 +=" </div>																	";
				 html3 +="</form>																	";
		 
					 makeOneBtnPopup(2, "담당자 검색", html3, true, 400, 400, function(){
							if("${param.page}" !=""){
								$("#page").val("${param.page}");
							}
							if("${param.search_Emply}" != ""){
								$("#search_Emply").val("${param.search_Emply}");
							}
							
							/*  리로드 들어가야하는부분 */
							loadEmplyList();
							
							$(".searchpaging").on("click", "div", function(){
								$("#page").val($(this).attr("name")); // 클릭한게 네임으로 들어감
								loadEmplyList();
							})
							
							$(".search_emplyBtn").on("click", function(){
								$("#page").val("1");
								loadEmplyList();/* 다시만든리로드들어가야함   */
							});

							$("[name='search_Emply']").on("keypress", function(){
								if(event.keyCode == 13){
									$(".search_emplyBtn").click();
									return false;
								}
							});
							
							$(".searchEmply tbody").on("click", "tr", function(){
								
								console.log($(this).children().eq(0).html());
								console.log($(this).children().eq(1).html());
								console.log($(this).children().eq(2).html());
								
								
								
								$("#empy").val($(this).children().eq(0).html());
								$("#pstn").val($(this).children().eq(1).html()+"/"+$(this).children().eq(2).html());
								$("#emplyno2").val($(this).attr("name"));
								closePopup(2);
							
							})
							
							
							
					 }, "취소", function(){
						 closePopup(2);	
						});
			 }); /* 고객 수정시 담당자 검색 */
			 
			 
		
		}, "저장", function(){
			
			var params = $("#actionForm").serialize();
			console.log(params);
			$.ajax({
				type : "post", // 전송방식
				url : "DetailCSTMRUpdateAjax", //주소
				dataType : "json", //데이터 형태
				data : params,   //보낼데이터
				success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
					
					
					if(res.result == "success"){
						location.reload();
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
			
			
			
			
			
			
		}, "취소", function() {
			closePopup(1);
		});
		
	});
	
	
	
	$(".BackBtn").on("click", function(){
	
		$("#actionForm").attr("action", "cstmrMngmnt");
		$("#actionForm").submit();
	});
	
	
	
	$(".DelBtn").on("click", function(){
		if(confirm("삭제 하시겠습니까?")){
			var params = $("#actionForm").serialize();	
			console.log(params);
			$.ajax({
				type : "post", // 전송방식 
				url : "CSTMRDelAjax", //주소
				dataType : "json", //데이터 형태
				data : params,   //보낼데이터
				success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
					if(res.result == "seccess"){
						location.ref = "cstmrMngmnt";
					}else if(res.result == "fail"){
						alert("삭제정보가 옳바르지 않습니다.")
					}else{
						alert("삭제 중 문제 발생!")
					}
					
				},
				error : function(request, status, error) { //실행 중 에러 발생 시
					console.log("txt : " + request.responseText); // 반환텍스트
					console.log("error : " + error); // 에러내용
					//예외 처리 할 거라 에러 날 일 업음
					
				}
				
		});
			
			
			$("#actionForm").attr("action", "cstmrMngmnt");
			$("#actionForm").submit();
			
		}
	});
	
}); 




/* 담당자 검색하여 넣어줄때  */


function loadEmplyList(){
	var params = $("#actionForm").serialize();
	console.log(params);
		$.ajax({
			type : "post", // 전송방식
			url : "searchEmplyMngmntAjax", //주소
			dataType : "json", //데이터 형태
			data : params,   //보낼데이터
			success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
				
				if(res.result == "success"){
					redrawEmplyMngmntList(res.Emplylist);
					redrawEmplyMngmntPaging(res.pb);
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

function redrawEmplyMngmntList(Emplylist){
	console.log(Emplylist);
	if(Emplylist.length == 0){
		var html3 = "";
		html3 += "<tr>";
		html3 += "<td colspan=\"3\">조회결과가 없습니다.</td>";
		html3 += "</tr>";
		
		$(".searchEmply tbody").html(html3);
	}else{
		var html3 = "";
		
		for(var i = 0; i < Emplylist.length ; i++){
			 html3 += "<tr name=\"" + Emplylist[i].EMPLY_NO + "\" >";
			 html3 += "<td>" + Emplylist[i].EMPLY_NAME +"</td>";
			 html3 += "<td>" + Emplylist[i].PSTN_NAME  + "</td>";
			 html3 += "<td>" + Emplylist[i].DPRTMNT_NAME +"</td>";
			 html3 += "</tr>";
		}
		$(".searchEmply tbody").html(html3); 
		// html로 갈아엎음
	}
};
function redrawEmplyMngmntPaging(pb){
	
	var html3 ="<div class=\"searchpagingD\" id=\"first2\" name=\"1\"></div>&nbsp;";
	
		if($("#page").val()=="1"){
			html3 += "<div class=\"searchpagingD\" id=\"before2\" name=\"1\"></div>&nbsp;";
		}else{
			html3 +="<div class=\"searchpagingD\" id=\"before2\" name=\""+ ($("#page").val()* 1 - 1)+"\"></div>&nbsp;";
		}
		
		for(var i = pb.startPcount ; i <= pb.endPcount ; i++){
			if(i == $("#page").val()){
				html3 +="<div class=\"searchpagingD\" name=\"" + i + "\"><b>" + i + "</b></div>&nbsp;";
			}else{
				html3 +="<div class=\"searchpagingD\" name=\"" + i + "\">" + i + "</div>&nbsp;";
			}
		}
		
		if($("#page").val()== pb.maxPcount){
			html3 += "<div class=\"searchpagingD\" id=\"next2\" name=\""+ pb.maxPcount + "\"></div>&nbsp;";
		}else{
			html3 +="<div class=\"searchpagingD\" id=\"next2\" name=\"" + ($("#page").val()* 1 + 1)+"\"></div>&nbsp;";
		}
		
		html3 += "<div class=\"searchpagingD\" id=\"last2\" name=\"" + pb.maxPcount + "\"></div>";
		
		$(".searchpaging").html(html3);
		
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
		<div class="title_txt">고객 조회</div>
	</div>
</div>
<div class="contents_area">
	<!-- 내용은 여기에 구현하세요. -->
	<div class="Btnarea">
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="cstmrno" value="${param.cstmrno}">
	</form>
		<input type="button" value="목록" class="BackBtn"/>
	
	<!-- 작성자번호(BM_NO)와 세션에 저장된 작성자번호(sBmNo)가 같으면 수정 버튼이 나오게 하는 것. -->
		<c:if test="${sEmplyNo eq data.EMPLY_NO}">
				<input type="button" value="수정" class="ChangeBtn"/>
				<input type="button" value="삭제" class="DelBtn"/>
		</c:if>
	</div>

	<div class="tbl2">
				<table class="detailcstmr">
					<colgroup>
						<col width="150px">
						<col width="250px">
						<col width="150px">
						<col width="200px">
					</colgroup>
					<thead></thead>
					<tbody>
						<tr height="40px">
							<th>작성자</th>
							<td>${data.EMPLY_NAME}</td>
							<th>부서/직책</th>
							<td>${data.DPRTMNT_NAME}/${data.PSTN_NAME}</td>						
						</tr>
						<tr class="empty">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr height="8px">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr height="40px">
							<th>고객</th>
							<td>${data.CSTMR_NAME}</td>
							<th>연락처</th>
							<td>${data.CNTCT}</td>
						</tr>
						<tr height="40px">
							<th>직책</th>
							<td>${data.PSTN}</td>
							<th>이메일</th>
							<td>${data.CSTMREMAIL}</td>
						</tr>
						<tr height="40px">
							<th>부서</th>
							<td>${data.DPRTMNT}</td>
							<th>등급</th>
							<td>${data.GRADE_NAME}</td>
						</tr>
					
						<tr class="empty">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr height="8px">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr height="40px">
							<th>고객사</th>
							<td>${data.CSTMR_CMPNY_NAME}</td>
							<th>대표연락처</th>
							<td>${data.CMPNY_CNTCT}</td>
						</tr>
						<tr height="40px">
							<th>대표 팩스</th>
							<td>${data.FAX}</td>
							<th>대표이메일</th>
							<td>${data.CMPNYEMAIL}</td>
						</tr>
						<tr height="40px">
							<th>주소</th>
							<td colspan="3">${data.ADRS}</td>
						</tr>
						<tr class="empty">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
							<tr height="8px">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
		
			</div>
	
	
</div>

<!-- 구현끝 -->
<!-- 바텀 -->
<c:import url="/bottom"></c:import>
</body>
</html>