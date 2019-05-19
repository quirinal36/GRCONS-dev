<%@page import="java.util.List"%>
<%@page import="kr.co.grcons.control.AskController"%>
<%@page import="kr.co.grcons.vo.Ask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String pageNumStr = request.getParameter("pageNo");
int pageNo = 1;
if(pageNumStr!=null && pageNumStr.length()>0){
	pageNo = Integer.parseInt(pageNumStr);
}
Ask ask = new Ask();
ask.setPageNo(pageNo);

AskController control = new AskController();
int count = control.getAskCount(ask);
ask.setTotalCount(count);
List<Ask> list = control.getAskList(ask);
%>
<c:set var="ask" value="<%=ask%>"></c:set>
<c:set var="list" value="<%=list %>"></c:set>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
    <script src="https://cdn.ckeditor.com/4.11.3/standard-all/ckeditor.js"></script>
    <script src="<c:url value="/js/sweetalert2.all.min.js"/>"></script>
    <script type="text/javascript">
    const toast = swal.mixin({
    	toast : true,
    	position : 'center',
    	showConfirmButton : false,
    	timer : 1500
    });
    function movePage(page){
        $("input[name='page']").val(page);
        $("form").submit();
    }
    function submitEditor(){
    	if(confirm_phone()){
	    	var name = $("input[name='name']").val();
	    	var phone = $("input[name='phone']").val();
	    	var data = CKEDITOR.instances.editor1.getData();
	    	var param = "name="+name;
	    	param += "&phone="+phone;
	    	param += "&content="+data;
	    	
	    	if(jscd.browser.indexOf('msie') != -1 && parseInt(jscd.browserMajorVersion) < 11){
	    		if(confirm("견적 접수를 완료하시겠습니까?")){
	    			sendInfo(param);
	    		}
	    	}else{
		    	swal({
		    		text : "견적 접수를 완료하시겠습니까?",
					showCancelButton: true,
					focusConfirm: true,
					confirmButtonText: '확인',
					cancelButtonText:'취소',
					animation: false
		    	}).then(function(isYes){
		    		if(isYes.value){
		    			sendInfo(param);
		    		}
		    	});
	    	}
    	}
    }
    function sendInfo(param){
    	$.ajax({
    		type : "POST",
    		url  : $("input[name='action']").val(),
    		data : param,
    		success : function(result){
    			var json = JSON.parse(result);
    			if(json.result > 0){
    				window.location.href="/ask/complete.jsp"
    			}
    		},error : function(data, status){
    			
    		}
    	});
    }
    function confirm_phone() {
    	var phone = $("input[name='phone']").val();
    	
    	// 전화번호 형태가 맞는지 검사
    	var regex = new RegExp(/[0-9]{3}[-\s\.]{0,1}[0-9]{3,4}[-\s\.]{0,1}[0-9]{4}/g);
    	var isPhone = regex.test(phone);
    	phone = RegExp.lastMatch;
    	
    	var left = RegExp.leftContext;
    	var right = RegExp.rightContext;
    	
    	if(isPhone == false){
    		if(jscd.browser.indexOf('msie') != -1 && parseInt(jscd.browserMajorVersion) < 11){
    			alert("올바른 전화번호 형식이 아닙니다. 다시 확인해 주세요.");
    		}else{
    			toast({text : "올바른 전화번호 형식이 아닙니다. 다시 확인해 주세요."});
    		}
    		return false;
    	}else if(left.length + right.length > 0){
    		if(jscd.browser.indexOf('msie') != -1 && parseInt(jscd.browserMajorVersion) < 11){
    			alert("올바른 전화번호 형식이 아닙니다. 다시 확인해 주세요.");
    		}else{
    			toast({
    				text : "올바른 전화번호 형식이 아닙니다. 다시 확인해 주세요."
    			});
    		}
    		return false;
    	}else{
    		return true;
    	}
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
            
            <div class="board_write_wrap">
                <div class="board_write">
                	<c:choose>
	                	<c:when test="${sessionLogin.id gt 0}">
	                		<table class="tbl1">
	                			<colgroup>
		                            <col width="10%">
		                            <col width="30%">
		                            <col width="30%">
		                            <col width="30%">
		                        </colgroup>
		                        <thead>	
			                        <tr>
			                        	<th>번호</th>
			                        	<th>이름</th>
			                        	<th>연락처</th>
			                        	<th>작성날짜</th>
		                        	</tr>
		                        </thead>
		                        <tbody>
		                        	<c:forEach items="${list }" var="item">
		                        		<tr>
		                        			<td>${item.id }</td>
		                        			<td>
		                        			<a href="/ask/detail.jsp?id=${item.id }">
		                        				${item.name }
		                        			</a>
		                        			</td>
		                        			<td>${item.phone }</td>
		                        			<td>${item.wDate }</td>
		                        		</tr>
		                        	</c:forEach>
		                        </tbody>
		                	</table>
	                	</c:when>
	                	<c:otherwise>
	                		<div id="tit1">
				                <h3>견적문의</h3>
				                <p>
						                    저희 회사는 건축, 폐기물 처리 및 수집 운반, 철거 전문 업체입니다.<br>
						                    문의사항을 남겨주시면 담당자를 통해 빠른시일 내에 답변드리도록 하겠습니다.
				                </p>
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
		                                <td><input type="text" name="name" class="ipt_writer" placeholder="이름을 입력해주세요."></td>
		                                
		                                <th>연락처</th>
		                                <td><input type="tel" name="phone" class="ipt_tel" placeholder="연락처를 입력하세요"></td>
		                            </tr>
		                            <tr>
		                                <td colspan="4" class="cont">
		                                    <textarea name="editor1" id="editor1" rows="30" cols="80" placeholder="견적 문의사항 입력">
		                                    </textarea>
		                                    <script>
							                // Replace the <textarea id="editor1"> with a CKEditor
							                // instance, using default configuration.
							                CKEDITOR.replace( 'editor1' ,{
							                	toolbarGroups: [{
							                        "name": "basicstyles",
							                        "groups": ["basicstyles"]
							                      },
							                      {
							                        "name": "links",
							                        "groups": ["links"]
							                      },
							                      {
							                        "name": "paragraph",
							                        "groups": ["list", "blocks"]
							                      },
							                      {
							                        "name": "document",
							                        "groups": ["mode"]
							                      },
							                      {
							                        "name": "insert",
							                        "groups": ["insert"]
							                      },
							                      {
							                        "name": "styles",
							                        "groups": ["styles"]
							                      },
							                      {
							                        "name": "about",
							                        "groups": ["about"]
							                      }
							                    ],
							                    // Remove the redundant buttons from toolbar groups defined above.
							                    removeButtons: 'Image,Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar'
							                	,height: 630
							                });
							            </script>
		                                </td>
		                            </tr>
		                        </tbody>
		                    </table>
		                    <div class="board_write_bottom">
		                        <a href="javascript:submitEditor();" class="bt1 bt1_on board_bt_list">작성완료</a>
		                        <input type="hidden" name="action" value="<c:url value="/ask/write/action"/>"/>
		                    </div>
		                    <c:import url="/inc/ask.jsp"></c:import>
	                    </c:otherwise>
                	</c:choose>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>