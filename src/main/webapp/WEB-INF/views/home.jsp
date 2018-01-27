<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="common/common.jsp"%>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<title>仪表盘</title>
</head>
<body>

<!-- 头部导航 -->
<div class="adminHead">
	<div class="topbar-head topbar-left">
		<a href="http://localhost:8080" target="_blank"  class="topbar-logo-link"><img class="topbar-logo" alt="logo" src="resources/img/logo.jpeg"></a>
		<a href="http://localhost:8080/adminserver/" class="topbar-home-link"><span class="topbar-btn">管理控制台</span></a>
	</div>
	<div class="topbar-head topbar-right">
		<div class="topbar-message">
			<a href="#" class="topbar-message-link"><span class="topbar-btn">消息</span></a>
			<div class="topbar-message-detail">
				<ul class="topbar-message-ul">
					<li><a href="#">个人消息</a></li>
					<li><a href="#">系统消息</a></li>
				</ul>
			</div>
		</div>
		<div class="topbar-user">
			<a href="#" class="topbar-user-link"><span class="topbar-btn"><shiro:principal property="realName"></shiro:principal></span></a>
			<div class="topbar-user-detail">
				<ul class="topbar-user-ul">
					<li><a href="javascript:ajaxContent('common/user/showUserInfo')">个人信息</a></li>
					<li><a href="#">修改密码</a></li>
					<li><a href="javascript:logout()">退出登录</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 内容 -->
<div class="adminContent">
	<!-- 左侧导航 -->
	<div class="adminLeft">
		<div class="sidebar-fold">
			<p>
				<i class="fa fa-outdent"></i>
			</p>
		</div>
		<div class="sidebar-nav">
				${sysMenuJson}
		</div>
		
	</div>
	
	<!-- 内容显示 -->
	<div class="adminRight">
		<div class="detail-padding">
			<div class="detail-content">
				<!-- 详细页面模态框位置 -->				
				<div id="operateModeDiv"></div>
				<!-- 设置加载内容的位置 -->
				<div class="ajaxDetailContect" id = "ajaxDetailContect"></div>
			</div>
		</div>
	</div>
</div>

<script src="resources/js/home.js"></script>
</body>
</html>
