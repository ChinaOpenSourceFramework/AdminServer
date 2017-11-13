//提示框
function common_alert(msg){
	bootbox.alert({ 
	   size: "small",
	   title: "提示框",
	   buttons: {
	        ok: {
	            label: '确认'
	        }
	   },
	   message: msg
	});
}
//由于确认框是异步加载的，所有不可以用，
function common_confirm(msg){
	bootbox.confirm({
		size: "small",
		title: "确认框",
		message: "你确认<font color='red'>&nbsp;"+msg+"&nbsp;</font>?",
	    buttons: {
	    	confirm: {
	            label: '确认'
	        },
	        cancel: {
	            label: '取消'
	        }
	    },
	    callback: function (result) {
	    	return result;
	    }
	});
	
}