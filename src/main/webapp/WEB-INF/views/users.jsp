<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="body">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><spring:message code="label.result" />
					${result}<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1">
					<c:forEach items="${resultsOnPage}" var="result">
						<li><a
							href="<spring:url value="/result/${result}" htmlEscape="true" />">${result}</a></li>
					</c:forEach>
				</ul></li>
			<c:set var="page" value="1"></c:set>
			<ul class="pagination">
				<li><a
					href="<spring:url value="/usersprev" htmlEscape="true" />">&laquo;</a></li>
				<li><a
					href="<spring:url value="/userspage/${page}" htmlEscape="true" />">1</a></li>
				<li><a
					href="<spring:url value="/userspage/${page + 1}" htmlEscape="true" />">2</a></li>
				<li><a
					href="<spring:url value="/userspage/${page + 2}" htmlEscape="true" />">3</a></li>
				<li><a
					href="<spring:url value="/userspage/${page + 3}" htmlEscape="true" />">4</a></li>
				<li><a
					href="<spring:url value="/userspage/${page + 4}" htmlEscape="true" />">5</a></li>
				<li><a
					href="<spring:url value="/usersnext" htmlEscape="true" />">&raquo;</a></li>
			</ul>
			<c:if test="${!empty userList}">
				<table class="table table-bordered table-hover table-striped">
					<tr>
						<th><p class="text-primary">
								<spring:message code="label.login" />
								<a
									href="<spring:url value="/filterbylogin" htmlEscape="true" />"><button
										type="button" class="btn btn-default btn-xs">
										<spring:message code="label.sortbylogin" />
									</button></a>
							</p></th>
						<th><p class="text-primary">
								<spring:message code="label.firstname" />
								<a
									href="<spring:url value="/filterbyfname" htmlEscape="true" />"><button
										type="button" class="btn btn-default btn-xs">
										<spring:message code="label.sortbylogin" />
									</button></a>
							</p></th>
						<th><p class="text-primary">
								<spring:message code="label.lastname" />
								<a
									href="<spring:url value="/filterbyLname" htmlEscape="true" />"><button
										type="button" class="btn btn-default btn-xs">
										<spring:message code="label.sortbylogin" />
									</button></a>
							</p></th>
						<th><p class="text-primary">
								<spring:message code="label.email" />
							</p></th>
						<th><p class="text-primary">
								<spring:message code="label.created" />
								<a
									href="<spring:url value="/filterbycreating" htmlEscape="true" />"><button
										type="button" class="btn btn-default btn-xs">
										<spring:message code="label.sortbylogin" />
									</button></a>
							</p></th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach items="${userList}" var="user">
						<tr>
							<td>${user.login}</td>
							<td>${user.firstName}</td>
							<td>${user.lastName}</td>
							<td>${user.email}</td>
							<td>${user.created}</td>
							<td><a
								href="<c:url value="users/profile/show/${user.login}" /> "><button
										type="button" class="btn btn-primary btn-block">
										<spring:message code="label.edit" />
									</button></a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>


	</tiles:putAttribute>
</tiles:insertDefinition>