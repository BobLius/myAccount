<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:if test="${fn:endsWith(auditStatus,'P')}">
		<input type="button" value="审核"
			onClick="javascript:document.location.href='${basePath }${objName }/audit?${!isPk?'id=':'' }${objId}'"
			class="button">
</c:if>
<c:if test="${fn:endsWith(auditStatus,'0')}">
	<c:if test="${existsEdit != 'false'}">	
		<c:if test="${!fn:startsWith(auditStatus,'D')}">
				<input type="button" value="修改" class="button"
					onclick="javascript:document.location.href='${basePath }${objName }/edit?${!isPk?'id=':'' }${objId}'" />
		</c:if>
	</c:if>	
		<input type="button" value="删除草稿"
			onClick="javascript:del('${objId}');" class="button">
</c:if>

<c:if test="${fn:endsWith(auditStatus,'R')}">
	<c:if test="${existsEdit != 'false'}">	
		<c:if test="${!fn:startsWith(auditStatus,'D')}">
				<input type="button" value="修改" class="button"
					onclick="javascript:document.location.href='${basePath }${objName }/editReject?${!isPk?'id=':'' }${objId}'" />
		</c:if>
	</c:if>
		<input type="button" value="删除草稿"
			onClick="javascript:del('${objId}');" class="button">
</c:if>

<c:if test="${fn:endsWith(auditStatus,'0')}">
		<input type="button" value="送审" class="button"
			onclick="javascript:submit_('${objId}');" />
</c:if>
<c:choose>
	<c:when test="${param.from != 'from'}">
		<input type="button" value="返回" class="button"
			onclick="javascript:parent.window.JqueryDialog.CloseAndRefresh()" />
	</c:when>
	<c:otherwise>
		<input type="button" value="返回" class="button"
			onclick="javascript:parent.window.JqueryDialog.Close()" />
	</c:otherwise>
</c:choose>
