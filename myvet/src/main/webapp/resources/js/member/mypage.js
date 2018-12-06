$(function () {
	
	// 반려동물 추가 버튼을 누르면 반려동물을 추가할 수 있는 폼으로 이동
	$("#pet-add").click(function () {
		location.href = `${APPLICATION_PATH}/pet/petAddForm.do`;
	});
	
	$("#nickChangeBtn").click(function () {
		console.dir($(this).prev());
	});
	
	// 펫 상세 페이지 이동하기
	$(".pet-info > img").click(function () {
		var petNo = $(this).parent().data("pet-no")
		console.log("클릭됨...", petNo)
		
		location.href = `${APPLICATION_PATH}/pet/petDetail.do?petNo=${petNo}`;
	});
})