<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
</head>
<body>
<div id="wrap">
    <c:import url="/inc/header.jsp"></c:import>
    <div id="container_wrap">
        <div id="container">
            <div id="contents_top" class="contents_top1">
                <div>
                    <h2>회사소개</h2>
                    <span>Introduction</span>
                </div>
            </div>
            <div id="tit1">
                <h3>오시는 길</h3>
            </div>
            <div class="section2">
                <dl>
                    <dt>회사주소</dt>
                    <dd>전북 익산시 무왕로31길 254</dd>
                </dl>
                <dl>
                    <dt>대표전화</dt>
                    <dd>063-834-8072</dd>
                </dl>
                <dl>
                    <dt>팩스번호</dt>
                    <dd>063-834-8073</dd>
                </dl>
            </div>
            <div class="section3">
                <div id="daumRoughmapContainer1552918876719" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                <script charset="UTF-8">
                    new daum.roughmap.Lander({
                        "timestamp" : "1552918876719",
                        "key" : "snu5",
                        "mapWidth" : "1000",
                        "mapHeight" : "360"
                    }).render();
                </script>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>