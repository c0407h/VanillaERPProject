<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function() {
	getMenu();
});

function getMenu() {
	var params = $("#locationForm").serialize();
	
	$.ajax({
		type : "post",
		url : "commonGetMenuAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			drawMenu(result.leftMenu, result.boardList, result.depth, result.flow);			
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function drawMenu(leftMenu, boardList, depth, flow) {
	var gnbHtml = "Home";
	
	var html = "";
	
	html += "<div class=\"menu1_wrap\">";
	//1Level Menu
	for(var i in leftMenu) {
		if(leftMenu[i].MENU_LEVEL == 1) {
			if(flow.indexOf("" + leftMenu[i].MENU_NO) != -1) {
				gnbHtml += " > " + leftMenu[i].MENU_NAME;
				html += "<div class=\"menu1_on\">";
			} else {
				html += "<div class=\"menu1\">";
			}
			
			html += "<div class=\"menu1_txt_bg\"></div>";
			html += "<div class=\"menu1_txt_wrap\">";
			html += "<div class=\"menu1_txt_table\">";
			html += "<div class=\"menu1_txt\" mno=\"" + leftMenu[i].MENU_NO + "\"";
			
			//주소할당
			if(leftMenu[i].CNT == 0) {
				html += "adrs=\"" + leftMenu[i].ADRS + "\"";
			}
			
			html += ">";
			html += leftMenu[i].MENU_NAME
			html += "</div>";
			html += "</div>";
			html += "</div>";
			
			if(leftMenu[i].CNT > 0) {
				//2LevelMenu
				html += "<div class=\"menu2_wrap\">";
				for(var j in leftMenu) {
					if(leftMenu[j].MENU_LEVEL == 2 && leftMenu[i].MENU_NO == leftMenu[j].TOP_MENU_NO) {
						if(flow.indexOf("" + leftMenu[j].MENU_NO) != -1) {
							gnbHtml += " > " + leftMenu[j].MENU_NAME;
							html += "<div class=\"menu2_on\"";
							
							if(leftMenu[j].CNT > 0) {
								html += " next=\"true\""
							}
							
							html += ">";
						} else {
							html += "<div class=\"menu2\"";
							
							if(leftMenu[j].CNT > 0) {
								html += " next=\"true\""
							}
							
							html += ">";
						}
						
						html += "<div class=\"menu2_txt_bg\"></div>";
						html += "<div class=\"menu2_txt_wrap\">";
						html += "<div class=\"menu2_txt_table\">";
						html += "<div class=\"menu2_txt\" mno=\"" + leftMenu[j].MENU_NO + "\"";
						
						//주소할당
						if(leftMenu[j].CNT == 0) {
							html += "adrs=\"" + leftMenu[j].ADRS + "\"";
						}
						
						html += ">";
						html += leftMenu[j].MENU_NAME
						html += "</div>";
						html += "</div>";
						html += "</div>";
						
						if(leftMenu[j].CNT > 0) {
							//3LevelMenu
							html += "<div class=\"menu3_wrap\">";
							
							for(var k in leftMenu) {
								if(leftMenu[k].MENU_LEVEL == 3 
											&& leftMenu[j].MENU_NO == leftMenu[k].TOP_MENU_NO) {
									if(flow.indexOf("" + leftMenu[k].MENU_NO) != -1) {
										gnbHtml += " > " + leftMenu[k].MENU_NAME;
										html += "<div class=\"menu3_on\">";
									} else {
										html += "<div class=\"menu3\">";
									}
									
									html += "<div class=\"menu3_txt_bg\"></div>";
									html += "<div class=\"menu3_txt_wrap\">";
									html += "<div class=\"menu3_txt_table\">";
									html += "<div class=\"menu3_txt\" mno=\"" + leftMenu[k].MENU_NO + "\" adrs=\"" + leftMenu[k].ADRS + "\">";
									html += leftMenu[k].MENU_NAME
									html += "</div>";
									html += "</div>";
									html += "</div>";
									html += "</div>";
								}
							}
							
							html += "</div>";
						} else if(leftMenu[j].MENU_NO == 9) { // 게시판
							if(boardList.length > 0) {
								//3Level Board
								html += "<div class=\"menu3_wrap\">";
								for(var k in boardList) {
										if($("#boardNo").val() == boardList[k].BOARD_NO) {
											gnbHtml += " > " + boardList[k].BOARD_NAME;
											html += "<div class=\"menu3_on\">";
										} else {
											html += "<div class=\"menu3\">";
										}
										
										html += "<div class=\"menu3_txt_bg\"></div>";
										html += "<div class=\"menu3_txt_wrap\">";
										html += "<div class=\"menu3_txt_table\">";
										html += "<div class=\"menu3_txt\" adrs=\"board\" bno=\"" + boardList[k].BOARD_NO + "\">";
										html += boardList[k].BOARD_NAME
										html += "</div>";
										html += "</div>";
										html += "</div>";
										html += "</div>";
								} // board for end
								
								html += "</div>";
							} 
						
						} // 3Level & board if
						
						html += "</div>";
					} //
				} // 2Level for end
				html += "</div>";
			} // 2Level end
			
			html += "</div>";
		}
	}
	
	html += "</div>";
	
	$(".gnb").html(gnbHtml);
	$(".menu1_wrap").html(html);
}
</script>
<form action="#" method="post" id="locationForm">
	<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
	<input type="hidden" id="boardNo" name="boardNo" value="${param.boardNo}" />
</form>
<div class="top_area">
	<div class="logo_wrap">
		<div class="logo_table">
			<div class="logo">anilla ERP</div>
		</div>
	</div>
	<div class="gnb_wrap">
		<div class="gnb_table">
			<div class="gnb">Home</div>
		</div>
	</div>
	<div class="info_wrap">
		<div class="info_table">
			<div class="info">
			<c:choose>
				<c:when test="${empty sPhtgr}">
					<img class="user_photo" alt="사진" src="resources/images/common/no_image.png" /><div class="info_txt">${sEmplyName}(${sDprtmntName} ${sPstnName})</div>
				</c:when>
				<c:otherwise>
					<img class="user_photo" alt="사진" src="resources/images/upload/${sPhtgr}" /><div class="info_txt">${sEmplyName}(${sDprtmntName} ${sPstnName})</div>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
	<div class="opt_btn_wrap">
		<div class="opt_btn_table">
			<div class="opt_btn">
				<img class="config_btn" alt="설정" src="resources/images/common/config.png" />
				<img class="logoff_btn" alt="로그오프" src="resources/images/common/logoff.png" />
			</div>
		</div>
	</div>
</div>
<div class="middle_wrap">
	<div class="left_area">
		<div class="menu1_wrap"></div>
	</div>
	<div class="right_area">