
<%@ page import="app.Usuario" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="administrador">
    <link rel="stylesheet" type="text/css" href="administrador" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">  
    <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>                
  </head>
  <body class="centrarCuerpo">            
     <div id="list-usuario" class="content scaffold-list" role="administrador">
      <h1 style="color: #999999">Listado de Usuarios </h1>
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>                  
      <table class="table" style="color: #999999">
        <thead>
          <tr>					
            <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre.label', default: 'Nombre')}" />
            <g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />
            <g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />
            <g:sortableColumn property="dni" title="${message(code: 'usuario.dni.label', default: 'Dni')}" />
            <g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
          </tr>
        </thead>
        <tbody>
          <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">					
              <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nombre")}</g:link></td>	
              <td>${fieldValue(bean: usuarioInstance, field: "apellido")}</td>					
              <td>${fieldValue(bean: usuarioInstance, field: "password")}</td>					
              <td>${fieldValue(bean: usuarioInstance, field: "dni")}</td>					
              <td>${fieldValue(bean: usuarioInstance, field: "email")}</td>
              <td><g:link action="edit" id="${usuarioInstance.id}">Modificar</g:link></td>
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${usuarioInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>
