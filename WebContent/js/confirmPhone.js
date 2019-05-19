function confirm_phone() {
	var phone = $("input[name='phone']").val();
	
	// 전화번호 형태가 맞는지 검사
	var regex = new RegExp(/[0-9]{3}[-\s\.]{0,1}[0-9]{3,4}[-\s\.]{0,1}[0-9]{4}/g);
	var isPhone = regex.test(phone);
	phone = RegExp.lastMatch;
	
	var left = RegExp.leftContext;
	var right = RegExp.rightContext;
	
	if(isPhone == false){
		if(jscd.browser.indexOf('msie') != -1 && parseInt(jscd.browserMajorVersion) < 11){
			alert("전화번호를 입력해주세요");
		}else{
			toast({text : "전화번호를 입력해주세요"});
		}
		return false;
	}else if(left.length + right.length > 0){
		if(jscd.browser.indexOf('msie') != -1 && parseInt(jscd.browserMajorVersion) < 11){
			alert("올바른 전화번호 형식이 아닙니다. 다시 확인해 주세요.");
		}else{
			toast({
				text : "올바른 전화번호 형식이 아닙니다. 다시 확인해 주세요."
			});
		}
		return false;
	}else{
		return true;
	}
}
