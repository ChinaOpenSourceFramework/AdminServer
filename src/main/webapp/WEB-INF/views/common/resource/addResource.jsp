<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div id="model_id" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
     	  <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">添加资源</h4>
	      </div>
	      <div class="modal-body">
	        	<form class="form-horizontal" id="resource">
    	        	<input type="hidden" class="form-control" id="pResId" name="pResId" value="-1" placeholder="资源值" >
	            	<input type="hidden" class="form-control" id="resLevel" name="resLevel" value="0" placeholder="级别" >
				
				  <div class="form-group">
				    <label for="resName" class="col-sm-3 control-label">资源名</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="resName" name="resName" placeholder="资源名" required data-bv-stringlength="true" data-bv-stringlength-min="4" data-bv-stringlength-max="30" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="resValue" class="col-sm-3 control-label">资源值</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="resValue" name="resValue" placeholder="资源值" >
				    </div>
				  </div>

				  <div class="form-group">
				    <label for="description" class="col-sm-3 control-label">资源类型</label>
				    <div class="col-sm-9">
						<label class="radio-inline">
						  <input type="radio" name="resType" checked="checked" id="inlineRadio1" value="true"> 叶子节点
						</label>
						<label class="radio-inline">
						  <input type="radio" name="resType" id="inlineRadio2" value="false"> 非叶子节点
						</label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="resIcon" class="col-sm-3 control-label">资源图片</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="resIcon" name="resIcon" placeholder="资源图片" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="resSort" class="col-sm-3 control-label">优先级</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="resSort" name="resSort" placeholder="优先级" data-bv-digits>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="description" class="col-sm-3 control-label">描述</label>
				    <div class="col-sm-9">
				      <textarea class="form-control" rows="3" id="description" name="description" placeholder="描述" ></textarea>
				    </div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <shiro:hasPermission name="/common/resource/addResources"><button type="button" class="btn btn-primary" onclick="addResource()">保存</button></shiro:hasPermission>
	      </div>
    </div>
  </div>
</div>

<script src="resources/js/modePage.js"></script>

<script>

$(function(){
	$('#resource').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        }
	});

	$("#pResId").val($("#addTreePId").val());
	$("#resLevel").val($("#addTreeLevel").val());
});

function addResource(){
   var bootstrapValidator = $('#resource').data('bootstrapValidator');
    //手动触发验证
    bootstrapValidator.validate();
    if(bootstrapValidator.isValid()){
	$.ajax({
		   type: "POST",
		   url: "common/resource/addResources",
		   data: $('#resource').serialize(),
		   success: function(data){
			 common_alert("添加成功");
		     ajaxContent('common/resource/resourceList');
		   },
		   error: function(data){
			   common_alert("添加失败");
		   }
		});
	
	$("#model_id").modal('hide');
    }
}
</script>