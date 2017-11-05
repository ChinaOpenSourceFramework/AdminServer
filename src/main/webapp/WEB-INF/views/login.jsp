<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<html>
<head>
<%@include file="common/common.jsp"%>
<title>登录</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">

				<h1>登录</h1>
				<form action="login" method="post">
					<div class="form-group">
						<label for="InputLoginName">登录名</label> <input type="text" class="form-control" id="InputLoginName" name="loginName" value="loginName" placeholder="登录名">
					</div>
					<div class="form-group">
						<label for="InputPassword">密码</label> <input type="password" class="form-control" id="InputPassword" name="password" value="password" placeholder="密码">
					</div>
					<button type="submit" class="btn btn-default">登录</button>
				</form>
		
			</div>
		</div>
	</div>



</body>
</html>
