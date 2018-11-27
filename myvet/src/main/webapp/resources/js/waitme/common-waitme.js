$(document).ajaxStart(function(){
			$("body").waitMe({
				effect:"orbit",
				text: "loading...",
				bg: "rgba(255,255,255,0.7",
				color: "#000"
			});
		}).ajaxStop(function(){
			$("body").waitMe("hide");
});