<%@page import="java.util.logging.Logger"%>
<%@page import="kr.co.grcons.vo.Board"%>
<%@page import="kr.co.grcons.control.BoardController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
int boardId = Integer.parseInt(request.getParameter("id"));
Board input = new Board(boardId);
BoardController controller = new BoardController();
Board board = controller.getBoard(input);
Logger logger = Logger.getLogger("notice_view.jsp");
%>
<c:set var="board" value="<%=board%>"></c:set>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
    <link rel="stylesheet" type="text/css" href="/ckeditor/contents.css" media="all" />
    <script src="https://cdn.ckeditor.com/4.11.3/standard-all/ckeditor.js"></script>
    <script src="<c:url value="/js/sweetalert2.all.min.js"/>"></script>
	<script type="text/javascript">
	function updateBoard(){
		var id = $("input[name='boardId']").val();
		var title = $("input[name='title']").val();
		var data = CKEDITOR.instances.editor1.getData();
		var param = "title="+title;
		param += "&content="+data;
		param += "&id="+id;
		$.ajax({
    		type : "POST",
    		url  : $("input[name='action']").val(),
    		data : param,
    		success : function(result){
    			var json = JSON.parse(result);
    			if(json.result > 0){
    				swal({
    					text : "게시글이 수정되었습니다."
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
            <div class="board_view_wrap">
                <div class="board_view">
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
                                <td colspan="3">
                                	<input type="text" name="title" value="${board.title }" />
                                </td>
                            </tr>
                            <tr>
                                <th>글쓴이</th>
                                <td>${board.username }</td>
                                <th>날짜</th>
                                <td>${board.wdate }</td>
                            </tr>
                            <tr class="cke_contents_ltr">
                                <td colspan="4" class="cont">
                                <textarea name="editor1" id="editor1" rows="30" cols="80">${board.content }</textarea>
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
                    <div class="board_view_bottom">
                    <input type="hidden" name="action" value="<c:url value="/board/update/action"/>"/>
                    <input type="hidden" name="boardId" value="${board.id }"/>
                    <a href="javascript:updateBoard();" class="bt1 bt1_on board_bt_list">저장</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
</body>
</html>