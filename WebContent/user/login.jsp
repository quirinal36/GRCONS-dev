<%@page import="java.util.logging.Logger"%>
<%@page import="org.json.JSONObject"%>
<%@page import="kr.co.grcons.control.UserController"%>
<%@page import="kr.co.grcons.vo.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Logger logger = Logger.getLogger("login.jsp");

UserController controller = new UserController();
Users user = Users.newInstance();
user.setLogin(request.getParameter("login"));
user.setPassword(request.getParameter("password"));
// logger.info(user.toString());

Users result = controller.login(user);
JSONObject json = new JSONObject();
if(result != null){
	result.setPassword(null);
	session.setAttribute("sessionLogin", result);
	json.put("result", result.getId());
}else{
	json.put("result", 0);	
}
out.print(json.toString());
%>