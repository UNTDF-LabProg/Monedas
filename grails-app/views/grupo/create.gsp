<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="administrador">
    <g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
  <div id="create-grupo" class="content scaffold-create" role="administrador">
    <h1 style="color: #999999"><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${grupoInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${grupoInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form url="[resource:grupoInstance, action:'save']" >
      <fieldset class="form" style="color: #999999">
        <g:render template="form"/>
      </fieldset>
      <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
