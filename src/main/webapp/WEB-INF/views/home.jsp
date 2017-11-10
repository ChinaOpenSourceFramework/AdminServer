<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE HTML>
<html>
<head>
    <%@include file="common/common.jsp"%>
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
			<a href="#" class="topbar-user-link"><span class="topbar-btn">李其伟(用户名)</span></a>
			<div class="topbar-user-detail">
				<ul class="topbar-user-ul">
					<li><a href="#">个人信息</a></li>
					<li><a href="#">修改密码</a></li>
					<li><a href="#">退出登录</a></li>
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
			<ul class="sidebar-nav-level0">
				
				<li class="sidebar-nav-level1">
					<a href="javascript:void(0)">
						<i class="fa fa-cogs" ></i><span>系统管理</span>
					</a>
					<ul class="sidebar-nav-level2">
						<li class="sidebar-nav-level3">
							<a href="javascript:ajaxContent('common/user/userList')">
								<i class="fa fa-calendar"></i><span>用户管理</span>
							</a>
						</li>
						<li class="sidebar-nav-level3">
							<a href="javascript:ajaxContent('dashboard')">
								<i class="fa fa-clock-o"></i><span>设置闹钟</span>
							</a>
						</li>
						<li class="sidebar-nav-level3">
							<a href="javascript:ajaxContent('dashboard')">
								<i class="fa fa-btc"></i><span>设置蓝牙</span>
							</a>
						</li>
					</ul>
				</li>
				
				<li class="sidebar-nav-level1">
					<a href="javascript:void(0)">
						<i class="fa fa-cogs" ></i><span>设置</span>
					</a>
					<ul class="sidebar-nav-level2">
						<li class="sidebar-nav-level3">
							<a href="javascript:ajaxContent('dashboard')">
								<i class="fa fa-calendar"></i><span>设置日期</span>
							</a>
						</li>
						<li class="sidebar-nav-level3">
							<a href="javascript:ajaxContent('dashboard')">
								<i class="fa fa-clock-o"></i><span>设置闹钟</span>
							</a>
						</li>
						<li class="sidebar-nav-level3">
							<a href="javascript:ajaxContent('dashboard')">
								<i class="fa fa-btc"></i><span>设置蓝牙</span>
							</a>
						</li>
					</ul>
				</li>
				<li class="sidebar-nav-level1">
					<a href="#none">
						<i class="fa fa-users"></i><span>用户</span>
					</a>
					<ul class="sidebar-nav-level2">
						<li class="sidebar-nav-level3">
							<a href="#none">
								<i class="fa fa-user-plus"></i><span>添加用户</span>
							</a>
						</li>
						<li class="sidebar-nav-level3">
							<a href="#none">
								<i class="fa fa-user-md"></i><span>修改用户</span>
							</a>
						</li>
						<li class="sidebar-nav-level3">
							<a href="#none">
								<i class="fa fa-user-secret"></i><span>查询用户</span>
							</a>
							<ul class="sidebar-nav-level4">
								<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按名字</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按年龄</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							 	<li class="sidebar-nav-level5">
									<a href="#none">
										<i class="fa fa-user-secret"></i><span>按性别</span>
									</a>
							 	</li>
							</ul>
						</li>
						<li class="sidebar-nav-level3">
							<a href="#none">
								<i class="fa fa-user-times"></i><span>删除用户</span>
							</a>
						</li>
					</ul>
				</li>
			</ul>
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

<script type="text/javascript">

$(function(){

///------------------------------分割线------------------------------------------		
	//头部菜单当行
	//消息
	$(".topbar-message-link").mouseenter(function () {
		$(".topbar-message-detail").css("visibility","visible");
	});
	$(".topbar-message-link").mouseleave(function () {
		$(".topbar-message-detail").css("visibility","hidden");
		$(".topbar-message-detail").mouseenter(function () {
			$(".topbar-message-detail").css("visibility","visible");
		});
	});
	$(".topbar-message-detail").mouseleave(function () {
		$(".topbar-message-detail").css("visibility","hidden");
	});
	//个人中心
	$(".topbar-user-link").mouseenter(function () {
		$(".topbar-user-detail").css("visibility","visible");
	});
	$(".topbar-user-link").mouseleave(function () {
		$(".topbar-user-detail").css("visibility","hidden");
		$(".topbar-user-detail").mouseenter(function () {
			$(".topbar-user-detail").css("visibility","visible");
		});
	});
	$(".topbar-user-detail").mouseleave(function () {
		$(".topbar-user-detail").css("visibility","hidden");
	});
///------------------------------分割线------------------------------------------		
	
///------------------------------分割线------------------------------------------		
	var window_width = $(window).width();
	var window_height = $(window).height();
	// 设置高度
	$(".adminContent").height(window_height-50);
	$(".adminLeft").width(180);
	$(".adminRight").width(window_width-180);
	
	// 详细内容显示,设置为固定高度
	$(".detail-content").css("width",window_width-200);
	$(".detail-content").css("max-width",window_width-200);
	$(".detail-content").css("height",window_height-70);
	$(".detail-content").css("max-height",window_height-70);
	
	// 左侧导航最大高度设置
	$(".sidebar-nav").css("height",window_height-80);
	$(".sidebar-nav").css("max-height",window_height-80);
///------------------------------分割线------------------------------------------		


///------------------------------分割线------------------------------------------	
	// 左侧导航折叠或张开
	$(".sidebar-fold").click(function(){
		var sidebarwidth = $(".adminLeft").width();
		if(sidebarwidth > 100){
			//防止获取的值不一致，样式有问题
			window_width = $(window).width();
			$(".adminLeft").width("50");
			$(".adminRight").width(window_width - 50);
			//padding值为20 需要去掉 
			$(".detail-content").css("width",window_width-70);
			$(".detail-content").css("max-width",window_width-70);
			$(".adminRight").css("margin-left",50);
			
			$(".sidebar-fold p i").removeClass("fa-outdent");
			$(".sidebar-fold p i").addClass("fa-indent");
			$(".sidebar-nav span").hide();
		}else{
			window_width = $(window).width();
			$(".adminLeft").width("180");
			$(".adminRight").width(window_width-180);
			$(".detail-content").css("width",window_width-200);
			$(".detail-content").css("max-width",window_width-200);
			$(".adminRight").css("margin-left",180);
			
			$(".sidebar-fold p i").removeClass("fa-indent");
			$(".sidebar-fold p i").addClass("fa-outdent");
			$(".sidebar-nav span").show();
		}
		
	});
	
	//左侧导航条
	$(".sidebar-nav a").click(function(){
		$(this).parents('li').siblings('li').children('ul').slideUp(100);
		$(this).parents('li').children('ul').slideDown(100);
		$(".sidebar-nav a").removeClass('current');
		$(this).addClass('current');
		$(this).siblings('ul').slideDown(100);
	});
	
///------------------------------分割线------------------------------------------		
	ajaxContent('common/user/userList');
});


/**
 * 加载指定页面
 * url 页面地址
 */
function ajaxContent(url){
	$.ajax({
		url : url,
//		async : false,
		type : "get",
		success : function(res){
			$("#ajaxDetailContect").html(res);
		},
		error : function(res){
			alert("加载内容失败");
			alert(res);
		}
	});
}

/***
 * 详细页面中弹出模态框
 */
function showMode(url) {
	$.ajax({
		url : url,
	//	async : false,
		type : "get",
		success : function(res){
			$("#operateModeDiv").html(res);
		},
		error : function(res){
			alert("加载内容失败");
			alert(res);
		}
	});
}

</script>

</body>
</html>
