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
		  	<input type="text" class="form-control input-width-x" id="userId" placeholder="用户Id">
		  	<input type="text" class="form-control input-width-xx" id="userName" placeholder="用户Id">
		  	<input type="text" class="form-control input-width-x" id="userId" placeholder="用户Id">
		  	<input type="text" class="form-control input-width-xx" id="userName" placeholder="用户Id">
		  	<input type="text" class="form-control input-width-x" id="password" placeholder="用户Id">
			<button type="submit" class="btn">搜索</button>
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
							<th>实例名称</th>
							<th>地域节点</th>
							<th>公网/内网IP</th>
							<th>产品到期时间</th>
							<th>倒计时</th>
							<th>自动续费/续费周期</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="sysUsers"  items="${sysUsersList}" >
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
									 ${sysUsers.password} 
								</td>
								<td>
									${sysUsers.salt}
								</td>
								<td>
									${sysUsers.departId}
								</td>
								<td>
									${sysUsers.userPhoto}
								</td>
								<td>
									${sysUsers.userPhone}
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
								
							
								<div class="table-foot-paging">
									<nav aria-label="Page navigation">
									  <ul class="pagination">
									    <li>
									      <a href="#" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    <li><a href="#">1</a></li>
									    <li><a href="#">2</a></li>
									    <li><a href="#">3</a></li>
									    <li><a href="#">4</a></li>
									    <li><a href="#">5</a></li>
									    <li>
									      <a href="#" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									  </ul>
									</nav>
								</div>
								
								<div class="pagination-info">
									<p>总共100</p>
								</div>
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
		alert("请选择一行");
	}else if(checkRow.length > 1){
		alert("最多只能选中一行");
	}else {
		showMode('common/user/updateUserPage?userId='+checkRow.val());
	}
}

function deleteUser(){
	var checkRow =$(".content-table table tbody input:checked");
	if(checkRow.length == 0){
		alert("请选择一行");
	}else if(checkRow.length > 1){
		alert("最多只能选中一行");
	}else {
		if(window.confirm("你确定要删除吗？")){
            $.ajax({
				   type: "POST",
				   url: "common/user/deleteUser",
				   data: {"userId":checkRow.val()},
				   success: function(data){
				     alert("Add Success");
				     ajaxContent('common/user/userList')
				   },
				   error: function(data){
					   alert("Add Error");
				   }
				});
            
            return true;
         }else{
            alert("取消");
            return false;
        }
	}
}

</script>
