<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.chinaopensource.top/jsp/jstl/system" prefix="sys"%>
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
	<div class="loginBody">
		<div class="login-body-padding">
			<div class="login-body-lef">
				<p>每天前进一步<br>&nbsp;&nbsp;永远真诚服务 </p>
				<!--
				 <sys:select defaultValue="true" dictName="sex" name="sex" id="sex"/>	 <sys:label dictName="card_type" value="1"/>
				 -->
			</div>
			<div class="login-body-right">
				<div class="login-form">
					<h3>登录</h3>
					<form  class="form-horizontal" action="login" method="post">
						<div class="form-group">
						    <div class="col-sm-10 col-sm-offset-1">
						      <input type="text" class="form-control" id="loginName" name="loginName" placeholder="登录名">
						    </div>
						</div>
						<div class="form-group">
						    <div class="col-sm-10 col-sm-offset-1">
						      <input type="password" class="form-control" id="password" name="password" placeholder="密码">
						    </div>
						</div>
						<div class="form-group">
						    <div class="col-sm-5 col-sm-offset-1">
						      <input type="text" class="form-control" id="validateCode" name="validateCode" placeholder="图片验证码">
						    </div>
						    <div class="col-sm-6">
						      	<a href="#" onclick="javascript:reloadValidateCode();"><img alt="图片验证码" id="validateCodeImg"  src="validateCode"></a>
						    </div>
						</div>
						<div class="form-group">
						    <div class="col-sm-10 col-sm-offset-1">
						      <button type="submit" class="btn btn-primary login-btn">登录</button>
						    </div>
						</div>
						
					</form>				
				</div>
			</div>
		</div>
	</div>
	<div class="loginfooter">
	</div>
</body>
</html>
<script type="text/javascript">

function reloadValidateCode(){
    $("#validateCodeImg").attr("src","validateCode?data=" + new Date() + Math.floor(Math.random()*24));
}

</script>