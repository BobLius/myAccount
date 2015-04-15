<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='security'
	uri='http://www.springframework.org/security/tags'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table style="background: #E0DBD6;width: 209px;height: 100%;border: 0;padding: 0">
			<tbody>
				<tr>
					<td vAlign=top width="100%" class="MainCMP_Left">
						<div class="TopCMP_SecMenuBG">
							<ul>
								<c:forEach items="${resources}" var="resource">
									<!-- L1 start -->
										<%-- TopCmp_Sec --%>
										<li class="TopCMP_SecMenuBG_li1"
											id="num<c:out value='${resource.id }'/>"
											onclick="expand(this,null,'<c:out value='${resource.id }'/>');reverse(this);">
											<div class="left_menu_more">
												<c:out value="${resource.name }" />
											</div>
										</li>
										<!-- L1 end -->

										<!-- L2 start-->
										<li id="show<c:out value='${ resource.id }'/>"
											style="display: none; overflow: hidden;"
											class="leftMenu_height_hack">
											 <c:forEach items="${resource.children }" var="resource2">
													<ul>
														<%--${fn:length(rowList)>2 --%>
														<c:set var="expandable" value="false"></c:set>

														<c:forEach items="${resource2.children}" var="resource3">
															<c:if test="${!expandable }">
																<c:if test="${resource3.type == '0' }">
																	<c:set var="expandable" value="true"></c:set>
																</c:if>
															</c:if>
														</c:forEach>

														<c:choose>
															<c:when test="${!expandable }">
																<%--L3 button --%>
																<li id="num<c:out value='${resource2.id }'/>"
																	class="TopCMP_SecMenuBG_li2" onClick="reverse(this);">
																	<div class="left_menu_less2_2"  op_tab="<c:url value='${resource2.url }'/>">
																		<c:out value='${resource2.name}' />
																	</div>
																</li>
															</c:when>
															<c:otherwise>
																<%-- L3 menu --%>
																<li id="num<c:out value='${resource2.id }'/>"
																	class="TopCMP_SecMenuBG_li3"
																	onclick="expand(this,null,'<c:out value='${resource2.id }'/>');reverse(this);">
																	<div class="left_menu_more2">
																		<c:out value='${resource2.name}' />
																	</div>
																</li>

																<li id="show<c:out value='${ resource2.id }'/>"
																	style="display: none; overflow: hidden;"
																	class="leftMenu_height_hack"><c:forEach
																		items="${resource2.children }" var="resource3">
																		<c:if test="${resource3.type == 0 }">
																				<ul>
																					<li id="num<c:out value='${resource3.id }'/>"
																						class="TopCMP_SecMenuBG_li3"
																						onClick="reverse(this);">
																						<div class="left_menu_less3"
																							op_tab="<c:url value='${resource3.url }'/>">
																							<c:out value='${resource3.name}' />
																						</div>
																					</li>
																				</ul>
																		</c:if>
																	</c:forEach></li>
															</c:otherwise>
														</c:choose>
													</ul>
											</c:forEach> 
										</li>
										<!-- L2 end -->
								</c:forEach>
							</ul>
						</div>
					</td>
				</tr>
			</tbody>
		</table>