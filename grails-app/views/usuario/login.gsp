<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <!-- Bootstrap core CSS -->
    <!--<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">-->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'signin.css')}">
    <title>Bienvenido a Monedas</title>	
  </head>
  <body>		
    <div id="page-body" role="main" class="container" >     
        <g:form class="form-signin" role="form" controller="usuario" action ="login">
          <h4 class="form-signin-heading" style="color: #FFFFFF">Inicia sesión para acceder a Monedas</h4> <h6>${flash.message}</h6>
        <input name="email" type="email" class="form-control" placeholder="Correo Electronico" required autofocus>
        <input name="password" type="password" class="form-control" placeholder="Contraseña" required>
        <label class="checkbox" style="color: #FFFFFF">
          <input type="checkbox" value="remember-me" > No cerrar sesión
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit" style="color:#fff;background-color:#3E3E3E;border-color:#fff">Iniciar sesión</button>
      </g:form>      
    </div>
  </body>
</html>
