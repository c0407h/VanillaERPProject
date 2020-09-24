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
<link rel="stylesheet" type="text/css" href="resources/css/sales/detailcstmrCmpny.css" />

<script type="text/javascript">
$(document).ready(function(){
	
	$(".ChangeBtn").on("click", function(){
		
		var html = "";
		html +="<form action=\"detailcstmrCmpny\" id=\"actionForm\" method=\"post\">";
		html +="	<input type=\"hidden\" name=\"cstmrcmpnyno\" value=\"${param.cstmrcmpnyno}\">"
		html +=" 				<table class=\"updatecstmrcm\">";
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
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"empy\" value=\"${sEmplyName}\" disabled /></td>";
		html +=" 							<th>부서/직책</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"pstn\" value=\"${sDprtmntName}/${sPstnName}\" disabled/></td>";
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
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmrname\" name=\"cstmrname\" value=\"${data.CSTMR_CMPNY_NAME}\" disabled/></td>";
		html +=" 							<th>사업자등록번호</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"crprtrgstrtnno\" name=\"crprtrgstrtnno\" value=\"${data.CRPRT_RGSTRTN_NO}\" disabled/></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>대표</th>";	
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"rprsntv\" name=\"rprsntv\" value=\"${data.RPRSNTV}\"/></td>";
		html +=" 							<th>대표연락처</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cmpnycntct\" name=\"cmpnycntct\" value=\"${data.CMPNY_CNTCT}\"/></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>주소</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"adrs\" name=\"adrs\" value=\"${data.ADRS}\"/></td>";
		html +=" 							<th>등급</th>";
		html +=" 							<td><select class=\"select_grade\" name=\"select_grade\"><option value=\"1\">A</option><option value=\"2\">B</option><option value=\"3\">C</option><option value=\"4\">D</option><option value=\"5\">E</option></select></td>";
		html +=" 						</tr>";
		html +=" 						<tr height=40px>";
		html +=" 							<th>팩스</th>";
		html +=" 							<td><input type=\"text\" class=\"inputtxt\" id=\"cstmr_cmpny_fax\" name=\"cstmr_cmpny_fax\" value=\"${data.FAX}\"/></td>";
		html +=" 							<th>유형</th>";
		html +=" 							<td><select class=\"select_type\" name=\"select_type\"></select></th>";
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
		
		makeTwoBtnPopup(1, "고객사수정", html, true, 600, 600, function(){
			
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
			var params = $("#actionForm").serialize();
			console.log(params);
			$.ajax({
				type : "post", // 전송방식
				url : "CSTMRCMPNYUpdateAjax", //주소
				dataType : "json", //데이터 형태
				data : params,   //보낼데이터
				success :function(res) { // 성공시 다음 함수를 실행하며, 돌아오는 값을  res라는 이름으로 받는다
					
					console.log(params)
					
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
		$("#actionForm").attr("action", "cstmrCmpnyMngmnt");
		$("#actionForm").submit();
	});
	
	
});




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
		<div class="title_txt">고객사 조회</div>
	</div>
</div>
<div class="contents_area">
	<!-- 내용은 여기에 구현하세요. -->
	<div class="Btnarea">
	
		<input type="button" value="목록" class="BackBtn"/>
	
	<!-- 작성자번호(BM_NO)와 세션에 저장된 작성자번호(sBmNo)가 같으면 수정 버튼이 나오게 하는 것. -->
		<c:if test="${sEmplyNo eq data.EMPLY_NO}">
				<input type="button" value="수정" class="ChangeBtn"/>
		</c:if>
	</div>
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="cstmrcmpnyno" value="${param.cstmrcmpnyno}"> 
		<input type="hidden" name="page" value="${param.page}"> 
	</form>
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
						<tr height="40px">
							<th>연락처</th>
							<td>${data.CLPHN_NO}</td>
							<th>이메일</th>
							<td>${data.EMAIL}</td>
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
							<th>사업자등록번호</th>
							<td>${data.CRPRT_RGSTRTN_NO}</td>
						</tr>
						<tr height="40px">
							<th>대표</th>
							<td>${data.RPRSNTV}</td>
							<th>대표연락처</th>
							<td>${data.CMPNY_CNTCT}</td>
						</tr>
						<tr height="40px">
							<th>주소</th>
							<td>${data.ADRS}</td>
							<th>등급</th>
							<td>${data.GRADE_NAME}</td>
						</tr>
						<tr height="40px">
							<th>팩스</th>
							<td>${data.FAX}</td>
							<th>유형</th>
							<td>${data.CSTMR_CMPNY_TYPE_NAME}</td>
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