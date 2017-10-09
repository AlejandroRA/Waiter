<!---
* =========================================================================
* IPN - ESCOM
* Sistema: Waitress / Waiter
* Modulo: Principal
* Sub modulo: Login
* Fecha: Agosto 10, 2017
* Descripcion: Vista Login 
* =========================================================================
--->
<!DOCTYPE html>
<cfprocessingdirective pageEncoding="utf-8">    
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Waitress | Waiter</title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/includes/css/animate.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <!----<h1 class="logo-name">T T</h1>---->
                <div align="center">
                    <img src="/includes/img/logos/logo.png" style="width:300px">
                </div>

            </div>
            <h3>Bienvenido</h3>
            <!---<p>Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views.
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>--->
            <!---<p>Login in. To see it in action.</p>--->
            <cfoutput>
            <!---"#event.buildLink('login.autenticacion')#"    ---->
             <cfdump var="#event.buildLink('login.autentificacion')#">
           
          <form class="m-t" role="form"  action="/index.cfm/login/autentificacion" method="post">
            <!----
            <form class="m-t" role="form"  action="#event.buildLink('login.autentificacion')#" method="post">---->

                #getInstance( "MessageBox@cbmessagebox" ).renderIt()#

                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Nombre de usuario" required="">
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Contraseña" required="">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Iniciar sesión</button>
            </form>
                <!---<a href="##"><small>Forgot password?</small></a> --->
                <p class="text-muted text-center"><small>¿No tiene una cuenta?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="/index.cfm/login/registroUsuario">Crear una cuenta</a>
            
            </cfoutput>
            <p class="m-t"> <small>Trabajo Terminal 2016-B020 </small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-3.1.1.min.js"></script>
    <script src="/includes/js/bootstrap.min.js"></script>

</body>

</html>
