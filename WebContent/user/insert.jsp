<%@page import="kr.co.grcons.vo.Users"%>
<%@page import="kr.co.grcons.control.BoardController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
BoardController controller = new BoardController();
Users user = Users.newInstance();
user.setLogin("LOGIN");
user.setPassword("password");
user.setUsername("username");
user.setPhone("phone");

int result = controller.insertUser(user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${result}
</body>
</html>