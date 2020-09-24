/**
 * Main Javascript
 */
$(document).ready(function() {
	$(".contents_area").slimScroll();
	
	$(".left_area").on("click", ".menu1, .menu2, .menu3", function() {
		$(".menu1_txt_bg, .menu2_txt_bg, .menu3_txt_bg").stop();
		
		$(".menu1_txt_bg, .menu2_txt_bg, .menu3_txt_bg").css("width", "");
		
		switch($(this).attr("class")) {
		case "menu1" :
			$(".menu1_on").attr("class", "menu1");
			$(".menu2_on").attr("class", "menu2");
			$(".menu3_on").attr("class", "menu3");
			$(this).attr("class", $(this).attr("class") + "_on");
			break;
		case "menu2" : 
			$(".menu2_on").attr("class", "menu2");
			$(".menu3_on").attr("class", "menu3");
			$(this).attr("class", $(this).attr("class") + "_on");
			break;
		case "menu3" : 
			$(".menu3_on").attr("class", "menu3");
			$(this).attr("class", $(this).attr("class") + "_on");
			break;
		}
	});
	
	$(".left_area").on("click", ".menu1_txt, .menu2_txt, .menu3_txt", function() {
		if($(this).is("[adrs]")) {
			console.log($(this).attr("adrs"));
			if($(this).is("[mno]")) {
				$("#menuNo").val($(this).attr("mno"));
			}
			
			if($(this).is("[bno]")) {
				$("#boardNo").val($(this).attr("bno"));
			}
			
			$("#locationForm").attr("action", $(this).attr("adrs"));
			$("#locationForm").submit();
		}		
	});
	
	$(".left_area").on("mouseenter", ".menu1_txt, .menu2_txt, .menu3_txt", function() {
		var mVal = "";
		
		switch($(this).attr("class")) {
		case "menu1_txt" : mVal = "240px";
			break;
		case "menu2_txt" : mVal = "235px"; 
			break;
		case "menu3_txt" : mVal = "230px";
			break;
		}
		
		if($(this).parent().parent().parent().attr("class").indexOf("_on") == -1) {
			$(this).parent().parent().parent().children("." + $(this).attr("class") + "_bg").animate({
				width : mVal
			}, 100);
		}
	}).on("mouseleave", ".menu1_txt, .menu2_txt, .menu3_txt", function() {
		var mVal = "250px";
		
		if($(this).parent().parent().parent().attr("class").indexOf("_on") == -1) {
			$(this).parent().parent().parent().children("." + $(this).attr("class") + "_bg").animate({
				width : mVal
			}, 100);
		}
	});
	
	$(".config_btn").on("click", function() {
		location.href = "";
	});
	
	$(".logoff_btn").on("click", function() {
		location.href = "logoff";
	});
});