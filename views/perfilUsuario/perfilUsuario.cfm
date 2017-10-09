<cfprocessingdirective pageEncoding="utf-8">    
<cfinclude template="perfilUsuario_js.cfm">
<div class="row">
<div class="col-lg-12">
    <div class="widget-head-color-box navy-bg p-lg text-center">
        <div class="m-b-md">
            <h2 class="font-bold no-margins">
                Perfil de usuario
            </h2>
            <small></small>
        </div>
        <img src="/includes/img/perfil/un.JPG" style="width:100px" class="img-circle circle-border m-b-md" alt="profile">    
    </div>
    <div class="widget-text-box">
        <p>Los datos de su perfil se muestran a continuación</p>
         <cfoutput>#getInstance( "MessageBox@cbmessagebox" ).renderIt()#</cfoutput>
        <div class="panel-body">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#datosGenerales">Datos generales</a>
                        </h5>
                    </div>

                    <div id="datosGenerales" class="panel-collapse collapse ">
                        <div class="panel-body">
                            <cfoutput>
                                <div  style="overflow-x:auto;">
                              <!--- <div>
                               --->  <table class="table table-stripped  m-t-md">
                                    <tbody>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Nombre de usuario
                                            </td>
                                            <td class="no-borders">
                                                #prc.username#
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Nombre 
                                            </td>
                                            <td class="no-borders">
                                                #prc.nombre#
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Apellido paterno
                                            </td>
                                            <td class="no-borders">
                                                #prc.apaterno#
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Apellido materno
                                            </td>
                                            <td class="no-borders">
                                                #prc.amaterno#
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Teléfono
                                            </td>
                                            <td class="no-borders">
                                                #prc.cel#
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Email
                                            </td>
                                            <td class="no-borders">
                                                #prc.email#
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                            </cfoutput>
                            <br>
                            <div class="text-right">
                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#contrasena">
                                    <i class="fa fa-ellipsis-h" aria-hidden="true"></i> Cambiar contraseña
                                </button>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editarGeneral">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar datos
                                </button>
                                <div class="modal inmodal" id="contrasena" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content animated flipInY">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                <h4 class="modal-title">Cambiar contraseña</h4>  
                                            </div>
                                            <div class="modal-body">
                                                <form method="post" action="/index.cfm/perfilUsuario/perfilUsuario/editarPerfil">
                                                    <div class="form-group" >
                                                        <div class="text-left">
                                                            <label>Ingrese su actual contraseña</label> 
                                                        </div>
                                                        <input type="password" name="conc"  placeholder="Contraseña actual" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group" >
                                                        <div class="text-left">
                                                            <label>Ingrese su nueva contraseña</label> 
                                                        </div>
                                                        <input type="password" name="conn" placeholder="Contraseña nueva" class="form-control" required="">
                                                    </div>
                                                     <div class="form-group">
                                                        <input type="hidden" name="type" value="6">
                                                    </div>              
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-white" data-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-primary">Cambiar contraseña</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="modal inmodal" id="editarGeneral" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content animated flipInY">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                <h4 class="modal-title">Editar datos generales</h4>
                                                <small class="font-bold">Modifique los datos que desee editar.</small>
                                            </div>
                                            <div class="modal-body">
                                                <form method="post" action="/index.cfm/perfilUsuario/perfilUsuario/editarPerfil">
                                                    <cfoutput>
                                                        <div class="form-group" >
                                                            <div class="text-left">
                                                                <label>Nombre</label> 
                                                            </div>
                                                            <input type="text" name="nombre" value="#prc.nombre#"  placeholder="Nombre" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Apellido paterno</label> 
                                                            </div>
                                                            <input type="text" name="apaterno" value="#prc.apaterno#"  placeholder="Apellido paterno" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Apellido materno</label>
                                                            </div> 
                                                            <input type="text" name="amaterno" value="#prc.amaterno#"  placeholder="Apellido materno" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Teléfono</label>
                                                            </div> 
                                                            <input type="text" name="telefono" value="#prc.cel#"  placeholder="Teléfono" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Email</label>
                                                            </div> 
                                                            <input type="text" name="email" value="#prc.email#"  placeholder="Email" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="hidden" name="type" value="1">
                                                        </div>
                                                       
                                                    </cfoutput>
                                                <!---</form>--->
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-white" data-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-primary">Actualizar</button>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#localizacion">Datos de localización</a>
                        </h4>
                    </div>
                    <div id="localizacion" class="panel-collapse collapse">
                        <div class="panel-body">
                            <cfoutput>
                                <div  style="overflow-x:auto;">
                               <!--- <div>
                                ---> <table class="table table-stripped  m-t-md">
                                    <tbody>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Delegación
                                            </td>
                                            <td class="no-borders">
                                                #prc.dm#
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Colonia
                                            </td>
                                            <td class="no-borders">
                                                #prc.colonia#
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Calle
                                            </td>
                                            <td class="no-borders">
                                                #prc.calle#
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Número
                                            </td>
                                            <td class="no-borders">
                                                #prc.num#
                                            </td>
                                        </tr>                                       
                                    </tbody>
                                </table>
                                </div>
                            </cfoutput>
                            <br>
                            <div class="text-right">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editarLocalizacion">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar datos
                                </button>
                                <div class="modal inmodal" id="editarLocalizacion" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content animated flipInY">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                <h4 class="modal-title">Editar datos de localización</h4>
                                                <small class="font-bold">Modifique los datos que desee editar.</small>
                                            </div>
                                            <div class="modal-body">
                                                <form method="post" action="/index.cfm/perfilUsuario/perfilUsuario/editarPerfil">
                                                    <cfoutput>
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Delegación</label> 
                                                            </div>
                                                            <select id="dm" name="delegacion" class="form-control m-b" name="account">
                                                                <cfloop query="#prc.municipios#" >
                                                                    <option value="#ID#">#NOMBRE#</option>        
                                                                </cfloop>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Colonia</label> 
                                                            </div>
                                                            <input type="text" name="colonia" value="#prc.colonia#"  placeholder="Colonia" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Calle</label>
                                                            </div> 
                                                            <input type="text" name="calle" value="#prc.calle#"  placeholder="Calle" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Número</label>
                                                            </div> 
                                                            <input type="text" name="numero" value="#prc.num#"  placeholder="Número" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="hidden" name="type" value="2">
                                                        </div>       
                                                    </cfoutput>
                                                <!---</form>--->
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-white" data-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-primary">Actualizar</button>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <cfif prc.ESTADO EQ 2>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#datosFinanzacieros">Datos bancarios</a>
                            </h4>
                        </div>
                        <div id="datosFinanzacieros" class="panel-collapse collapse">
                            <div class="panel-body">
                                <cfoutput>

                                <div  style="overflow-x:auto;">
                                <!--- <div>
                                 ---><table class="table table-stripped  m-t-md">
                                    <tbody>
                                        <tr>
                                            <td class="no-borders">
                                                <i class="fa fa-circle text-navy"></i>
                                            </td>
                                            <td class="no-borders">
                                                Numero de tarjeta
                                            </td>
                                            <td class="no-borders">
                                                **** **** **** #MID(prc.numt,12,4)#
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                                </cfoutput>
                                <br>
                                <div class="text-right">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#agregarBancariaE">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar datos
                                    </button>
                                    <div class="modal inmodal" id="agregarBancariaE" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content animated flipInY">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                    <h4 class="modal-title">Editar datos bancarios</h4>
                                                    <small class="font-bold">Modifique los datos que desee editar.</small>
                                                </div>
                                                <div class="modal-body">
                                                    <cfoutput>
                                                    <form method="post" class="m-t" action="/index.cfm/perfilUsuario/perfilUsuario/editarPerfil">
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Número de tarjeta</label>
                                                            </div> 
                                                        <input type="text" name="numerotarjeta" value="#prc.numt#"  placeholder="Número de tarjeta" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="text-left">
                                                                <label>Número de seguridad</label>
                                                            </div> 
                                                        <input type="text" name="numeroseguridad" value="#prc.nums#" placeholder="Número de seguridad" class="form-control" required="">
                                                        </div>
                                                        <div class="form-group">
                                                        <input type="hidden" name="type" value="3">
                                                        </div>   
                                                        </cfoutput>      
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-white" data-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="btn btn-primary ">Actualizar</button>
                                                </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <br>
                    <div class="text-right">
                         <button type="button" class="btn btn-danger"  data-toggle="modal" data-target="#eliminarBancaria">
                            <i class="fa fa-credit-card" aria-hidden="true"></i>  Eliminar información bancaria
                        </button>
                        <div class="modal inmodal" id="eliminarBancaria" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content animated flipInY">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">Eliminar información bancaria</h4>
                                       <!--- <small class="font-bold">Rellene los campos para agregar información bancaria.</small>--->
                                    </div>
                                    <div class="modal-body">
                                        <div class="text-left">
                                            <center>
                                                <h4>Esta acción removera tambien opciones en su cuenta</h4>
                                                <h4>¿Desea continuar?</h4>
                                            </center>
                                        </div>
                                        <form method="post" class="m-t" action="/index.cfm/perfilUsuario/perfilUsuario/editarPerfil">
                                             <div class="form-group">
                                                <input type="hidden" name="type" value="4">
                                            </div> 
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-white" data-dismiss="modal">Cancerlar</button>
                                        <button type="submit" class="btn btn-primary ">Aceptar</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>        
                    </div>
                <cfelse>
                    <br>
                    <div class="text-right">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#agregarBancaria" >
                            <i class="fa fa-credit-card" aria-hidden="true"></i>  Agregar datos bancarios
                        </button>
                        <div class="modal inmodal" id="agregarBancaria" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content animated flipInY">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">Agregar datos bancarios</h4>
                                        <small class="font-bold">Rellene los campos para agregar información bancaria.</small>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post" class="m-t" action="/index.cfm/perfilUsuario/perfilUsuario/editarPerfil">
                                            <div class="form-group">
                                                <div class="text-left">
                                                    <label>Número de tarjeta</label>
                                                </div> 
                                                <input type="text" name="numerotarjeta"   placeholder="Número de tarjeta" class="form-control" required="">
                                            </div>
                                            <div class="form-group">
                                                <div class="text-left">
                                                    <label>Número de seguridad</label>
                                                </div> 
                                                <input type="text" name="numeroseguridad"  placeholder="Número de seguridad" class="form-control" required="">
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" name="type" value="3">
                                            </div>         
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-white" data-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-primary ">Agregar</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </cfif>
            </div>
        </div>
    </div>
</div>
</div>

