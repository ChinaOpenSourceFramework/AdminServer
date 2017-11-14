<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<input type="hidden" name="pageNum" value="${sysUsersListPage.pageNum}">
<input type="hidden" name="pageSize"  value="${sysUsersListPage.pageSize}">

<div class="table-foot-paging">
	<nav aria-label="Page navigation">
	  <ul class="pagination">
	    <li>
	      <a href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li>
	      <a href="#" aria-label="Previous">
	        <span aria-hidden="true">&lsaquo;</span>
	      </a>
	    </li>
	    <li><a href="javascript:changePageNum('1')">1</a></li>
	    <li class="disable"><a href="javascript:changePageNum('2')">2</a></li>
	    <li><a href="javascript:changePageNum('3')">3</a></li>
	    <li><a href="javascript:changePageNum('4')">4</a></li>
	    <li><a href="javascript:changePageNum('5')">5</a></li>
	    <li>
	      <a href="#" aria-label="Next">
	        <span aria-hidden="true">&rsaquo;</span>
	      </a>
	    </li>
	     <li>
	      <a href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>

<div class="pagination-info">
	<p>共有${sysUsersListPage.total}条,每页
		<select name="cars">
			<option value="5">5</option>
			<option value="10" selected="selected">10</option>
			<option value="20">20</option>
			<option value="50">50</option>
			<option value="100">100</option>
			<option value="500">500</option>
		</select>
		条</p>		
</div>
<script type="text/javascript">
	function changePageNum(number){
		//$("input[name='pageNum']").val(3);
		alert(number);
	}
	
</script>