<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
    <script src="https://cdn.ckeditor.com/4.11.3/standard-all/ckeditor.js"></script>
    <script src="<c:url value="/js/sweetalert2.all.min.js"/>"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var value = '${sessionLogin.id}';
    	
    	if(value=='' || parseInt(value) == 0){
    		swal({
    			text : "로그인해주세요.",
    			confirmButtonText: '확인'    			
    		}).then(function(result){
    			if (result.value) {
					history.back(-1); 
    			}
    		});
    	}
    });
    function submitEditor(){
    	var title = $("input[name='title']").val();
    	var writer = $("input[name='writer']").val();
    	var wdate = $("input[name='wdate']").val();
    	var data = CKEDITOR.instances.editor1.getData();
    	var param = "title="+title;
    	param += "&writer="+writer;
    	param += "&wdate="+wdate;
    	param += "&content="+data;
    	
    	$.ajax({
    		type : "POST",
    		url  : $("input[name='action']").val(),
    		data : param,
    		success : function(result){
    			var json = JSON.parse(result);
    			if(json.result > 0){
    				swal({
    					text : "게시글이 작성되었습니다."
    				}).then(function(result){
    					window.location.href="/community/notice.jsp"
    				});
    			}
    		},error : function(data, status){
    			
    		}
    	});
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
                                <td colspan="3"><input type="text" class="ipt_title" name="title"></td>
                            </tr>
                            <tr>
                                <th>글쓴이</th>
                                <td>
                                	<input type="text" class="ipt_writer" name="username" value="${sessionLogin.username }" readonly>
                                	<input type="hidden" name="writer" value="${sessionLogin.id }"/>
                                </td>
                                <th>날짜</th>
                                <td>
								<jsp:useBean id="toDay" class="java.util.Date" />
								
                                <input type="text" class="ipt_date" name="wdate" readonly value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd"/>"></td>
                            </tr>
                            <tr>
                                <td colspan="4" class="cont">
                                <textarea name="editor1" id="editor1" rows="30" cols="80">
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
					                    removeButtons: 'Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar'
					                	,height: 630
					                });
					            </script>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="board_write_bottom">
                        <a href="javascript:submitEditor();" class="bt1 bt1_on board_bt_list">작성</a>
                        <a href="javascript:void(0);" class="bt1 board_bt_list">취소</a>
                        <input type="hidden" name="action" value="<c:url value="/board/write/action"/>"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>