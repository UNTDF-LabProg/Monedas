
<%@ page import="app.Grupo" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="administrador">
  <g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div id="show-grupo" class="content scaffold-show" role="main">
    <h1 style="color: #999999"><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list grupo" style="color: #999999">
      <g:if test="${grupoInstance?.nombre}">
        <li class="fieldcontain">
          <span id="nombre-label" class="property-label"><g:message code="grupo.nombre.label" default="Nombre" /></span>
          <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${grupoInstance}" field="nombre"/></span>
        </li>
      </g:if>
      <g:if test="${grupoInstance?.isAdmin}">
        <li class="fieldcontain">
          <span id="isAdmin-label" class="property-label"><g:message code="grupo.isAdmin.label" default="Is Admin" /></span>
          <span class="property-value" aria-labelledby="isAdmin-label"><g:formatBoolean boolean="${grupoInstance?.isAdmin}" /></span>
        </li>
      </g:if>
      <g:if test="${grupoInstance?.usuarios}">
        <li class="fieldcontain">
          <span id="usuarios-label" class="property-label"><g:message code="grupo.usuarios.label" default="Usuarios" /></span>
        <g:each in="${grupoInstance.usuarios}" var="u">
          <span class="property-value" aria-labelledby="usuarios-label"><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
        </g:each>
        </li>
      </g:if>
    </ol>
    <g:form url="[resource:grupoInstance, action:'delete']" method="DELETE">
      <fieldset style="color: #999999" class="buttons">
        <g:link class="edit" action="edit" resource="${grupoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
