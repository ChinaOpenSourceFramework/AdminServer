<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div class="detail-side-margin">
	<!-- 导航标题 -->
	<div class="detail-title">
		<div class="title-left">
			<h4><shiro:principal property="realName"/></h4>
		</div>
	</div>
	<!-- 详细内容 -->
	<div class="detail-body">
		<table class="table table-bordered table-hover">
			<!-- On rows -->
			<tr>
				<td>用户ID</td>
				<td><shiro:principal property="userId"/></td>
				<td>登陆名</td>
				<td><shiro:principal property="userName"/></td>
			</tr>
			<tr>
				<td>昵称</td>
				<td><shiro:principal property="realName"/></td>
				<td>电话</td>
				<td><shiro:principal property="userPhone"/></td>
			</tr>
			<tr >
				<td>QQ</td>
				<td><shiro:principal property="userQq"/></td>
				<td>E-mail</td>
				<td><shiro:principal property="userEmail"/></td>
			</tr>
		</table>
	</div>
</div>

<script>


</script>
