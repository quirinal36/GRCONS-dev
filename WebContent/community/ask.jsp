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
                    <h2>커뮤니티</h2>
                    <span>Community</span>
                </div>
            </div>
            <div id="tit1">
                <h3>문의하기</h3>
            </div>
            <div class="section6">
                <div class="left">
                    <span>전화 문의</span>
                    <strong>063-834-8072</strong>
                    <p>
                        평일 09:00~18:00<br>
                        (점심시간 12:00~13:00)
                    </p>
                </div>
                <div class="right">
                    <span>1:1 채팅 문의</span>
                    <a href="#">카카오톡 문의하기</a>
                    <p>
                        평일 09:00~18:00<br>
                        (점심시간 12:00~13:00)
                    </p>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>