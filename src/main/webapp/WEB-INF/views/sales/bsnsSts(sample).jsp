<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vanilla ERP 영업현황</title>
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/main.css" />
<!-- 레이아웃 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/layout.css" />
<!-- 메뉴 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/menu.css" />
<!-- 팝업 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<!-- 게시판 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/board.css" />
<!-- 영업현황 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/sales/bsnsSts.css" />

<!-- jQuery JS -->
<script type="text/javascript" src="resources/jquery-1.12.4.min.js"></script>
<!-- slimscroll JS -->
<script type="text/javascript" src="resources/jquery.slimscroll.js"></script>
<!-- Main JS -->
<script type="text/javascript" src="resources/script/common/main.js"></script>
<!-- Main JS -->
<script type="text/javascript" src="resources/script/common/popup.js"></script>

<style type="text/css">
</style>

<script type="text/javascript">
	$(document).ready(function() {
		/* makeAlert(1, "Information", "정보내용!!!", null);
		makeOneBtnPopup(2, "팝업제목", "이거슨내용임", true, 400, 500, null, "확인용", function() {
			closePopup(2);
		});
		makeTwoBtnPopup(3, "팝업제목2", "이거슨내용임22", true, 400, 500, null, "바꾸기", function() {
			popupBtnChange(4, 1, "바꿔!", function() {
				popupContentsChange(4, "내용도바꿔~", null);
			});
		}, "확인용", function() {
			closePopup(3);
		}); */
	});
</script>
</head>
<body>
	<!-- 팝업 -->
	<!-- <div class="popup_wrap">
<div class="popup_bg"></div>
	<div class="popup">
		<div class="con">
			<div class="con_title"><div class="con_title_txt">팝업 제목</div></div>
			<div class="con_con">팝업 내용</div>
		</div>
		<div class="bottom_bar">
			<div class="popup_btn"><div class="popup_btn_txt">저장</div></div>
			<div class="popup_btn"><div class="popup_btn_txt">저장</div></div>
			<div class="popup_btn"><div class="popup_btn_txt">닫기</div></div>
		</div>
	</div>
</div> -->
	<div class="top_area">
		<div class="logo_wrap">
			<div class="logo_table">
				<div class="logo">anilla ERP</div>
			</div>
		</div>
		<div class="gnb_wrap">
			<div class="gnb_table">
				<div class="gnb">Home > 영업 > 영업현황</div>
			</div>
		</div>
		<div class="info_wrap">
			<div class="info_table">
				<div class="info">
					<img class="user_photo" alt="사진" src="images/no_image.png" />
					<div class="info_txt">조한규(영업부 대리)</div>
				</div>
			</div>
		</div>
		<div class="opt_btn_wrap">
			<div class="opt_btn_table">
				<div class="opt_btn">
					<img class="config_btn" alt="설정" src="images/config.png" /> <img
						class="logoff_btn" alt="로그오프" src="images/logoff.png" />
				</div>
			</div>
		</div>
	</div>
	<div class="middle_wrap">
		<div class="left_area">
			<div class="menu1_wrap">
				<div class="menu1_on">
					<div class="menu1_txt_bg"></div>
					<div class="menu1_txt_wrap">
						<div class="menu1_txt_table">
							<div class="menu1_txt">그룹웨어</div>
						</div>
					</div>
					<div class="menu2_wrap">
						<div class="menu2_on" next="true">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">전자결재</div>
								</div>
							</div>
							<div class="menu3_wrap">
								<div class="menu3_on">
									<div class="menu3_txt_bg"></div>
									<div class="menu3_txt_wrap">
										<div class="menu3_txt_table">
											<div class="menu3_txt">새 결재 작성</div>
										</div>
									</div>
								</div>
								<div class="menu3">
									<div class="menu3_txt_bg"></div>
									<div class="menu3_txt_wrap">
										<div class="menu3_txt_table">
											<div class="menu3_txt">임시보관함</div>
										</div>
									</div>
								</div>
								<div class="menu3">
									<div class="menu3_txt_bg"></div>
									<div class="menu3_txt_wrap">
										<div class="menu3_txt_table">
											<div class="menu3_txt">수신함</div>
										</div>
									</div>
								</div>
								<div class="menu3">
									<div class="menu3_txt_bg"></div>
									<div class="menu3_txt_wrap">
										<div class="menu3_txt_table">
											<div class="menu3_txt">발신함</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="menu2">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">게시판</div>
								</div>
							</div>
						</div>
						<div class="menu2">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">일정</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="menu1">
					<div class="menu1_txt_bg"></div>
					<div class="menu1_txt_wrap">
						<div class="menu1_txt_table">
							<div class="menu1_txt">인사</div>
						</div>
					</div>
					<div class="menu2_wrap">
						<div class="menu2">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">인사기록카드</div>
								</div>
							</div>
						</div>
						<div class="menu2">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">휴가</div>
								</div>
							</div>
						</div>
						<div class="menu2">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">급여</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 영업  -->
				<div class="menu1">
					<div class="menu1_txt_bg"></div>
					<div class="menu1_txt_wrap">
						<div class="menu1_txt_table">
							<div class="menu1_txt">영업</div>
						</div>
					</div>
					<div class="menu2_wrap">
						<div class="menu2">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">영업현황</div>
								</div>
							</div>
						</div>
						<div class="menu2">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">고객관리</div>
								</div>
							</div>
							
						</div>
						<div class="menu2">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">영업일정</div>
								</div>
							</div>
						</div>
						<div class="menu2">
							<div class="menu2_txt_bg"></div>
							<div class="menu2_txt_wrap">
								<div class="menu2_txt_table">
									<div class="menu2_txt">매출관리</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="right_area">
			<div class="title_wrap">
				<div class="title_table">
					<div class="title_txt">영업현황</div>
				</div>
			</div>
			<div class="contents_area">
				<!-- 내용은 여기에 구현하세요. -->
				<h3><p style="text-align:center;">고객사 진행현황</p></h3>				
					<div class="tbl1">
					<select class="select">
						<option>고객사</option>
						<option>담당자</option>
						<option>기회</option>
						<option>제안</option>
						<option>협상</option>
						<option>수주</option>
					</select> 
					<input type="text" class="search">
					<input type="button" class="searchBtn"> 
					<table class="bs">
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
					<div class="bspaging">
					<div class="bspagingD" id="bsfirst"></div>
					<div class="bspagingD" id="bsbefore"></div>
					<div class="bspagingD"><b>1</b></div>
					<div class="bspagingD">2</div>
					<div class="bspagingD">3</div>
					<div class="bspagingD">4</div>
					<div class="bspagingD">5</div>
					<div class="bspagingD" id="bsnext"></div>
					<div class="bspagingD" id="bslast"></div>
				</div>
				</div>

				
				<h3><p style="text-align:center;">단계별 성공확률</p></h3>				
				<table class="bs2">
				<thead> 
				<tr>
				<th>단계 </th>
				<th>성공확률 </th>
				</tr>
				</thead>
				<tbody>
				<tr>
				<td class="기회t">기회</td>
				<td> <div class="기회">기회그래프</div> </td>
				
				</tr>
				<tr>
				<td class="제안t">제안</td>
				<td> <div class="제안">제안그래프</div> </td>
				</tr>
				<tr>
				<td class="협상t">협상</td>
				<td> <div class="협상">협상그래프</div> </td>
				</tr>
				<tr>
				<td class="수주t">수주</td>
				<td> <div class="수주">수주그래프</div> </td>
				</tr>
				
				</tbody>
				</table>
				
				</div>
			</div>
		</div>
</body>
</html>