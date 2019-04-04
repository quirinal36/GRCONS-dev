<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function(){
        $(".bt_login").click(function(){
            $(".popup_login").fadeIn();
        });
        $(".bt_logout").click(function(){
        	window.location.href="/user/logout.jsp";
        });
    });
</script>
<div id="header">
    <h1><a href="/"><img src="/img/comm/logo.png" alt="계룡건설 주식회사"></a></h1>
    <c:import url="/inc/gnb.jsp"></c:import>
    <div id="header_link">
    	<c:choose>
	    	<c:when test="${empty sessionLogin}">
	        	<input type="button" class="bt_login" value="로그인">
	        </c:when>
	        <c:otherwise>
	        	<input type="button" class="bt_logout" value="로그아웃">
	        </c:otherwise>
        </c:choose>
    </div>
</div>