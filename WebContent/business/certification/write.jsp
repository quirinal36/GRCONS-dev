<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/inc/head.jsp"></c:import>
    <link rel="stylesheet" type="text/css" href="/css/contents.css" media="all" />
    <link href="<c:url value="/css/dropzone.css"/>" type="text/css" rel="stylesheet" />
<script>
$(function(){
    $(".certi_list input").click(function(){
        var new_src = $(this).prop("class");
        $(".certi_view img").prop("src","/img/business/" + new_src + ".png");
        $(".certi_view").fadeIn();
    });
});
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
            	<table>
            		<colgroup>
            			<col width="25%"/>
            			<col width="75%"/>
            		</colgroup>
            		
            		<tbody>
            			<tr>
            				<td>
            					<!-- 첨부하기 버튼 -->
								<input id="imageupload" type="file" name="thumbnail" 
									accept="image/*" data-url="/upload/image">
            				</td>
            			</tr>
            		</tbody>
            	</table>
            </div>
        </div>
    </div>
    <c:import url="/inc/footer.jsp"></c:import>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#imageupload').fileupload({
    	imageCrop: true,
        dataType: 'json',
        done: function (e, data) {
        	console.log(data);
        	
        	var file = data.result.file;
        	$("#picture_ul").append(
       			$("<li>").attr("style", "background-image: url(" + file.thumbnailUrl + ");")
       				.append(
       						$("<input>").attr("type","button").attr("title","삭제").addClass("bt_del_img")
       						.attr("onclick", "delButtonClick(this);").val(file.id)
       				)
       			);

        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            
            $('#progress_img .progress-bar').css(
                'width',
                progress + '%'
            );
            if(progress == 100){
            	$('#progress_img .progress-bar').css('width','0%');
            }
        },
 		fail: function(data) {
 			console.log("fail");
 			console.log(data);
 		},
        dropZone: $('#dropzone-img')
    });
});
</script>
<script src="<c:url value="/js/jquery.ui.widget.js"/>"></script>
<script src="<c:url value="/js/jquery.iframe-transport.js"/>"></script>
<script src="<c:url value="/js/jquery.fileupload.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
</body>
</html>