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
            <div id="contents_top" class="contents_top4">
                <div>
                    <h2>커뮤니티</h2>
                    <span>Community</span>
                </div>
            </div>
            <div id="tit1">
                <h3>공지사항</h3>
            </div>
            <div class="board_write_wrap">
                <div class="board_write">
                    <table class="tbl1">
                        <colgroup>
                            <col width="15%">
                            <col width="35%">
                            <col width="15%">
                            <col width="35%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td colspan="3"><input type="text" class="ipt_title"></td>
                            </tr>
                            <tr>
                                <th>글쓴이</th>
                                <td><input type="text" class="ipt_writer"></td>
                                <th>날짜</th>
                                <td><input type="text" class="ipt_date"></td>
                            </tr>
                            <tr>
                                <td colspan="4" class="cont">에디터 삽입</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="board_write_bottom">
                        <a href="#" class="bt1 bt1_on board_bt_list">작성</a>
                        <a href="#" class="bt1 board_bt_list">취소</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>