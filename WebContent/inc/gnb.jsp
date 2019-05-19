<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
    $("#gnb > ul > li").hover(function(){
        $(this).addClass("on");
        $(this).find("ul").stop().slideDown();
    }, function(){
        $(this).removeClass("on");
        $(this).find("ul").stop().hide();
    });
});
</script>
<div id="gnb">
    <ul>
        <li>
            <a href="/company/greet.jsp">회사소개</a>
            <ul>
                <li><a href="/company/greet.jsp">대표 인사말</a></li>
                <li><a href="/company/location.jsp">오시는 길</a></li>
                <li><a href="/company/organization.jsp">조직도</a></li>
            </ul>
        </li>
        <li>
            <a href="/business/construction.jsp">사업안내</a>
            <ul>
                <li><a href="/business/construction.jsp">건축</a></li>
                <li><a href="/business/waste.jsp">폐기물</a></li>
                <li><a href="/business/dismantle.jsp">철거</a></li>
                <li><a href="/business/equipment.jsp">보유장비</a></li>
                <li><a href="/business/certification.jsp">허가·인증</a></li>
            </ul>
        </li>
        <li>
            <a href="/record/construction.jsp">공사실적</a>
            <ul>
                <li><a href="/record/construction.jsp">건축</a></li>
                <li><a href="/record/waste.jsp">폐기물</a></li>
                <li><a href="/record/dismantle.jsp">철거</a></li>
            </ul>
        </li>
        <li>
            <a href="/community/ask.jsp">커뮤니티</a>
            <ul>
                <li><a href="/community/notice.jsp">공지사항</a></li>
                <li><a href="/community/ask.jsp">견적문의</a></li>
            </ul>
        </li>
    </ul>
</div>