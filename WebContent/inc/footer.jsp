<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

function formSubmit(){
	var param = "login="+$("input[name='login']").val();
	param = param +"&password="+$("input[name='password']").val();
	
	$.ajax({
		type : "POST",
		url  : "/user/login.jsp",
		data : param,
		success : function(result){
			console.log("result:"+ result);
			var json = JSON.parse(result);
			if(json.result > 0){
				$(".popup_login").fadeOut();
				window.location.href = $("input[name='url']").val();
			}else{
				$(".error").show();
			}
		},error: function(data, status){
			console.log("error: "+data);
		}
	});
}
</script>
<div id="footer">
    <ul>
        <li>대표 : 하재일</li>
        <li>사업자등록번호 : 712-81-00645</li>
        <li>법인등록번호 : 214914-0032206</li>
        <li>면허번호 : 안산 2017-06-01</li>
    </ul>
    <ul>
        <li>전화번호 : 063-834-8072</li>
        <li>팩스번호 : 063-834-8073</li>
        <li>주소 : [54547] 전라북도 익산시 무왕로31길 254</li>
    </ul>
    <p>Copyright 2019 계룡건설 주식회사. All rights reserved.</p>
</div>
<div class="popup popup_login">
    <div class="bg"></div>
    <div class="view">
        <input type="button" value="닫기" class="popup_close">
        <strong>로그인</strong>
        
            <input type="text" name="login" placeholder="아이디를 입력하세요.">
            <input type="password" name="password" placeholder="비밀번호를 입력하세요.">
            <p class="error" style="display:none;">아이디 또는 비밀번호를 확인해주세요.</p>
            <input type="submit" value="로그인" onclick="javascript:formSubmit();">
        	<input type="hidden" value="${pageContext.request.requestURL }" name="url"/>
    </div>
</div>