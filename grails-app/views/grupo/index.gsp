
<%@ page import="app.Grupo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="administrador">
    <link rel="stylesheet" type="text/css" href="administrador" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">  
    <g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div id="list-grupo" class="content scaffold-list" role="administrador">
    <h1 style="color: #999999"><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table" style="color: #999999">
      <thead>
        <tr>
          <g:sortableColumn property="nombre" title="${message(code: 'grupo.nombre.label', default: 'Nombre')}" />
          <g:sortableColumn property="isAdmin" title="${message(code: 'grupo.isAdmin.label', default: 'Is Admin')}" />
        </tr>
      </thead>
      <tbody>
      <g:each in="${grupoInstanceList}" status="i" var="grupoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
          <td><g:link action="show" id="${grupoInstance.id}">${fieldValue(bean: grupoInstance, field: "nombre")}</g:link></td>
          <td><g:formatBoolean boolean="${grupoInstance.isAdmin}" /></td>
        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${grupoInstanceCount ?: 0}" />
    </div>
  </div>
</body>
</html>
