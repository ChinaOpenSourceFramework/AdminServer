<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div id="model_id" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
     	  <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">修改资源</h4>
	      </div>
	      <div class="modal-body">
	        	<form class="form-horizontal" id="resource">

				  <div class="form-group">
				    <label for="resId" class="col-sm-3 control-label">资源id</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="resId" name="resId" value="${sysResources.resId}" placeholder="资源id" readonly="readonly" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="resName" class="col-sm-3 control-label">资源名</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="resName" name="resName" value="${sysResources.resName}"  placeholder="资源名" required data-bv-stringlength="true" data-bv-stringlength-min="4" data-bv-stringlength-max="30" >
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="resValue" class="col-sm-3 control-label">资源值</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="resValue" name="resValue" value="${sysResources.resValue}" placeholder="资源值">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="description" class="col-sm-3 control-label">资源类型</label>
				    <div class="col-sm-9">
						<label class="radio-inline">
						  <input type="radio" name="resType" <c:if test="${sysResources.resType}">checked="checked"</c:if> id="inlineRadio1" value="true"> 叶子节点
						</label>
						<label class="radio-inline">
						  <input type="radio" name="resType" <c:if test="${!sysResources.resType}">checked="checked"</c:if> id="inlineRadio2" value="false"> 非叶子节点
						</label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="resIcon" class="col-sm-3 control-label">资源图片</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="resIcon" name="resIcon" value="${sysResources.resIcon}" placeholder="资源图片" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="resSort" class="col-sm-3 control-label">优先级</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="resSort" name="resSort" value="${sysResources.resSort}" placeholder="优先级" data-bv-digits>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="description" class="col-sm-3 control-label">描述</label>
				    <div class="col-sm-9">
				      <textarea class="form-control" rows="3" id="description" name="description" placeholder="描述" >${sysResources.description}</textarea>
				    </div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" onclick="updateResource()">保存</button>
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

});

function updateResource(){
	   var bootstrapValidator = $('#resource').data('bootstrapValidator');
       //手动触发验证
       bootstrapValidator.validate();
       if(bootstrapValidator.isValid()){
			$.ajax({
				   type: "POST",
				   url: "common/resource/updateResources",
				   data: $('#resource').serialize(),
				   success: function(data){
					 common_alert("更新成功");
				     ajaxContent('common/resource/resourceList');
				   },
				   error: function(data){
					   common_alert("更新失败");
				   }
				});
			
			$("#model_id").modal('hide');
       }
}
</script>