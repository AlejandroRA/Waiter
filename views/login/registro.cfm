<!----
* =========================================================================
* IPN - ESCOM
* Sistema: Waitress / Waiter
* Modulo: Principal
* Sub modulo: Login
* Fecha: Agosto 11, 2017
* Descripcion: Vista Registro 
* =========================================================================
---->
<!DOCTYPE html>
<cfprocessingdirective pageEncoding="utf-8">    

<html>
<head>
    <!----<cfdump var="#prc#" abort="true">----> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Waitress | Waiter</title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/includes/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="/includes/css/animate.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">
    <cfinclude template="registro_js.cfm">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">         
                    <img src="/includes/img/logos/logo.png" style="width:300px">
                </h1>

            </div>
            <h3>Registro</h3>
            <!---<p>Create account to see it in action.</p>--->
            <cfoutput>
                 #getInstance( "MessageBox@cbmessagebox" ).renderIt()#
            </cfoutput>
            <form class="m-t" role="form" action="/index.cfm/login/registrarUsuario" method="post">
                <div class="form-group">
                    <input type="text" name="nombre" class="form-control" placeholder="Nombre" required="">
                </div>
                <div class="form-group">
                    <input type="text" name="apaterno" class="form-control" placeholder="Apellido Paterno" required="">
                </div>
                <div class="form-group">
                    <input type="text" name="amaterno" class="form-control" placeholder="Apellido Materno" required="">
                </div>
                <div class="form-group">
                    <input type="tel" name="telefono" class="form-control" placeholder="Numero de celular" required="">
                </div>
                <div class="form-group">
                    <cfoutput>
                        <select name="municipio" class="form-control m-b" name="account">
                            <cfloop query="#prc.municipios#" >
                                <option value="#ID#">#NOMBRE#</option>        
                            </cfloop>
                        </select>
                    </cfoutput>
                </div>
                
                <div class="form-group">
                    <input type="text" name="colonia" class="form-control" placeholder="Colonia" required="">
                </div>
                <div class="form-group">
                    <input type="text" name="calle" class="form-control" placeholder="Calle" required="">
                </div>
                <div class="form-group">
                    <input type="text" name="numext"  pattern="[0-9]" class="form-control" placeholder="Numero Ext" required="">
                </div>
                
                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="Email" required="">
                </div>
                
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Nombre de usuario" required="">
                </div>
                
                <div class="form-group">
                    <input type="password" name="pass" class="form-control" placeholder="Password" required="">
                </div>
                <div class="form-group">
                    <input disabled name="numTC" type="number" class="form-control tc" placeholder="Numero tarjeta" required="">
                </div>

                <div class="form-group">
                    <input disabled name="segTC" type="text"  class="form-control tc" placeholder="Num. Seg." required="">
                </div>
        
                <div class="checkbox i-checks" ><label> <input  id ="evlTC" type="checkbox"><i></i> Agregar informacion bancaria </label>
                <input id ="estado" type="hidden" name="estado" value="0">
               <!------ <div class="form-group">
                        <div class="checkbox i-checks"><label> <input type="checkbox"><i></i> Acepto los terminos y condiciones </label></div>---->
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">Registrar</button>

                <p class="text-muted text-center"><small>¿Ya tienes una cuenta?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="/index.cfm/Main">Iniciar sesión</a>
            </form>
            <p class="m-t"> <small>Trabajo Terminal 2016-B020</small> </p>
        </div>
    </div>

    
</body>

</html>
