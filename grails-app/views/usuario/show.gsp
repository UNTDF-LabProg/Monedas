<%@ page import="app.Usuario" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="${session.admin?'administrador':'usuario'}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />	        
</head>
<body>        
  <div style="color: #999999" class="row">
    <div class="col-md-12">
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
    </div>            
  </div>  
  <div style="color: #999999" class="row">
    <div class="col-md-6" style="color: #999999">                    
      <table style="color: #999999">
        <tr>
        <g:form controller="Moneda" action="agregar">
          <td><g:select  optionKey="key" optionValue="key" name="moneda" from="${monedas}"/></td>
          <td></td>
          <td>
              <!-- <g:link controller="Moneda" action="agregarMonedas"> 
<g:img dir="images" file="add.png"/>
</g:link> -->
            <input type="submit" value="Agregar Moneda">
          </td>   
        </g:form>
        </tr>
      </table>
      <g:if test="${user?.monedas}">
        <table class="table table-hover" style="color: #999999">
          <tr>
            <th>Siglas</th>
            <th>Cambio</th>
            <th>Acciones</th>            
          </tr>
          <g:each in="${user.monedas}" var="m">
            <tr>
              <td>${m.siglas}</td>
              <td>${m.valorActual}</td>
              <td>
                <!-- <g:link controller="Moneda" action="edit"> 
<g:img dir="images" file="Modify.png"/>
</g:link> -->                
            <g:link controller="Moneda" action="delete" id="${m}"> 
              <g:img dir="images" file="delete.png"/>
            </g:link>                
            </td>
            </tr>
          </g:each>
        </table>
      </g:if>  
      <g:else>
        <p>No hay monedas!</p>                    
      </g:else>     
    </div>
    <div style="color: #999999" class="col-md-6">
      <g:if test="${user?.registros}">
        <table class="table table-hover" style="color: #999999">
          <tr>
            <th>Siglas</th>
            <th>Cambio</th>
            <th>Fecha</th>
            <th>Acciones</th>            
          </tr>
          <g:each in="${user.registros}" var="r">
            <tr>
              <td>${r.siglas}</td>
              <td>${r.cambio}</td>
              <td>${r.fechaActualizacion}</td>
              <td>           
            <g:link controller="Registro" action="delete" id="${r}"> 
              <g:img dir="images" file="delete.png"/>
            </g:link>                
            </td>
            </tr>
          </g:each>
        </table>
      </g:if>  
      <g:else>
        <p>No hay registros!</p>                    
      </g:else>
    </div>
  </div>  
  <!--
<g:link class="edit" action="edit" resource="${user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
<g:link class="delete" action="delete" resource="${user}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><g:message code="default.button.delete.label" default="Delete" /></g:link>-->
</body>
</html>
