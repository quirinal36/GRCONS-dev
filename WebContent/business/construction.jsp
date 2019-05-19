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
                <h3>건축</h3>
                <p>설계부터 입주까지 세심한 노력을 기울여 아름답고 안전한 공간을 창조합니다.</p>
            </div>
            <div class="slider1_wrap section8">
                <div class="slider1">
                    <div><img src="/img/business/cons1.png" title="화산 화평 주택 신축공사"></div>
                    <div><img src="/img/business/cons2.png" title="화산 화평 카페 신축공사"></div>
                    <div><img src="/img/business/cons3.png" title="부송동 공장 신축공사"></div>
                    <div><img src="/img/business/cons4.png" title="화산 수락 주택 신축공사"></div>
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