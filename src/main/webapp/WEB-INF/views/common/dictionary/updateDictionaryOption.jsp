<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div id="model_id" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
     	  <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">添加数据字典选项</h4>
	      </div>
	      <div class="modal-body">
	        	<form class="form-horizontal" id="dictionaryOption">
	        	
	        	 <div class="form-group">
				    <label for="resId" class="col-sm-3 control-label">字典id</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="id" name="id" value="${dictionaryOption.id}" placeholder="字典id" readonly="readonly" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="resName" class="col-sm-3 control-label">资源</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="dictValue" name="dictValue" value="${dictionaryOption.dictValue}" placeholder="资源" readonly="readonly" >
				    </div>
				  </div>
				
				  <div class="form-group">
				    <label for="resName" class="col-sm-3 control-label">选项名称</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="name" name="name" value="${dictionaryOption.name}" placeholder="选项名称" required >
				    </div>
				  </div>
				  				  
				  <div class="form-group">
				    <label for="resValue" class="col-sm-3 control-label">选项值</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="value" name="value" value="${dictionaryOption.value}"  placeholder="选项值" required>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="resName" class="col-sm-3 control-label">排序</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="sort" name="sort" value="${dictionaryOption.sort}"  placeholder="排序" required >
				    </div>
				  </div>
				
				</form>
	      </div>
	      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <shiro:hasPermission name="/common/dictionary/addDictionaryOption"><button type="button" class="btn btn-primary" onclick="addDictionaryOption()">保存</button></shiro:hasPermission>
	      </div>
    </div>
  </div>
</div>

<script src="resources/js/modePage.js"></script>

<script>

$(function(){
	
	$("input[name = 'dictValue']").val($("#dictionaryValue").val());
	$('#dictionaryOption').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        }
	});
});

function addDictionaryOption(){
   var bootstrapValidator = $('#dictionaryOption').data('bootstrapValidator');
    //手动触发验证
    bootstrapValidator.validate();
    if(bootstrapValidator.isValid()){
	$.ajax({
		   type: "POST",
		   url: "common/dictionary/updateDictionaryOption",
		   data: $('#dictionaryOption').serialize(),
		   success: function(data){
			 common_alert("添加成功");
		//     ajaxContent('common/dictionary/dictionaryList');
		   },
		   error: function(data){
			   common_alert("添加失败");
		   }
		});
	
	$("#model_id").modal('hide');
    }
}
</script>