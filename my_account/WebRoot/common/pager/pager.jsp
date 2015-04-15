<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
 $(document).ready(function(){
      $("#pager").pager({
		totalCount: "${form.total}",
		pagecount: "${form.totalPages}",
		pagenumber:"${form.page}",
		buttonClickCallback: $.gotoPage	
	});
   });
</script>

<span id="pager"></span>
<%-- modified by lizhenhe@ 2011/12/07  --%>
<%--<c:choose>
	<c:when test="${pager.totalPages>1 }"> <c:set var="pageNo" value="${pager.pageNo }"></c:set></c:when>
	<c:otherwise><c:set var="pageNo" value="1"></c:set></c:otherwise>
</c:choose>
<input type="hidden" name="pager.pageNo" id="pageNumber" value="${pageNo }" /> 
--%>
<sf:hidden path="page" id="pageNumber"/>

<%-- old  在多于1页时,跳到 2页 以后,再次选择过滤结果集只有一页时,无法正常显示第1页 (显示为没有记录) --%>
<%-- 
<input type="hidden" name="pager.pageNumber" id="pageNumber" value="${pager.pageNumber}" />
--%>
<%--<input type="hidden" name="pager.orderBy" id="orderBy" value="${pager.orderBy}" />
<input type="hidden" name="pager.orderType" id="order" value="${pager.orderType}" />
--%>