<%@page import="kr.co.grcons.control.AskController"%>
<%@page import="kr.co.grcons.vo.Ask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%
String strId = request.getParameter("id");
int id = Integer.parseInt(strId);
Ask ask = new Ask(id);

AskController controller = new AskController();
ask = controller.getAsk(ask);
%>
<c:set var="ask" value="<%=ask%>"></c:set>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
    <script src="<c:url value="/js/sweetalert2.all.min.js"/>"></script>
    <script type="text/javascript">
     </script>
</head>
<body>
	<c:import url="/inc/header.jsp"></c:import>
    <div id="container_wrap">
        <div id="container">
            <div id="contents_top" class="contents_top4">
                <div>
                    <h2>커뮤니티</h2>
                    <span>Community</span>
                </div>
            </div>
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
				        <td>
				        ${ask.name }
				        </td>
				        
				        <th>연락처</th>
				        <td>
				        ${ask.phone }
				        </td>
				    </tr>
				    <tr>
				        <td colspan="4" class="cont">
				        ${ask.content }
				    	</td>
				    </tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>