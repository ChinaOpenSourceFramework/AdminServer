<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div id="model_id" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
     	  <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">添加角色</h4>
	      </div>
	      <div class="modal-body">
	        	<form class="form-horizontal" id="role">
				  <div class="form-group">
				    <label for="roleName" class="col-sm-3 control-label">角色名</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="roleName" name="roleName" placeholder="角色名" required data-bv-stringlength="true" data-bv-stringlength-min="6" data-bv-stringlength-max="30" >
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
		        <shiro:hasPermission name="/common/role/addRole"><button type="button" class="btn btn-primary" onclick="addRole()">保存</button></shiro:hasPermission>
	      </div>
    </div>
  </div>
</div>

<script src="resources/js/modePage.js"></script>

<script>
$(function(){
	$('#role').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        }
	});

});

function addRole(){
   var bootstrapValidator = $('#role').data('bootstrapValidator');
   //手动触发验证
   bootstrapValidator.validate();
   if(bootstrapValidator.isValid()){
	$.ajax({
		   type: "POST",
		   url: "common/role/addRole",
		   data: $('#role').serialize(),
		   success: function(data){
			 common_alert("添加成功");
		     ajaxContent('common/role/roleList');
		   },
		   error: function(data){
			   common_alert("添加失败");
		   }
		});
	
	$("#model_id").modal('hide');
    }
}
</script>