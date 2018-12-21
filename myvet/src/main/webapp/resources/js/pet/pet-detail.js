/**
 * 펫 상세정보
 */
$(function () {
	
});

$(".viewChart").click(function(e) {
	e.preventDefault();
	
	window.open("/myvet/hos/chartPet.do?bookingNo="+$(this).attr("href"),
			"chartPet",
			"width=800, height=800, location=no")

})