<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
<script>
$(function(){
    $(".certi_list input").click(function(){
        var new_src = $(this).prop("class");
        $(".certi_view img").prop("src","/img/business/" + new_src + ".png");
        $(".certi_view").fadeIn();
    });
});
</script>
</head>
<body>
<div id="wrap">
    <c:import url="/inc/header.jsp"></c:import>
    <div id="container_wrap">
        <div id="container">
            <div id="contents_top" class="contents_top1">
                <div>
                    <h2>사업안내</h2>
                    <span>Business</span>
                </div>
            </div>
            <div id="tit1">
                <h3>허가·인증</h3>
            </div>
            <div class="section7 certi_list">
                <ul>
                    <li>
                        <input type="button" value="인증서" class="certi1">
                        <span>계룡환경 사업자등록증</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi2">>
                        <span>건설폐기물수집·운반업 허가증</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi3">>
                        <span>화물자동차운송사업 허가증</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi4">>
                        <span>계룡환경산업 사업자등록증</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi5">>
                        <span>폐기물수집·운반업 허가증</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi6">>
                        <span>화물자동차운송사업 허가증</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi7">>
                        <span>비계·구조물해체공사업 등록증</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi8">>
                        <span>석면해체·제거업자 등록증</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi9">>
                        <span>석면해체·제거사업장 관리감독자 수료증 - 이창록</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi10">>
                        <span>석면해체·제거 관리자<br> 수료증 - 이창록</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi11">>
                        <span>석면해체·제거사업장 관리감독자 수료증 - 최성규</span>
                    </li>
                    <li>
                        <input type="button" value="인증서" class="certi12">>
                        <span>석면해체·제거 관리자<br> 수료증 - 최성규</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
    <div class="popup certi_view">
        <div class="bg"></div>
        <div class="view">
            <input type="button" value="닫기" class="popup_close">
            <img src="/img/business/certi1.png">
        </div>
    </div>
</div>
</body>
</html>