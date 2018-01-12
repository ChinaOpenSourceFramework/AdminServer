<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div class="detail-side-margin">
	<!-- 导航标题 -->
	<div class="detail-title">
		<div class="title-left">
			<h4>资源管理</h4>
		</div>
	</div>

	<div class="detail-left-nav">
        <ul id="treeDemo" class="ztree"></ul>
    </div>
    
	<input type="hidden" id="addTreeLevel" name="treeLevel" value="0">
	<input type="hidden" id="addTreePId" name="treePId" value="-1">
	
	<!-- 详细内容 -->
	<div class="detail-body detail-body-margin">
		
		<!-- 搜索-->
		<div class="content-search">
		  	<input type="text" class="form-control input-width-x" id="resId" value="${sysResources.resId}" placeholder="资源Id">
		  	<input type="text" class="form-control input-width-xx" id="resName" value="${sysResources.resName}" placeholder="资源名">
			<button type="button" class="btn" onclick="searchDate()">搜索</button>
		</div>

		<!-- 表格详细内容 -->
		<div class="content-table">
			<div class="content-body-table">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th width="10">
								<input type="checkbox" name="resId"/> 
							</th>
							<th>资源Id</th>
							<th>资源名</th>
							<th>资源值</th>
							<th>资源类型</th>
							<th>优先级</th>
							<th>描述</th>
							<th>是否锁定</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="sysResources"  items="${sysResourcesListPage.list}" >
	            			<tr>
	            				<td width="10">
									<input type="checkbox" name="resId" value="${sysResources.resId}"/> 
								</td>
								<td>
									${sysResources.resId}
								</td>
								<td>
									 ${sysResources.resName} 
								</td>
								<td>
									 ${sysResources.resValue} 
								</td>
								<td>
									<c:choose>
										<c:when test="${sysResources.resType}">叶子节点</c:when>
										<c:otherwise>非叶子节点</c:otherwise>
									</c:choose>
									  
								</td>
								<td>
									 ${sysResources.resSort} 
								</td>
								<td>
									 ${sysResources.description} 
								</td>
								<td>
									${sysResources.locked}
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
								<input type="checkbox" name="resId"/> 
							</td>
							<td colspan="7">
								<div class="table-foot-operate">
									<shiro:hasPermission name="/common/resource/addResourcesPage"><button class="btn" onclick="showMode('common/resource/addResourcesPage')">添加</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/resource/updateResourcesPage"><button class="btn" onclick="updateResourceMode()">修改</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/resource/deleteResources"><button class="btn" onclick="deleteResourceMode()">删除</button></shiro:hasPermission>
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
var setting = {
    data: {
        simpleData: {
            enable: true
        }
    },
    callback: {
		onClick: zTreeOnClick
	}
};

var zNodes = ${resourceTreeJson};

$(document).ready(function(){
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
});
 
function zTreeOnClick(event, treeId, treeNode) {
     $("#addTreeLevel").val(treeNode.level+1);
     $("#addTreePId").val(treeNode.id);
};
    
    
function updateResourceMode(){
	var checkId = getOneChooseRol();
	if(checkId == -1) return ;
	showMode('common/resource/updateResourcesPage?resId='+checkId);
}

function deleteResourceMode(){
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
					   url: "common/resource/deleteResources",
					   data: {"resId": checkId},
					   success: function(data){
						   common_alert("删除成功");
						   ajaxContent('common/resource/resourceList')
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
		   url: "common/resource/resourceList",
		   data: {
			   "resId" : $("#resId").val(),
			   "resName" : $("#resName").val(),
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

</script>
