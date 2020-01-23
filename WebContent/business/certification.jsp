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
            <div id="contents_top" class="contents_top2">
                <div>
                    <h2>사업안내</h2>
                    <span>Business</span>
                </div>
            </div>
            <div id="tit1">
                <h3>허가·인증</h3>
                <input type="button" value="추가" onclick="window.location.replace('/business/certification/write.jsp')"/>
            </div>
            <div class="section7 certi_list">
                <ul>
                	<%for(int i=0; i<5; i++) {%>
	                    <li>
	                        <img src="/img/business/certi1.png"  class="certi1"/>
	                        <span>계룡환경 사업자등록증</span>
	                    </li>
                    <%} %>
                </ul>
            </div>
            <c:import url="/inc/ask.jsp"></c:import>
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