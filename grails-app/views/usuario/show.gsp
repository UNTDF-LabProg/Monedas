<%@ page import="app.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
	<title> Perfil de Usuario</title>
    </head>
    <body>
        <div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
        </div> 
        <div class="row">
            <div class="col-md-12">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
	        </g:if>
            </div>            
        </div>  
        <div class="row">
            <div class="col-md-6">Monedas</div>
            <div class="col-md-6">Historico</div>
        </div>  
        <!-- <ol class="property-list usuario">
            <g:if test="${usuarioInstance?.nombre}">
                <li class="fieldcontain">
                    <span id="nombre-label" class="property-label">
                        <g:message code="usuario.nombre.label" default="Nombre" />
                    </span>
                    <span class="property-value" aria-labelledby="nombre-label">
                        <g:fieldValue bean="${usuarioInstance}" field="nombre"/>
                    </span>
                </li>
            </g:if>
            <g:if test="${usuarioInstance?.apellido}">
                <li class="fieldcontain">
                    <span id="apellido-label" class="property-label">
                        <g:message code="usuario.apellido.label" default="Apellido" />
                    </span>
                    <span class="property-value" aria-labelledby="apellido-label">
                        <g:fieldValue bean="${usuarioInstance}" field="apellido"/>
                    </span>
		</li>
            </g:if>
            <g:if test="${usuarioInstance?.password}">
                <li class="fieldcontain">
                    <span id="password-label" class="property-label">
                        <g:message code="usuario.password.label" default="Password" />
                    </span>
                    <span class="property-value" aria-labelledby="password-label">
                        <g:fieldValue bean="${usuarioInstance}" field="password"/>
                    </span>
                </li>
            </g:if>
			
				<g:if test="${usuarioInstance?.dni}">
				<li class="fieldcontain">
					<span id="dni-label" class="property-label"><g:message code="usuario.dni.label" default="Dni" /></span>
					
						<span class="property-value" aria-labelledby="dni-label"><g:fieldValue bean="${usuarioInstance}" field="dni"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="usuario.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuarioInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.grupos}">
				<li class="fieldcontain">
					<span id="grupos-label" class="property-label"><g:message code="usuario.grupos.label" default="Grupos" /></span>
					
						<g:each in="${usuarioInstance.grupos}" var="g">
						<span class="property-value" aria-labelledby="grupos-label"><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.monedas}">
				<li class="fieldcontain">
					<span id="monedas-label" class="property-label"><g:message code="usuario.monedas.label" default="Monedas" /></span>
					
						<g:each in="${usuarioInstance.monedas}" var="m">
						<span class="property-value" aria-labelledby="monedas-label"><g:link controller="moneda" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.registros}">
				<li class="fieldcontain">
					<span id="registros-label" class="property-label"><g:message code="usuario.registros.label" default="Registros" /></span>
					
						<g:each in="${usuarioInstance.registros}" var="r">
						<span class="property-value" aria-labelledby="registros-label"><g:link controller="registro" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol> -->
			<g:form url="[resource:usuarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${usuarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
    </body>
</html>