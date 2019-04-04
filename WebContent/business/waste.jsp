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
            <div id="contents_top" class="contents_top1">
                <div>
                    <h2>사업안내</h2>
                    <span>Business</span>
                </div>
            </div>
            <div id="tit1"> 
                <h3>폐기물</h3>
                <p>계룡건설 주식회사는 건설폐기물을 수집 및 운반하는 정식허가업체입니다.</p>
            </div>
            <div class="slider1_wrap section8">
                <div class="slider1">
                    <div><img src="/img/business/waste1.png" title="익산문화체육센터 폐기물 처리"></div>
                    <div><img src="/img/business/waste2.png" title="국립축산과학원 폐기물 처리"></div>
                    <div><img src="/img/business/waste3.png" title="수자원공사 업무지원시설 폐기물 처리"></div>
                    <div><img src="/img/business/waste4.png" title="임실군청 폐기물처리"></div>
                    <div><img src="/img/business/waste5.png" title="남원 용성초등학교 폐기물 처리"></div>
                    <div><img src="/img/business/waste6.png" title="익산 새뜰마을사업 폐기물 처리"></div>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>