<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div class="detail-side-margin">
	<!-- 导航标题 -->
	<div class="detail-title">
		<div class="title-left">
			<h4>角色管理</h4>
		</div>
	</div>
	<!-- 详细内容 -->
	<div class="detail-body">
		
		<!-- 搜索-->
		<div class="content-search">
		  	<input type="text" class="form-control input-width-x" id="roleId" value="${sysRoles.roleId}" placeholder="角色Id">
		  	<input type="text" class="form-control input-width-xx" id="roleName" value="${sysRoles.roleName}" placeholder="角色名">
			<button type="button" class="btn" onclick="searchDate()">搜索</button>
		</div>

		<!-- 表格详细内容 -->
		<div class="content-table">
			<div class="content-body-table">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th width="10">
								<input type="checkbox" name="roleId"/> 
							</th>
							<th>角色Id</th>
							<th>角色名</th>
							<th>描述</th>
							<th>是否锁定</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="sysRoles"  items="${sysRoleListPage.list}" >
	            			<tr>
	            				<td width="10">
									<input type="checkbox" name="roleId" value="${sysRoles.roleId}"/> 
								</td>
								<td>
									${sysRoles.roleId}
								</td>
								<td>
									 ${sysRoles.roleName} 
								</td>
								<td>
									 ${sysRoles.description} 
								</td>
								<td>
									${sysRoles.locked}
								</td>
	            			</tr>
	        			</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="content-footer-table">
				<table class="table table-hover table-bordered">
					<tfoot>
						<tr height="50">
							<td width="10">
								<input type="checkbox" name="roleId"/> 
							</td>
							<td colspan="7">
								<div class="table-foot-operate">
									<shiro:hasPermission name="/common/role/addRolePage"><button class="btn" onclick="showMode('common/role/addRolePage')">添加</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/role/updateRolePage"><button class="btn" onclick="updateRoleMode()">修改</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/role/deleteRole"><button class="btn" onclick="deleteRoleMode()">删除</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/role/setRoleResourcePage"><button class="btn" onclick="setRoleResourceMode()">设置权限</button></shiro:hasPermission>
								</div>
								<!--分页-->  
								<%@include file="../page.jsp" %>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		
	</div>
</div>

<script src="resources/js/listPage.js"></script>

<script>

function updateRoleMode(){
	var checkId = getOneChooseRol();
	if(checkId == -1) return ;
	showMode('common/role/updateRolePage?roleId='+checkId);
}

function deleteRoleMode(){
	var checkId = getOneChooseRol();
	if(checkId == -1) return ;
	
	bootbox.confirm({
		size: "small",
		title: "确认框",
		message: "你确认<font color='red'>&nbsp; 删除 &nbsp;</font>?",
	    buttons: {
	    	confirm: {
	            label: '确认'
	        },
	        cancel: {
	            label: '取消'
	        }
	    },
	    callback: function (result) {
	    	//确认返回true
	    	if(result){
	    		$.ajax({
					   type: "POST",
					   url: "common/role/deleteRole",
					   data: {"roleId":checkId},
					   success: function(data){
						   common_alert("删除成功");
						   ajaxContent('common/role/roleList')
					   },
					   error: function(data){
						   common_alert("删除失败");
					   }
				});
	    	}
	    }
	});
}

function searchDate(){
	$.ajax({
		   type: "GET",
		   url: "common/role/roleList",
		   data: {
			   "roleId" : $("#roleId").val(),
			   "roleName" : $("#roleName").val(),
			   "pageNum" : $("input[name='pageNum']").val(),
			   "pageSize" : $("input[name='pageSize']").val()
			   },
		   success: function(data){
			   $("#ajaxDetailContect").html(data);
		   },
		   error: function(data){
			   common_alert("删除失败");
		   }
	});
}

function setRoleResourceMode(){
	var checkId = getOneChooseRol();
	if(checkId == -1) return ;
	showMode('common/role/setRoleResourcePage?roleId='+checkId);
}

</script>
