<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div class="detail-side-margin">
	<!-- 导航标题 -->
	<div class="detail-title">
		<div class="title-left">
			<h4>用户管理</h4>
		</div>
	</div>
	<!-- 详细内容 -->
	<div class="detail-body">
		
		<!-- 搜索-->
		<div class="content-search">
		  	<input type="text" class="form-control input-width-x" id="userId" value="${sysUsers.userId}" placeholder="用户Id">
		  	<input type="text" class="form-control input-width-xx" id="userName" value="${sysUsers.userName}" placeholder="用户名">
			<button type="button" class="btn" onclick="searchDate()">搜索</button>
		</div>

		<!-- 表格详细内容 -->
		<div class="content-table">
			<div class="content-body-table">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th width="10">
								<input type="checkbox" name="userId"/> 
							</th>
							<th>用户id</th>
							<th>用户名</th>
							<th>真实名</th>
							<th>电话</th>
							<th>邮箱</th>
							<th>是否锁定</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="sysUsers"  items="${sysUsersListPage.list}" >
	            			<tr>
	            				<td width="10">
									<input type="checkbox" name="userId" value="${sysUsers.userId}"/> 
								</td>
								<td>
									${sysUsers.userId}
								</td>
								<td>
									 ${sysUsers.userName} 
								</td>
								<td>
									 ${sysUsers.realName} 
								</td>
								<td>
									${sysUsers.userPhone}
								</td>
								<td>
									${sysUsers.userEmail}
								</td>
								<td>
									${sysUsers.locked}
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
								<input type="checkbox" name="userId"/> 
							</td>
							<td colspan="7">
								<div class="table-foot-operate">
									<button class="btn" onclick="showMode('common/user/addUserPage')">添加</button>
									<button class="btn" onclick="updateUser()">修改</button>
									<button class="btn" onclick="deleteUser()">删除</button>
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

function updateUser(){
	var checkRow =$(".content-table table tbody input:checked");
	if(checkRow.length == 0){
		common_alert("请选择一行");
	}else if(checkRow.length > 1){
		common_alert("最多只能选中一行");
	}else {
		showMode('common/user/updateUserPage?userId='+checkRow.val());
	}
}

function deleteUser(){
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
						   url: "common/user/deleteUser",
						   data: {"userId":checkRow.val()},
						   success: function(data){
							   common_alert("删除成功");
							   ajaxContent('common/user/userList')
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
		   url: "common/user/userList",
		   data: {
			   "userId" : $("#userId").val(),
			   "userName" : $("#userName").val(),
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

function a(){
	alert("a");
}


</script>
