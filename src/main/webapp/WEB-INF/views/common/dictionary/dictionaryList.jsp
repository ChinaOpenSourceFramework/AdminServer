<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div class="detail-side-margin">
	<!-- 导航标题 -->
	<div class="detail-title">
		<div class="title-left">
			<h4>数据字典</h4>
		</div>
	</div>
	<!-- 详细内容 -->
	<div class="detail-body">
		<!-- 搜索-->
		<div class="content-search">
		  	<input type="text" class="form-control input-width-x" id="name" value="${dictionary.name}" placeholder="字典名">
		  	<input type="text" class="form-control input-width-xx" id="value" value="${dictionary.value}" placeholder="字典值">
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
							<th>description</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="dictionary"  items="${dictionaryListPage.list}" >
	            			<tr>
	            				<td width="10">
									<input type="checkbox" name="id" value="${dictionary.id}"/> 
								</td>
								<td>
									${dictionary.id}
								</td>
								<td>
									 ${dictionary.name} 
								</td>
								<td>
									 ${dictionary.value} 
								</td>
								<td>
									 ${dictionary.description} 
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
									<shiro:hasPermission name="/common/dictionary/addDictionaryPage"><button class="btn" onclick="showMode('common/dictionary/addDictionaryPage')">添加</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/dictionary/updateDictionaryPage"><button class="btn" onclick="updateDictionaryMode()">修改</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/dictionary/deleteDictionary"><button class="btn" onclick="deleteDictionaryMode()">删除</button></shiro:hasPermission>
									<shiro:hasPermission name="/common/dictionary/dictionaryOptionList"><button class="btn" onclick="optionDictionary()">管理选项</button></shiro:hasPermission>
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

function optionDictionary(){
	var checkId = getOneChooseRol();
	if(checkId == -1) return ;
	ajaxContent('common/dictionary/dictionaryOptionList?dictionaryId='+checkId);
}

function updateDictionaryMode(){
	var checkId = getOneChooseRol();
	if(checkId == -1) return ;
	showMode('common/dictionary/updateDictionaryPage?dictionaryId='+checkId);
}

function deleteDictionaryMode(){
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
					   url: "common/dictionary/deleteDictionary",
					   data: {"dictionaryId": checkId},
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
