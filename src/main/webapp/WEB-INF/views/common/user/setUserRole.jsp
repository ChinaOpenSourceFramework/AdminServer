<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<input type="hidden" id="userId" name="userId" value="${userId}">

<div id="model_id" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
     	  <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">设置用户角色</h4>
	      </div>
	      <div class="modal-body">
	        	<form class="form-horizontal" id="user">
				  <div class="form-group">
				    <div class="col-sm-9 col-sm-offset-3 ">
				    	<c:forEach  var="role"  items="${myRoles}" >
					    	<div class="checkbox">
							  <label>
							    <input type="checkbox" name="chooseRole" <c:if test="${role.own}"> checked="checked" </c:if> value="${role.roleId}"> ${role.roleName}
							  </label>
							</div>
				    	</c:forEach>
				    </div>
				  </div>
				</form>
	      </div>
	      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" onclick="setUserRole()">保存</button>
	      </div>
    </div>
  </div>
</div>

<script src="resources/js/modePage.js"></script>

<script>
function setUserRole(){
	var roleIds = "";
	$("input[name='chooseRole']:checkbox:checked").each(function() {
		roleIds = roleIds+$(this).val()+",";
	});
 	$.ajax({
		   type: "POST",
		   url: "common/user/saveUserRole",
		   data: {
			   "userId":$("#userId").val(),
			   "roleIds":roleIds
		   },
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
</script>