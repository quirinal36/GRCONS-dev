<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/index.css" media="all" />
    <script type="text/javascript">
        $(function(){
          $('.idxA_slide').bxSlider({
            mode: "fade",
            controls: false,
            pager: true
          });
        });
    </script>
</head>
<body>
<div id="wrap">
    <c:import url="/inc/header.jsp"></c:import>
    <div id="container_wrap">
        <div id="container">
            <div id="idxA">
                <div class="idxA_slide">
                    <div class="idxA1">
                        <p class="p1">귀사의 가치와 명예를 위해 새벽을 여는 사람들!</p>
                        <p class="p2">계룡건설㈜이 함께하겠습니다.</p>
                        <a href="/company/greet.jsp" class="idxA_bt">대표 인사말</a>
                    </div>
                    <div class="idxA2">
                        <p class="p1">귀사의 가치와 명예를 위해 새벽을 여는 사람들!</p>
                        <p class="p2">계룡건설㈜이 함께하겠습니다.</p>
                        <a href="/company/greet.jsp" class="idxA_bt">대표 인사말</a>
                    </div>
                    <div class="idxA3">
                        <p class="p1">귀사의 가치와 명예를 위해 새벽을 여는 사람들!</p>
                        <p class="p2">계룡건설㈜이 함께하겠습니다.</p>
                        <a href="/company/greet.jsp" class="idxA_bt">대표 인사말</a>
                    </div>
                </div>
            </div>
            <div id="idxB">
                <strong>사업안내</strong>
                <div>
                    <div>
                        <img src="/img/index/idxB1.png" alt="건설">
                        <strong>건설</strong>
                        <p>
                            설계부터 입주까지 세심한 노력을 기울여<br>
                            아름답고 안전한 공간을 창조합니다.
                        </p>
                        <a href="/business/construction.jsp">더 보기 +</a>
                    </div>
                    <div>
                        <img src="/img/index/idxB2.png" alt="폐기물">
                        <strong>폐기물</strong>
                        <p>
                            계룡건설 주식회사는 건설폐기물을<br>
                            수집 및 운반하는 정식허가업체입니다.
                        </p>
                        <a href="/business/waste.jsp">더 보기 +</a>
                    </div>
                    <div>
                        <img src="/img/index/idxB3.png" alt="철거">
                        <strong>철거</strong>
                        <p>
                            숙련된 인력과 최신 장비를 보유하고 있으며<br>
                            오랜 철거 경험으로 전문성 있는 공사가 가능합니다.
                        </p>
                        <a href="/business/dismantle.jsp">더 보기 +</a>
                    </div>
                </div>
            </div>
            <div id="idxC">
                <a href="/company/location.jsp">오시는 길</a>
                <a href="/business/equipment.jsp">보유장비</a>
                <a href="/business/certification.jsp">허가·인증</a>
                <a href="/record/record.jsp">공사실적</a>
                <a href="/community/ask.jsp">문의하기</a>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>