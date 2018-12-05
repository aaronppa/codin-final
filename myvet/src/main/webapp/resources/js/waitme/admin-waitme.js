console.log("waitme beforeAjax boardtype:", boardType);

$(document).ajaxStart(boardType, function(boardType){
	console.log("waitme boardtype:", boardType);
			location.href="#"+boardType+"header";
			$("tbody#"+boardType+"list").waitMe({
				effect:"orbit",
				text: "loading...",
				bg: "rgba(255,255,255,0.7",
				color: "#000"
			});
		}).ajaxStop(boardType, function(){
			$("tbody#"+boardType+"list").waitMe("hide");
});