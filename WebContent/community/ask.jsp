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
                <h3>견적문의</h3>
                <p>
                    저희 회사는 건축, 폐기물 처리 및 수집 운반, 철거 전문 업체입니다.<br>
                    문의사항을 남겨주시면 담당자를 통해 빠른시일 내에 답변드리도록 하겠습니다.
                </p>
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
                                <th>이름</th>
                                <td><input type="text" class="ipt_writer" placeholder="이름을 입력해주세요."></td>
                                
                                <th>연락처</th>
                                <td><input type="tel" class="ipt_tel" placeholder="연락처를 입력하세요"></td>
                            </tr>
                            <tr>
                                <td colspan="4" class="cont">
                                    <textarea name="editor1" id="editor1" rows="30" cols="80" placeholder="견적 문의사항 입력">
                                    </textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="board_write_bottom">
                        <a href="#" class="bt1 bt1_on">작성완료</a>
                    </div>
                </div>
            </div>
            <c:import url="/inc/ask.jsp"></c:import>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>