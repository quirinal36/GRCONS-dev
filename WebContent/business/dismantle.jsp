<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
    <script type="text/javascript">
        $(function(){
          $('.slider1').bxSlider({
            mode: "fade",
            pager: false,
            captions: true
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
                <h3>철거</h3>
                <p>숙련된 인력과 최신 장비를 보유하고 있으며 오랜 철거 경험으로 전문성 있는 공사가 가능합니다.</p>
            </div>
            <div class="slider1_wrap section8">
                <div class="slider1">
                    <div><img src="/img/business/dismantle1.png"></div>
                    <div><img src="/img/business/dismantle2.png"></div>
                    <div><img src="/img/business/dismantle3.png"></div>
                    <div><img src="/img/business/dismantle4.png"></div>
                    <div><img src="/img/business/dismantle5.png"></div>
                    <div><img src="/img/business/dismantle6.png"></div>
                    <div><img src="/img/business/dismantle7.png"></div>
                </div>
            </div>
            <div class="section9">
                <a href="/record/record.jsp">공사실적 더 보기 +</a>
            </div>
            <c:import url="/inc/ask.jsp"></c:import>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>