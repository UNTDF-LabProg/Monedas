<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<!--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">-->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<g:javascript library="application"/>	
                <r:require modules="bootstrap"/>
		<r:layoutResources /> 
                <!-- Bootstrap core CSS -->
                <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Custom styles for this template -->
                <link rel="stylesheet" href="${resource(dir: 'css', file: 'signin.css')}">
	</head>
	<body>
            <!--<div class="row">
                <div class="col-md-12">Header</div>
            </div>
            <div class="row">
                <div class="col-md-3">Menu</div>
                <div class="col-md-9"><g:layoutBody/></div>
            </div>
            <div class="row">
                <div class="col-md-12">Footer</div>                    
            </div>
            <r:layoutResources />-->
            <div class="container">
              <form class="form-signin" role="form" action ="usuario/index">
                <h4 class="form-signin-heading">Inicia sesión para acceder a Monedas</h4>
                <input name="email" type="email" class="form-control" placeholder="Correo Electronico" required autofocus>
                <input name="password" type="password" class="form-control" placeholder="Contraseña" required>
                <label class="checkbox">
                  <input type="checkbox" value="remember-me"> No cerrar sesión
                </label>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar sesión</button>
              <form>
            </div>
	</body>
</html>