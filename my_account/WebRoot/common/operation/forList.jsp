<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


		<c:if test="${existsView != 'false' }">
		    <c:if test="${fn:endsWith(auditStatus,'0')}">
					<input type="button" value="查看" onClick="javascript:JqueryDialog.Open('','${basePath }${objName }/view?${!isPk?'id=':'' }${objId}',${width },${height });"
						class="button2">
			</c:if>
			<c:if test="${fn:endsWith(auditStatus,'P')}">
					<input type="button" value="查看" onClick="javascript:JqueryDialog.Open('','${basePath }${objName }/viewPending?${!isPk?'id=':'' }${objId}',${width },${height });"
						class="button2">
			</c:if>
			<c:if test="${fn:endsWith(auditStatus,'R')}">
					<input type="button" value="查看" onClick="javascript:JqueryDialog.Open('','${basePath }${objName }/viewReject?${!isPk?'id=':'' }${objId}',${width },${height });"
						class="button2">
			</c:if>
		</c:if>
		
		
		<c:if test="${fn:endsWith(auditStatus,'P')}">
			<input type="button" value="审核" onClick="javascript:JqueryDialog.Open('','${basePath }${objName }/audit?${!isPk?'id=':'' }${objId}',${width },${height });"
					class="button2">
		</c:if>
		<c:if test="${fn:endsWith(auditStatus,'0')}">
			<c:if test="${existsEdit != 'false'}">	
				<c:if test="${!fn:startsWith(auditStatus,'D')}">
						<input type="button" value="修改" class="button2" onclick="javascript:JqueryDialog.Open('','${basePath }${objName }/edit?${!isPk?'id=':'' }${objId}',${width },${height });"/>
				</c:if>
			</c:if>
				<input type="button" value="删除草稿" onClick="javascript:del('${objId}');"
					class="button2">
		</c:if>
		<c:if test="${fn:endsWith(auditStatus,'R')}">
			<c:if test="${existsEdit != 'false'}">	
				<c:if test="${!fn:startsWith(auditStatus,'D')}">
						<input type="button" value="修改" class="button2" onclick="javascript:JqueryDialog.Open('','${basePath }${objName }/editReject?${!isPk?'id=':'' }${objId}',${width },${height });"/>
				</c:if>
			</c:if>
				<input type="button" value="删除草稿" onClick="javascript:del('${objId}');"
					class="button2">
		</c:if>		
		
		<c:if test="${fn:endsWith(auditStatus,'0')}">
			<input type="button" value="送审" class="button2"
					onclick="javascript:submit_('${objId}');" />
		</c:if>	
 