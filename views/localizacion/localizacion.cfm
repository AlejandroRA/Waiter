<cfprocessingdirective pageEncoding="utf-8">    
<cfinclude template="localizacion_js.cfm">
<div class="row">
	<div class="col-md-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
                <span class="label label-primary"><i class="fa fa-map-marker fa-6" aria-hidden="true"></i>  </span>    <h5> Localización</h5> 
                <div class="ibox-tools">              
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                        	<a onclick="currentLocation();return false;" href="">Localización actual</a>
                        </li>
                        <li>
                        	<a onclick="userAddress();return false;" href="" >Direccion de usuario</a>
                        </li>
                        <li>
                            <a onclick="showModalAddress();return false;" href="">Ingresar dirección</a>
                        </li>
                    </ul>                              
                </div>
            </div>
			<div class="ibox-content">
				<div class="google-map" id="googleMap" style="width:100%;height:600px;">
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPR0k9hqIvfZjuSjClaM7TR1cW7CeVDbE&callback=myMap"></script>



<!---- Modal para ingresar direccion de usuario ---->
<div class="modal inmodal" id="inModalAddress" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated flipInY">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Dirección</h4>
                <small class="font-bold">Ingrese una la dirección para localización
            </div>
            <div class="modal-body">
                <div class="text-left">
                    
                    <!---<form method="post" class="m-t" action="/index.cfm/perfilUsuario/perfilUsuario/editarPerfil">---->
                        <div class="form-group">
                            <form id="formAddress">
                                <label>Dirección</label> 
                                <input id="address" type="text" placeholder="Delegación/Municipio Colonia Calle Número" class="form-control">
                            </form>
                        </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">Cancelar</button>
                <button type="button" onClick="localizarAdd();"class="btn btn-primary">Aceptar</button>
            </div>
            <!---</form>---->
        </div>
    </div>
</div>

