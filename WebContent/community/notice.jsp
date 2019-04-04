<%@page import="java.util.List"%>
<%@page import="kr.co.grcons.control.BoardController"%>
<%@page import="kr.co.grcons.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String pageNumStr = request.getParameter("pageNo");
int pageNo = 1;
if(pageNumStr!=null && pageNumStr.length()>0){
	pageNo = Integer.parseInt(pageNumStr);
}

Board board = new Board();
board.setPageNo(pageNo);

BoardController control = new BoardController();
int count = control.getBoardCount();
board.setTotalCount(count);
List<Board> list = control.getBoardList(board);
%>
<c:set var="board" value="<%=board%>"></c:set>
<c:set var="list" value="<%=list %>"></c:set>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
	<script type="text/javascript">
        function movePage(page){
            $("input[name='page']").val(page);
            $("form").submit();
        }
    </script>
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
            <div class="board_list_wrap">
                <div class="board_list_top">
                    <span>총 <c:out value="${board.totalCount }"/>개의 공지사항이 있습니다.</span>
                    <c:set var="textNum" value="번호" scope="page"/>
                    <c:set var="textTitle" value="제목" scope="page"/>
                    <c:set var="textWriter" value="글쓴이" scope="page"/>
                    <c:set var="textDate" value="날짜" scope="page"/>
                </div>
                <div class="board_list">
                    <table class="tbl1">
                        <colgroup>
                            <col width="10%">
                            <col width="60%">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th><c:out value="${textNum }"/></th>
                                <th><c:out value="${textTitle }"/></th>
                                <th><c:out value="${textWriter }"/></th>
                                <th><c:out value="${textDate }"/></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list }" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>
                                    <a href="<c:url value="/board/detail.jsp?id=${item.id}"/>">
                                        ${item.title}
                                    </a>
                                </td>
                                <td>${item.username}</td>
                                <td>${item.wdate}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="board_page">
                    <c:forEach begin="1" end="${board.endPageNo }" varStatus="status">
                        <a href="javascript:movePage('${status.index }')" class="fc-blue board-list-page-num<c:if test="${pageNum == status.index}">-on</c:if>">${status.index}</a>
                    </c:forEach>
                    <c:if test="${sessionLogin.id gt 0}">
                    	<input type="button" value="글쓰기" onclick="javascript:window.location.href='<c:url value='/community/notice_write.jsp'/>'" class="bt1 board_bt_write">
                    </c:if>
                </div>
                <div class="board_search">
                    <form action="<c:url value="/board/list.jsp"/>">
                        <input type="text" placeholder="검색어를 입력하세요." name="search" value="${board.search }"/>
                        <input type="submit" value="검색"/>
                        <input type="hidden" value="${board.pageNo }" name="page"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>