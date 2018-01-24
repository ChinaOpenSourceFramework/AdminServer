<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div class="detail-side-margin">
	<!-- 导航标题 -->
	<div class="detail-title">
		<div class="title-left">
			<h4>数据字典 <font color='red'>&nbsp;${dictionary.name}&nbsp;</font>选项</h4>
		</div>
	</div>
	<!-- 详细内容 -->
	<div class="detail-body">
		<!-- 搜索-->
		<div class="content-search">
			<input type="hidden" id = "dictionaryId" value="${dictionary.id}">
			<input type="hidden" id = "dictionaryValue" value="${dictionary.value}">
 		  	<input type="text" class="form-control input-width-x" id="name" value="${dictionaryOption.name}" placeholder="字典选项名">
		  	<input type="text" class="form-control input-width-xx" id="value" value="${dictionaryOption.value}" placeholder="字典选项值">
			<button type="button" class="btn" onclick="searchDate()">搜索</button>
 		</div>
 	
		<!-- 表格详细内容 -->
		<div class="content-table">
			<div class="content-body-table">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th width="10">
								<input type="checkbox" name="id"/> 
							</th>
							<th>id</th>
							<th>name</th>
							<th>value</th>
							<th>sort</th>
							<th>locked</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="dictionaryOption"  items="${dictionaryOptionListPage.list}" >
	            			<tr>
	            				<td width="10">
									<input type="checkbox" name="id" value="${dictionaryOption.id}"/> 
								</td>
								<td>
									${dictionaryOption.id}
								</td>
								<td>
									 ${dictionaryOption.name} 
								</td>
								<td>
									 ${dictionaryOption.value} 
								</td>
								<td>
									 ${dictionaryOption.sort} 
								</td>
								<td>
									 ${dictionaryOption.locked} 
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
									<shiro:hasPermission name="/common/dictionary/addDictionaryOptionPage"><button class="btn" onclick="showMode('common/dictionary/addDictionaryOptionPage')">添加</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/dictionary/updateDictionaryOptionPage"><button class="btn" onclick="updateDictionaryOptionMode()">修改</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/dictionary/deleteDictionaryOption"><button class="btn" onclick="deleteDictionaryOptionMode()">删除</button></shiro:hasPermission>
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

function updateDictionaryOptionMode(){
	var checkId = getOneChooseRol();
	if(checkId == -1) return ;
	showMode('common/dictionary/updateDictionaryOptionPage?dictionaryOptionId='+checkId);
}

function deleteDictionaryOptionMode(){
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
					   url: "common/dictionary/deleteDictionaryOption",
					   data: {"dictionaryOptionId": checkId},
					   success: function(data){
						   common_alert("删除成功");
						   ajaxContent('common/dictionary/dictionaryList')
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
		   url: "common/dictionary/dictionaryList",
		   data: {
			   "name" : $("#name").val(),
			   "value" : $("#value").val(),
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
