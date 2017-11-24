<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


   <SCRIPT type="text/javascript">
      
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
        

    </SCRIPT>
    
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
									<button class="btn" onclick="showMode('common/resource/addResourcesPage')">添加</button>
									<button class="btn" onclick="updateResource()">修改</button>
									<button class="btn" onclick="deleteResource()">删除</button>
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
<script>
$(function(){
	///------------------------------表格全选/反全选------------------------------------------	
	$(".content-table table thead input , .content-table table tfoot input").click(function(){
		if (this.checked) {  
			$(".content-table table input").each(function(){
				 $(this).prop("checked", true); 
			});  
			
        } else {  
        	$(".content-table table input").each(function(){
        		 $(this).prop("checked", false); 
			});  
        }  
		
	});
	$(".content-table table tbody input").click(function(){
		if (this.checked) {  
		//选中
			var allRow = $(".content-table table tbody input").length;
			var checkRow =$(".content-table table tbody input:checked").length;
			if (allRow == checkRow){
				$(".content-table table thead input").prop("checked", true); 
				$(".content-table table tfoot input").prop("checked", true); 
			}
		} else {
		//未选中
			$(".content-table table thead input").prop("checked", false); 
			$(".content-table table tfoot input").prop("checked", false); 
		}
	});
	
})

function updateResource(){
	var checkRow =$(".content-table table tbody input:checked");
	if(checkRow.length == 0){
		common_alert("请选择一行");
	}else if(checkRow.length > 1){
		common_alert("最多只能选中一行");
	}else {
		showMode('common/resource/updateResourcesPage?resId='+checkRow.val());
	}
}

function deleteResource(){
	var checkRow =$(".content-table table tbody input:checked");
	if(checkRow.length == 0){
		common_alert("请选择一行");
	}else if(checkRow.length > 1){
		common_alert("最多只能选中一行");
	}else {
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
						   data: {"resId":checkRow.val()},
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
