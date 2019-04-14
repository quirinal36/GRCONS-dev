<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
Kakao.init('a1337125b511a93d04abb16788d4cc64');
</script>
<div class="section6">
    <div class="left">
        <span>전화 문의</span>
        <strong>063-834-8072</strong>
        <p>
            평일 09:00~18:00<br>
            (점심시간 12:00~13:00)
        </p>
    </div>
    <div class="right">
        <span>1:1 채팅 문의</span>
        <a href="javascript:void plusFriendChat()">카카오톡 문의하기</a>
        <p>
            평일 09:00~18:00<br>
            (점심시간 12:00~13:00)
        </p>
    </div>
</div>
<script type='text/javascript'>
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    function plusFriendChat() {
      Kakao.PlusFriend.chat({
        plusFriendId: '_xcHQcj' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
      });
    }
</script>