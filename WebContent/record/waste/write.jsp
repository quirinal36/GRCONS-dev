<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/inc/head.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
<script type="text/javascript">
function writeRecord(){
	var url = $("form").attr("action");
	var param = $("form").serialize();
	
	console.log(url);
	console.log(param);
	
	$.ajax({
		url : url,
		data : param,
		type : "POST",
		dataType : "json"
	}).done(function(json){
		console.log("done");
		console.log(json);
	}).fail(function(msg){
		console.log("fail");
		console.log(msg);
	});
}
</script>
</head>
<body>
<div id="wrap">
    <c:import url="/inc/header.jsp"></c:import>
    <div id="container_wrap">
        <div id="container">
            <div id="contents_top" class="contents_top2">
                <div>
                    <h2>사업안내</h2>
                    <span>Business</span>
                </div>
            </div>
            <div class="section7">
            	<form action="/insert/record" method="POST">
	            	<table>
	            		<colgroup>
	            			<col width="25%"/>
	            			<col width="75%"/>
	            		</colgroup>
	            		
	            		<tbody>
	            			<tr>
	            				<th>
	            					연도
	            				</th>
	            				<td>
	            					<input type="text" name="year" placeholder="연도를 입력하세요"/>
	            				</td>
	            			</tr>
	            			<tr>
	            				<th>
	            					발주처
	            				</th>
	            				<td>
	            					<input type="text" name="company" placeholder="발주처를 입력하세요"/>
	            				</td>
	            			</tr>
	            			<tr>
	            				<th>
	            					공사명
	            				</th>
	            				<td>
	            					<input type="text" name="title" placeholder="제목을 입력하세요"/>
	            				</td>
	            			</tr>
	            			<tr>
	            				<th>
	            					공사금액
	            				</th>
	            				<td>
	            					<input type="text" name="budget" placeholder="공사금액을 입력하세요"/>
	            				</td>
	            			</tr>
	            		</tbody>
	            		<tfoot>
	            			<tr>
	            				<td colspan="2">
	            					<input type="submit" value="저장"/>
	            				</td>
	            			</tr>
	            			<tr>
	            				<td colspan="2">
	            					<input type="button" value="전송" onclick="javascript:writeRecord();"/>
	            				</td>
	            			</tr>
	            		</tfoot>
	            	</table>
            	</form>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>