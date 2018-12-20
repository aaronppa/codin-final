$(function () {
	// 수정 전 화면에서 숨기기
	$(".member__span--mod-yes").hide();
	
	// 반려동물 추가 버튼을 누르면 반려동물을 추가할 수 있는 폼으로 이동
	$("#pet-add").click(function () {
		location.href = `${APPLICATION_PATH}/pet/petAddForm.do`;
	});
	
	// 반려동물 추가 버튼을 누르면 반려동물을 추가할 수 있는 폼으로 이동
	$("#vet-add").click(function () {
		location.href = `${APPLICATION_PATH}/hos/search.do`;
	});
	
	// 펫 상세 페이지 이동하기
	$(".pet-info > img").click(function () {
		var petNo = $(this).parent().data("pet-no")
		location.href = `${APPLICATION_PATH}/pet/petDetail.do?petNo=${petNo}`;
	});
	
	// 내 정보 수정 버튼 클릭시 수정 화면 보이는 처리
	$("#memberModFormBtn").click(function () {
		$(".member-mod").removeClass("form__input--mod").prop("disabled", false);
		$(".member__span--mod-show, .member__span--mod-yes").toggle();
		$(".member--img-hide").show();
	});
	// 내 정보 수정 버튼 클릭시 수정 화면 보이는 처리
	$("#memberModCancelBtn").click(function () {
		$(".member-mod").addClass("form__input--mod").prop("disabled", true);
		$(".member__span--mod-show, .member__span--mod-yes").toggle();
		$(".member--img-hide").hide();
		
		// memInfo : JSP에서 생성하는 객체임
		console.dir(memInfo);
		
		$("input[name='memberPhone']").val(memInfo.phone);
		$("input[name='memberNickname']").val(memInfo.nickname);
		$("#profile").attr("src", memInfo.imgSrc);
	});
	
	// 파일 변경 시 이미지 미리 보기
	$("input[name='file']").change(function (event) {
    	var file = event.target.files[0];
    	
    	if (file.type == false) return false;
    	
    	if (file.type.substring(0, 5) != 'image') {
    		alert("이미지를 선택하세요");
    		return false;
    	}
    	if (file.size > 100 * 1024) {
    		alert("100kb 미만의 파일을 선택하세요");
    		return false;
    	}
    	
        var reader = new FileReader();
        reader.onload = function(){
    	    $('#profile').attr("src", reader.result);
        };
        reader.readAsDataURL(file);
	});
	
	$("#memberModBtn").click(function () {
		// 폼의 데이터를 처리할 수 있는 스크립트 객체
		var fd = new FormData($("#memberInfoForm")[0]);
		$.ajax({
			url: `${APPLICATION_PATH}/member/updatemember.do`,
			data: fd,
			type: "POST",
			processData: false,
			contentType: false,
			success: function (data) {
				console.dir(data)
				memInfo.phone = data.memberPhone;
				memInfo.nickname = data.memberNickname;
				memInfo.imgSrc = `${APPLICATION_PATH}/upload/${data.memberFilePath}/${data.memberSysName}`;
				$("#memberModCancelBtn").click();
			}
		});
		
	});
	
	// 패스워드 변경 모달창 처리
	$("#passModBtn").click(function () {
		
		var currentPass = $("input[name='currentPassword']");
		var newPass = $("input[name='newPassword']");
		var confirmPass = $("input[name='confirmPassword']");
		
		if (currentPass.val() == "") {
			alert("현재 패스워드를 입력하세요");
			currentPass.focus();
			return;
		}
		
		if (newPass.val() == "") {
			alert("변경할 패스워드를 입력하세요");
			newPass.focus();
			return;
		}
		
		if (confirmPass.val() == "") {
			alert("패스워드 확인을 입력하세요");
			confirmPass.focus();
			return;
		}
		
		if (newPass.val() != confirmPass.val()) {
			alert("변경할 패스워드를 확인하세요");
			confirmPass.val("");
			confirmPass.focus();
			return;
		}
		
		
		// 폼의 데이터를 처리할 수 있는 스크립트 객체
		var fd = new FormData($("#memberInfoForm")[0]);
		$.ajax({
			url: `${APPLICATION_PATH}/member/updatepassword.do`,
			data: {
				password: currentPass.val(),
				newPassword: newPass.val()
			},
			type: "POST",
			success: function (data) {
				console.dir(data)
				
				if (data == 1) {
					$.notify("패스워드가 변경되었습니다.", {position:"top right", autoHideDelay: 2000} );
					$("#passModal").modal("hide");
				} else {
					$.notify("패스워드가 잘못 입력되었습니다.", {position:"top right", autoHideDelay: 2000} );
//					alert("사용중인 패스워드가 올바르지 않습니다.");
				}
			}
		});
	});
	
	// 수의사 약력 수정
	$("#memberCareer").blur(function () {
		let career = $(this);
		console.dir(memInfo);
		// 변경된 내용이 없을 경우 취소
		if (memInfo.career == career.html()) return;
		
		$.ajax({
			url: `${APPLICATION_PATH}/member/updatecareer.do`,
			data: {
				memberCareer: career.html()
			},
			type: "POST",
			success: function (data) {
				$.notify("약력정보가 변경되었습니다.", {position:"top right", autoHideDelay: 2000} );
				memInfo.career = career.html();
			    if (career.html()) {
			    	career.removeClass("career--edit");
				}
			    else {
			    	career.addClass("career--edit");
			    }
			},
			error: function () {
				career.html(memInfo.career);
				$.notify("처리중 에러가 발생했습니다.", {position:"top right", autoHideDelay: 2000} );
			}
		});
	});
	
	// 병원찾기 모달창에서 병원이름을 선택한 경우
	$(".hos--list").on("click", "li", function () {
		console.log($(this).data("hosno"));
		$(this).siblings().removeClass("active");
		$(this).toggleClass("active");
	});
	
	// 병원명 검색 Ajax 처리
	$("#hosTitle").keyup(function () {
		if ($(this).val() == "") {
			$(".hos--list > ul").empty();
			return;
		}
		
		$.ajax({
			url: `${APPLICATION_PATH}/member/retrieve-hospital.do`,
			data: {
				title: $(this).val(),
			},
			success: function (data) {
				var hosUL = $(".hos--list > ul");
				hosUL.empty();
				for (let hos of data) {
					console.dir(hos)
					hosUL.append(`<li data-hosno="${hos.hosCode}" data-hosRegister="${hos.hosRegister}">${hos.title}</li>`);
				}
			}
		});
	});
	
	// 병원등록 모달창 닫기
	$("#hosCloseBtn").click(function () {
		$("#hosTitle").val("");
		$(".hos--list > ul").empty();
		$("#hosRegModal").modal("hide");
	});
	
	// 병원등록 - 모달창
	$("#hosRegBtn").click(function () {
		// 목록에서 선택한 병원
		var selectHos = $(".hos--list > ul > li.active");
		
		// 선택한 병원의 이름
		var hosTitle = selectHos.text();
			
		// 선택한 병원의 병원코드
		var hosNo = selectHos.data("hosno");
		if (hosNo == undefined) {
			alert("등록할 병원을 선택하세요");
			return;
		}

		// 선택한 병원 CSS 클래스 삭제
		$(".hos--list > ul > li").removeClass("active");
		
		$.ajax({
			url: `${APPLICATION_PATH}/member/hosreg.do`,
			data: {
				hosCode: hosNo
			},
			success: function (data) {
				$("#hosTitleSpan").text(hosTitle);
				$.notify("병원이 등록되었습니다.", {position:"top right", autoHideDelay: 2000} );
				$("#hosTitle").val("");
				$(".hos--list > ul").empty();
				$("#hosRegModal").modal("hide");
			}
		});
	});
	
	// 신규 병원 등록 시 팝업창 발생
	$("#newHos").click(function(e) {
		e.preventDefault();
		
		window.open("/myvet/hos/register.do", "newHos", "width=1400, height=700, location=no");
	})
})













