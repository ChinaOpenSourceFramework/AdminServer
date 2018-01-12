<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<div id="model_id" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
     	  <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">添加用户</h4>
	      </div>
	      <div class="modal-body">
	        	<form class="form-horizontal" id="user">
				  <div class="form-group">
				    <label for="userName" class="col-sm-3 control-label">登录名</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="userName" name="userName" placeholder="登录名" required data-bv-stringlength="true" data-bv-stringlength-min="6" data-bv-stringlength-max="30" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-3 control-label">密码</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="password" name="password" placeholder="密码" required data-bv-stringlength="true" data-bv-stringlength-min="6" data-bv-stringlength-max="30" >
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="realName" class="col-sm-3 control-label">用户名</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="realName" name="realName" placeholder="用户名">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="departId" class="col-sm-3 control-label">部门ID</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="departId" name="departId" placeholder="部门ID">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="userPhoto" class="col-sm-3 control-label">用户头像</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="userPhoto" name="userPhoto" placeholder="用户头像">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="userPhone" class="col-sm-3 control-label">用户电话</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="用户电话">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="userQq" class="col-sm-3 control-label">用户QQ</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="userQq" name="userQq" placeholder="用户QQ">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="userEmail" class="col-sm-3 control-label">用户邮箱</label>
				    <div class="col-sm-9">
				      <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="用户邮箱">
				    </div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <shiro:hasPermission name="/common/user/addUser"><button type="button" class="btn btn-primary" onclick="addUser()">保存</button></shiro:hasPermission>
	      </div>
    </div>
  </div>
</div>

<script src="resources/js/modePage.js"></script>

<script>

$(function(){
	$('#user').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        }
	});
});

function addUser(){
	   
	   var bootstrapValidator = $('#user').data('bootstrapValidator');
       //手动触发验证
       bootstrapValidator.validate();
       if(bootstrapValidator.isValid()){
			$.ajax({
				   type: "POST",
				   url: "common/user/addUser",
				   data: $('#user').serialize(),
				   success: function(data){
					 common_alert("添加成功");
				     ajaxContent('common/user/userList')
				   },
				   error: function(data){
					   common_alert("添加失败");
				   }
				});
			
			$("#model_id").modal('hide');
       }
}
</script>