<%@ page import="app.Moneda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="${session.admin?'administrador':'usuario'}">
		<g:set var="entityName" value="${message(code: 'moneda.label', default: 'Moneda')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-moneda" class="content scaffold-edit" role="main">
			<h1 style="color: #999999"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${monedaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${monedaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:monedaInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${monedaInstance?.version}" />
				<fieldset style="color: #999999" class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
