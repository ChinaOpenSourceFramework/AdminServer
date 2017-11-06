<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<html>
<head>
<%@include file="common/common.jsp"%>
<title>登录</title>
</head>
<body>
	<div class="loginHead">
		<div class="login-left">
			<a href="http://localhost:8080" target="_blank">
				<img alt="logo" src="resources/img/logo.jpeg">
			</a>
		</div>
		<div class="login-right"></div>
	</div>
	<hr class="login-hr">
	<div class="loginBody">
		<div class="login-body-padding">
			<div class="login-body-lef">
				<p>每天前进一步<br>&nbsp;&nbsp;永远真诚服务 </p>			
			</div>
			<div class="login-body-right">
				<div class="login-form">
					<h3>登录</h3>
					<form action="login" method="post">
						<input type="text" name="loginName" id="loginName"><br>
						<input type="password" name="password" id="password"><br>
						<button type="submit" class="btn login-btn">登录</button>
					</form>				
				</div>
			</div>
		</div>
	</div>
</body>
</html>
