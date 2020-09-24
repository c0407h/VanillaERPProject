/**
 * popup.js
 * create date : 2020.06.24
 * create by : YS.Lee
 */

/**
 * makeAlert(depth, title, contents)
 * : 알림창 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 배경유무
 * event - 팝업 닫을 시 이벤트(없을경우 null입력)
 */
function makeAlert(depth, title, contents, bgFlag, event) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		html += "<div class=\"popup_wrap\" id=\"popupWrap" + depth + "\">";
		
		if(bgFlag) {
			html += "<div class=\"popup_bg\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"popup\" id=\"popup" + depth + "\">";
		html += "<div class=\"con\">";
		html += "<div class=\"con_title\"><div class=\"con_title_txt\">";
		html += title;
		html += "</div></div>";
		html += "<div class=\"con_con\">";
		html += contents;
		html += "</div>";
		html += "</div>";
		html += "<div class=\"bottom_bar\">";
		html += "<div class=\"popup_btn\"><div class=\"popup_btn_txt\" id=\"popup" + depth + "BtnOne\">확인</div></div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		$("#popupWrap" + depth).css("z-index", depth * 100);
		$("#popupWrap" + depth + " > .popup_bg").css("z-index", depth * 110);
		$("#popupWrap" + depth + " > .popup").css("z-index", depth * 111);
		$("#popupWrap" + depth + " > .popup").css("width", "300px");
		$("#popupWrap" + depth + " > .popup").css("height", "220px");
		$("#popupWrap" + depth + " > .popup").css("left", "calc(50% - 150px)");
		$("#popupWrap" + depth + " > .popup").css("top", "calc(50% - 110px)");
		
		$("#popupWrap" + depth).hide();
		
		$("#popupWrap" + depth).fadeIn("fast");
		

		$("#popup" + depth + "BtnOne").off("click");
		$("#popup" + depth + "BtnOne").on("click", function(){
			if(event != null) {
				event.call();
			}
			
			closePopup(depth);
		});

		$("#popupWrap" + depth + " .popup_bg").off("click");
		$("#popupWrap" + depth + " .popup_bg").on("click", function(){
			closePopup(depth);
		});
	}
}

/**
 * makeOneBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent, btnOneTitle, btnOneEvent)
 * : 팝업 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 백그라운드 존재여부(true : 존재, flase : 비존재)
 * contentsEvent - 내용 추가이벤트(없을경우 null입력)
 * btnOneTitle - 버튼1 텍스트
 * btnOneEvent - 버튼1 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 */
function makeOneBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent, btnOneTitle, btnOneEvent) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		html += "<div class=\"popup_wrap\" id=\"popupWrap" + depth + "\">";
		
		if(bgFlag) {
			html += "<div class=\"popup_bg\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"popup\" id=\"popup" + depth + "\">";
		html += "<div class=\"con\">";
		html += "<div class=\"con_title\"><div class=\"con_title_txt\">";
		html += title;
		html += "</div></div>";
		html += "<div class=\"con_con\">";
		html += contents;
		html += "</div>";
		html += "</div>";
		html += "<div class=\"bottom_bar\">";
		html += "<div class=\"popup_btn\"><div class=\"popup_btn_txt\" id=\"popup" + depth + "BtnOne\">"
		html += btnOneTitle;
		html += "</div></div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		
		
		if(contentsEvent != null) {
			contentsEvent.call();
		}
		
		$("#popupWrap" + depth).css("z-index", depth * 100);
		$("#popupWrap" + depth + " > .popup_bg").css("z-index", depth * 110);
		$("#popupWrap" + depth + " > .popup").css("z-index", depth * 111);
		$("#popupWrap" + depth + " > .popup").css("width", width + "px");
		$("#popupWrap" + depth + " > .popup").css("height", height + "px");
		$("#popupWrap" + depth + " > .popup").css("left", "calc(50% - " + (width / 2) + "px)");
		$("#popupWrap" + depth + " > .popup").css("top", "calc(50% - " + (height / 2) + "px)");
		
		$("#popupWrap" + depth).hide();
		
		$("#popupWrap" + depth).fadeIn("fast");
		

		$("#popup" + depth + "BtnOne").off("click");
		$("#popup" + depth + "BtnOne").on("click", function(){
			if(btnOneEvent != null) {
				btnOneEvent.call();
			}
		});

		if(bgFlag) {
			$("#popup" + depth + "Bg").off("click");
			$("#popup" + depth + "Bg").on("click", function(){
				closePopup(depth);
			});
		}
	}
}
 
/**
 * makeTwoBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent, btnOneTitle, btnOneEvent, btnTwoTitle, btnTwoEvent)
 * : 팝업 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 백그라운드 존재여부(true : 존재, flase : 비존재)
 * contentsEvent - 내용 추가이벤트(없을경우 null입력)
 * btnOneTitle - 버튼1 텍스트
 * btnOneEvent - 버튼1 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 */
function makeTwoBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent, btnOneTitle, btnOneEvent, btnTwoTitle, btnTwoEvent) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		html += "<div class=\"popup_wrap\" id=\"popupWrap" + depth + "\">";
		
		if(bgFlag) {
			html += "<div class=\"popup_bg\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"popup\" id=\"popup" + depth + "\">";
		html += "<div class=\"con\">";
		html += "<div class=\"con_title\"><div class=\"con_title_txt\">";
		html += title;
		html += "</div></div>";
		html += "<div class=\"con_con\">";
		html += contents;
		html += "</div>";
		html += "</div>";
		html += "<div class=\"bottom_bar\">";
		html += "<div class=\"popup_btn\"><div class=\"popup_btn_txt\" id=\"popup" + depth + "BtnOne\">"
		html += btnOneTitle;
		html += "</div></div>";
		html += "<div class=\"popup_btn\"><div class=\"popup_btn_txt\" id=\"popup" + depth + "BtnTwo\">";
		html += btnTwoTitle;
		html += "</div></div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		
		
		if(contentsEvent != null) {
			contentsEvent.call();
		}
		
		$("#popupWrap" + depth).css("z-index", depth * 100);
		$("#popupWrap" + depth + " > .popup_bg").css("z-index", depth * 110);
		$("#popupWrap" + depth + " > .popup").css("z-index", depth * 111);
		$("#popupWrap" + depth + " > .popup").css("width", width + "px");
		$("#popupWrap" + depth + " > .popup").css("height", height + "px");
		$("#popupWrap" + depth + " > .popup").css("left", "calc(50% - " + (width / 2) + "px)");
		$("#popupWrap" + depth + " > .popup").css("top", "calc(50% - " + (height / 2) + "px)");
		
		$("#popupWrap" + depth).hide();
		
		$("#popupWrap" + depth).fadeIn("fast");
		

		$("#popup" + depth + "BtnOne").off("click");
		$("#popup" + depth + "BtnOne").on("click", function(){
			if(btnOneEvent != null) {
				btnOneEvent.call();
			}
		});

		$("#popup" + depth + "BtnTwo").off("click");
		$("#popup" + depth + "BtnTwo").on("click", function(){
			if(btnTwoEvent != null) {
				btnTwoEvent.call();
			}
		});
		
		if(bgFlag) {
			$("#popup" + depth + "Bg").off("click");
			$("#popup" + depth + "Bg").on("click", function(){
				closePopup(depth);
			});
		}
	}
}
/**
 * makeThreeBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent, 
 *		             btnOneTitle, btnOneEvent, btnTwoTitle, btnTwoEvent, btnThreeTitle, btnThreeEvent)
 * : 팝업 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 백그라운드 존재여부(true : 존재, flase : 비존재)
 * contentsEvent - 내용 추가이벤트(없을경우 null입력)
 * btnOneTitle - 버튼1 텍스트
 * btnOneEvent - 버튼1 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 */
function makeThreeBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent, 
						   btnOneTitle, btnOneEvent, btnTwoTitle, btnTwoEvent, btnThreeTitle, btnThreeEvent) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		html += "<div class=\"popup_wrap\" id=\"popupWrap" + depth + "\">";
		
		if(bgFlag) {
			html += "<div class=\"popup_bg\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"popup\" id=\"popup" + depth + "\">";
		html += "<div class=\"con\">";
		html += "<div class=\"con_title\"><div class=\"con_title_txt\">";
		html += title;
		html += "</div></div>";
		html += "<div class=\"con_con\">";
		html += contents;
		html += "</div>";
		html += "</div>";
		html += "<div class=\"bottom_bar\">";
		html += "<div class=\"popup_btn\"><div class=\"popup_btn_txt\" id=\"popup" + depth + "BtnOne\">"
		html += btnOneTitle;
		html += "</div></div>";
		html += "<div class=\"popup_btn\"><div class=\"popup_btn_txt\" id=\"popup" + depth + "BtnTwo\">";
		html += btnTwoTitle;
		html += "</div></div>";
		html += "<div class=\"popup_btn\"><div class=\"popup_btn_txt\" id=\"popup" + depth + "BtnThree\">";
		html += btnThreeTitle;
		html += "</div></div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		
		
		if(contentsEvent != null) {
			contentsEvent.call();
		}
		
		$("#popupWrap" + depth).css("z-index", depth * 100);
		$("#popupWrap" + depth + " > .popup_bg").css("z-index", depth * 110);
		$("#popupWrap" + depth + " > .popup").css("z-index", depth * 111);
		$("#popupWrap" + depth + " > .popup").css("width", width + "px");
		$("#popupWrap" + depth + " > .popup").css("height", height + "px");
		$("#popupWrap" + depth + " > .popup").css("left", "calc(50% - " + (width / 2) + "px)");
		$("#popupWrap" + depth + " > .popup").css("top", "calc(50% - " + (height / 2) + "px)");
		
		$("#popupWrap" + depth).hide();
		
		$("#popupWrap" + depth).fadeIn("fast");
		

		$("#popup" + depth + "BtnOne").off("click");
		$("#popup" + depth + "BtnOne").on("click", function(){
			if(btnOneEvent != null) {
				btnOneEvent.call();
			}
		});

		$("#popup" + depth + "BtnTwo").off("click");
		$("#popup" + depth + "BtnTwo").on("click", function(){
			if(btnTwoEvent != null) {
				btnTwoEvent.call();
			}
		});

		$("#popup" + depth + "BtnThree").off("click");
		$("#popup" + depth + "BtnThree").on("click", function(){
			if(btnThreeEvent != null) {
				btnThreeEvent.call();
			}
		});
		
		if(bgFlag) {
			$("#popup" + depth + "Bg").off("click");
			$("#popup" + depth + "Bg").on("click", function(){
				closePopup(depth);
			});
		}
	}
}

/**
 * closePopup(depth)
 * : 팝업 닫기
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 */
function closePopup(depth) {
	$("#popupWrap" + depth).fadeOut("fast", function(){
		$("#popupWrap" + depth).remove();
	});
}

/**
 * popupCheck(depth)
 * : 팝업 존재여부
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 */
function popupCheck(depth) {
	if($("#popupWrap" + depth).length > 0) {
		return true;
	} else {
		return false;
	}
}

 /**
  * popupContentsChange(depth, contents, contentsEvent)
  * : 팝업 존재여부
  * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
  * contents - 내용
  * contentsEvent - 내용 추가이벤트(없을경우 null입력)
  */
 function popupContentsChange(depth, contents, contentsEvent) {
 	$("#popup" + depth + " .con_con").html(contents);
 	
 	if(contentsEvent != null) {
 		contentsEvent.call();
 	}
 }

 /**
  * popupBtnChange(depth, type, btnText, btnEvent)
  * : 팝업 존재여부
  * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
  * type - 버튼타입 (1 - 3번)
  * btnText - 버튼 텍스트
  * btnEvent - 버튼 변경 이벤트(없을경우 null입력)
  */
 function popupBtnChange(depth, type, btnText, btnEvent) {
 	if(type == 1) {
 		$("#popup" + depth + "BtnOne").html(btnText);
 		
 		if(btnEvent != null) {
 			$("#popup" + depth + "BtnOne").off("click");
 			$("#popup" + depth + "BtnOne").on("click", function(){
 				if(btnEvent != null) {
 					btnEvent.call();
 				}
 			});
 		}
 	} else if(type == 2) {
 		$("#popup" + depth + "BtnTwo").html(btnText);
 		
 		if(btnEvent != null) {
 			$("#popup" + depth + "BtnTwo").off("click");
 			$("#popup" + depth + "BtnTwo").on("click", function(){
 				if(btnEvent != null) {
 					btnEvent.call();
 				}
 			});
 		}
 	} else if(type == 3) {
 		$("#popup" + depth + "BtnThree").html(btnText);
 		
 		if(btnEvent != null) {
 			$("#popup" + depth + "BtnThree").off("click");
 			$("#popup" + depth + "BtnThree").on("click", function(){
 				if(btnEvent != null) {
 					btnEvent.call();
 				}
 			});
 		}
 	}
}