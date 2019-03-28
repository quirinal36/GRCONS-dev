<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/index.css" media="all" />
</head>
<body>
<div id="wrap">
    <c:import url="/inc/header.jsp"></c:import>
    <div id="container_wrap">
        <div id="container">
            <div id="idxA">
                <div>
                    <p class="p1">귀사의 가치와 명예를 위해 새벽을 여는 사람들!</p>
                    <p class="p2">계룡건설㈜이 함께하겠습니다.</p>
                    <a href="/company/greet.jsp">대표 인사말</a>
                </div>
            </div>
<style>
#idxG { width: 100%; min-width: 1000px; max-width: 1400px; margin: 80px auto; text-align: center; font-size: 0; }
#idxG > div { display: inline-block; width: 30%; margin-left: 5%; text-align: center; }
#idxG > div:first-child { margin-left: 0; }
#idxG > div > img { display: block; width: 100%; border-radius: 10px; opacity: 0.3; }
#idxG > div > strong { display: block; margin: 40px auto 20px auto; font-size: 30px; font-weight: 800; }
#idxG > div > p { font-size: 16px; line-height: 160%; }
#idxG > div > a { display: block; width: 120px; margin: 20px auto 0 auto; padding: 12px 0; border: 1px solid #ddd; font-size: 16px; }
</style>
            <div id="idxG">
                <div>
                    <img src="/img/index/idxB1.png" alt="건설">
                    <strong>건설</strong>
                    <p>
                        고객의 이익을 먼저 생각하고<br>
                        기본과 원칙을 준수하고 있습니다.
                    </p>
                    <a href="/business/construction.jsp">더 보기</a>
                </div>
                <div>
                    <img src="/img/index/idxB1.png" alt="폐기물">
                    <strong>폐기물</strong>
                    <p>
                        고객의 이익을 먼저 생각하고<br>
                        기본과 원칙을 준수하고 있습니다.
                    </p>
                    <a href="/business/waste.jsp">더 보기</a>
                </div>
                <div>
                    <img src="/img/index/idxB1.png" alt="철거">
                    <strong>철거</strong>
                    <p>
                        고객의 이익을 먼저 생각하고<br>
                        기본과 원칙을 준수하고 있습니다.
                    </p>
                    <a href="/business/dismantle.jsp">더 보기</a>
                </div>
            </div>
            <div id="idxC">
                <a href="/company/location.jsp">오시는 길</a>
                <a href="/business/equipment.jsp">보유장비</a>
                <a href="/business/certification.jsp">허가·인증</a>
                <a href="/record/record.jsp">공사실적</a>
                <a href="/ask/ask.jsp">문의하기</a>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>