
<%@ page import="app.Moneda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="${session.admin?'administrador':'usuario'}">
		<g:set var="entityName" value="${message(code: 'moneda.label', default: 'Moneda')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-moneda" class="content scaffold-show" role="main">
			<h1 style="color: #999999"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol style="color: #999999" class="property-list moneda">
			
				<g:if test="${monedaInstance?.siglas}">
				<li class="fieldcontain">
					<span id="siglas-label" class="property-label"><g:message code="moneda.siglas.label" default="Siglas" /></span>
					
						<span class="property-value" aria-labelledby="siglas-label"><g:fieldValue bean="${monedaInstance}" field="siglas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${monedaInstance?.valorActual}">
				<li class="fieldcontain">
					<span id="valorActual-label" class="property-label"><g:message code="moneda.valorActual.label" default="Valor Actual" /></span>
					
						<span class="property-value" aria-labelledby="valorActual-label"><g:fieldValue bean="${monedaInstance}" field="valorActual"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${monedaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="moneda.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${monedaInstance?.usuario?.id}">${monedaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:monedaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${monedaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
