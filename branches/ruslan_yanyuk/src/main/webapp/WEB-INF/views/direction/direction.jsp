<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!Doctype html>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
	<!-- Direction exists -->
	<c:if test="${param.success eq true}">
    <div class="alert alert-success">Direction added (edited) successfully!</div>
   </c:if>
   <c:if test="${param.fail eq true}">
    <div class="alert alert-danger">This direction already exists!</div>
   </c:if>
		<!-- Add direction -->
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<!-- Button trigger modal -->
			<button class="btn btn-primary btn-lg" data-toggle="modal"
				data-target="#myModal">
				<spring:message code="label.add" />
			</button>

			<form:form action="addDirection" commandName="direction"
				class="form-horizontal" method="post">
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">
									<spring:message code="label.newdirection" />
								</h4>
							</div>
							<div class="modal-body">
								<div class="formGroup">
									<label for="name" class="col-sm-2 control-label"> <spring:message
											code="label.name" /></label>
									<div class="col-sm-10">
										<form:input path="name" cssClass="form-control" />
										<form:errors path="name" />
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">
									<spring:message code="label.close" />
								</button>
								<input type="submit" class="btn btn-primary"
									value="<spring:message code="label.add"/>" />
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</security:authorize>

		<br>
		<div class="body">

			<!-- List of directions -->
			<c:if test="${!empty directionList}">
				<table class="table table-bordered table-hover table-striped">
					<tr>
						<th><spring:message code="label.directions" /></th>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<th>&nbsp;</th>
							<th>&nbsp;</th>
						</security:authorize>
					</tr>
					<c:forEach items="${directionList}" var="direction1">
						<tr>
							<td>${direction1.name}</td>
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<td>
									<button class="btn btn-primary btn-lg" data-toggle="modal"
										data-target="#myModal${direction1.id}">
										<spring:message code="label.edit" />
									</button> <form:form action="editDirection"
										commandName="direction" class="form-horizontal" method="post">
										<!-- Modal -->
										<div class="modal fade" id="myModal${direction1.id}"
											tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="false">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">&times;</span><span
																class="sr-only">Close</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">
															<spring:message code="label.editdirection" />
														</h4>
													</div>
													<div class="modal-body">
														<div class="formGroup">
														<form:input type="hidden" path="id"
																value="${direction1.id}" />
															<label for="name" class="col-sm-2 control-label">
																<spring:message code="label.name" />
															</label>
															<div class="col-sm-10">
																<form:input path="name" cssClass="form-control" value="${direction1.name}"/>
																<form:errors path="name" />
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">
															<spring:message code="label.close" />
														</button>
														<input type="submit" class="btn btn-primary"
															value="<spring:message code="label.edit"/>" />
													</div>
												</div>
											</div>
										</div>
									</form:form>
								</td>
								<td>
									<button class="btn btn-danger" data-toggle="modal"
										data-target="#myModalDelete${direction.id}">
										<spring:message code="label.delete" />
									</button>
									<form:form action="direction/delete/${direction.id}"
										commandName="direction" class="form-horizontal" method="get">
										<!-- Modal -->
										<div class="modal fade" id="myModalDelete${direction.id}"
											tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="false">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">&times;</span><span
																class="sr-only">Close</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">
															<spring:message code="label.delete" />
														</h4>
													</div>
													<div class="modal-body">
														<div class="formGroup">
														Are you sure? There may be current groups!
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">
															<spring:message code="label.close" />
														</button>
														<input type="submit" class="btn btn-primary"
															value="<spring:message code="label.delete"/>" />
													</div>
												</div>
											</div>
										</div>
									</form:form>
									</td>
									
							</security:authorize>
						</tr>
					</c:forEach>
				</table>
			</c:if>

		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>