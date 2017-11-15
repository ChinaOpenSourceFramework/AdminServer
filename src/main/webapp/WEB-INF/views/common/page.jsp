<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<input type="hidden" name="pageNum" value="${pageInfo.pageNum}">
<input type="hidden" name="pageSize"  value="${pageInfo.pageSize}">

<div class="table-foot-paging">
	<nav aria-label="Page navigation">
	  <ul class="pagination">
	    <c:choose>
	    	<c:when test="${pageInfo.isFirstPage}">
		    	<li class="disabled">
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="disabled">
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
	    	</c:when>
	    	<c:otherwise>
	    		<li>
			      <a href="javascript:changePageNum(1)" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li>
			      <a href="javascript:changePageNum('${pageInfo.prePage}')" aria-label="Previous">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
	    	</c:otherwise>
	    </c:choose>
	   
	    <c:forEach  var="number"  items="${pageInfo.navigatepageNums}" >
	    	<c:if test="${number != pageInfo.pageNum}">
	    		<li><a href="javascript:changePageNum('${number}')">${number}</a></li>
	    	</c:if>
	    	<c:if test="${number == pageInfo.pageNum}">
	    		<li class="active"><a href="javascript:changePageNum('${number}')">${number}</a></li>
	    	</c:if>
	    </c:forEach>
	   
	    
	    <c:choose>
	    	<c:when test="${pageInfo.isLastPage}">
				<li class="disabled">
				  <a href="#" aria-label="Next">
				    <span aria-hidden="true">&rsaquo;</span>
				  </a>
				</li>
				<li class="disabled">
				  <a href="#" aria-label="Next">
				    <span aria-hidden="true">&raquo;</span>
				  </a>
				</li>								
	    	</c:when>
	    	<c:otherwise>
	    		<li>
				  <a href="javascript:changePageNum('${pageInfo.nextPage}')" aria-label="Next">
				    <span aria-hidden="true">&rsaquo;</span>
				  </a>
				</li>
				<li>
				  <a href="javascript:changePageNum('${pageInfo.pages}')" aria-label="Next">
				    <span aria-hidden="true">&raquo;</span>
				  </a>
				</li>		
	    	</c:otherwise>
	    </c:choose>
	  </ul>
	</nav>
</div>

<div class="pagination-info">
	<p>共有${pageInfo.total}条,每页
		<select name="changePageSize">
			<c:choose>
				<c:when test="${pageInfo.pageSize ==3}">
					<option value="3" selected='selected'>3</option>
				</c:when>
				<c:otherwise>
					<option value="3">3</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${pageInfo.pageSize ==5}">
					<option value="5" selected='selected'>5</option>
				</c:when>
				<c:otherwise>
					<option value="5">5</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${pageInfo.pageSize ==10}">
					<option value="10" selected='selected'>10</option>
				</c:when>
				<c:otherwise>
					<option value="10">10</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${pageInfo.pageSize ==20}">
					<option value="20" selected='selected'>20</option>
				</c:when>
				<c:otherwise>
					<option value="20">20</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${pageInfo.pageSize ==50}">
					<option value="50" selected='selected'>50</option>
				</c:when>
				<c:otherwise>
					<option value="50">50</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${pageInfo.pageSize ==100}">
					<option value="100" selected='selected'>100</option>
				</c:when>
				<c:otherwise>
					<option value="100">100</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${pageInfo.pageSize ==500}">
					<option value="500" selected='selected'>500</option>
				</c:when>
				<c:otherwise>
					<option value="500">500</option>
				</c:otherwise>
			</c:choose>
		</select>
		条</p>		
</div>
<script type="text/javascript">
	function changePageNum(number){
		$("input[name='pageNum']").val(number);
		searchDate();
	}
	
	$("select[name='changePageSize']").change(function(){
		var pageSize = $("select[name='changePageSize']").val() ;
		$("input[name='pageSize']").val(pageSize);
		searchDate();
	});
	
	
</script>
