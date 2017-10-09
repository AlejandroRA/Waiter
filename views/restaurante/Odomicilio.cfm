<script src="/includes/js/jquery-3.1.1.min.js"></script>
<script src="/includes/js/plugins/touchspin/jquery.bootstrap-touchspin.min.js"></script>
<link href="/includes/css/plugins/touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet"> 
<link href="/includes/css/plugins/toastr/toastr.min.css" rel="stylesheet"> 
<style type="text/css">
   .scroll {
    height: 650px;
    overflow: scroll;
}
</style>
<cfprocessingdirective pageEncoding="utf-8">
<!--- <cfdump var="#session#">  
 ---><div class="row">
   <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-10">
                        <h3> <i class="fa fa-info-circle"></i> Seleccione los platillos que desee agregar a su pedido</h3>
                    </div>
                    <div class="col-xs-2 carrito_compras">
                        <h3><i class="fa fa-shopping-cart "></i><span class="label label-warning cantArt">0</span></h3>
                    </div>
                </div>
            </div>                       
        </div>
    </div>
</div>
<br>
<div class="row">
	<div class="col-lg-12">
                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <cfoutput>
                            <cfloop query="#prc.categorias#">
                                <cfif currentRow GT 1>
                                     <li class=""><a data-toggle="tab" href="##tab-#ID#" ><h4><i class="fa fa-tags" aria-hidden="true"></i> #NOMBRE#</h4></center></a></li>
                                <cfelse>
                                     <li class="active"><a data-toggle="tab" href="##tab-#ID#"><h4><i class="fa fa-tags" aria-hidden="true"></i> #NOMBRE#</h4></a></li>
                                </cfif>
                            </cfloop>
                            </cfoutput>
                        </ul>
                        <div class="tab-content">
                            <cfoutput>
                                <cfloop query="#prc.categorias#">
                                    <cfset name_category=NOMBRE>
                                    <cfif currentRow GT 1>
                                        <div id="tab-#ID#" class="tab-pane ">
                                    <cfelse>
                                        <div id="tab-#ID#" class="tab-pane active">
                                    </cfif>
                                            <div class="panel-body scroll">
                                                <div class="row">
                                                <cfloop query="#prc.platillos[ID]#">
                                                    <div class="col-md-4">
                                                        <div class="ibox">
                                                            <div class="ibox-content product-box">
                                                                <div class="product-imitation">
                                                                    <img alt="image" class="img-rounded" width="260" height="260" src="/includes/img/platillos/#prc.rfc#/#name_category#/#replace(NOMBRE_P,' ','_','ALL')#.jpg">
                                                                </div>
                                                                <div class="product-desc">
                                                                    <span class="product-price">
                                                                    $ #PRECIO#
                                                                    </span>
                                                                    <small class="text-muted">#name_category#</small>
                                                                    <a href="" class="product-name"> #NOMBRE_P#</a>
                                                                    <div class="small m-t-xs">
                                                                        #DESCRIPCION#
                                                                    </div>
                                                                    <div class="m-t text-right">
                                                                        <button class="btn btn-xs btn-outline btn-primary"  onClick="showModalCantidad('#NOMBRE_P#',#ID_P#,#PRECIO#);">Agregar <i class="fa fa-cart-plus"></i> </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </cfloop>
                                                </div>
                                            </div> 
                                        </div>
                                </cfloop>
                            </cfoutput>          
                    	</div>
        			</div>
    </div>
</div>

<!---- Modal ---->
<div class="modal inmodal fade in" id="inModalCant" tabindex="-1" role="dialog" aria-hidden="true" >
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h1 class="font-bold nombre_Elemento">
                                                    </h1>
                                                    <h4 class="font-bold">
                                                        Elija la cantidad de elementos que agregara al pedido
                                                    </h4>
                                                    <input id="cantidad" value="1" type="number" value="" name="cantidad">
                                                    <input id="idElemento" type="hidden" value="">
                                                    <input id="precio" type="hidden" value="">
                                                    <br>
                                                    <h3 class="text-center totalModal">
                                                    <h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">Cancelar</button>
                                            <button type="button" id="agregarElemento" class="btn btn-primary"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
<!--- Fin del modal ----->
<!--- Modal especificaciones ---->
<div class="modal inmodal fade" id="ModalEspecificaciones" valor = "" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Especificaciones</h4>
                 <small class="font-bold">Escriba las especifiaciones que requiera</small> 
            </div>
            <div class="modal-body">
                <form>
                  <textarea name="espeficacionArticulo" class="form-control espeficacionArticulo" maxlength="200" placeholder="Especificaciones" required=""></textarea>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">Cancelar</button>
                <button type="button" id="especificacionesValor" class="btn btn-primary">Aceptar</button>
            </div>
        </div>
    </div>
</div>
<!--- Fin Modal especificaciones ---->

<!--- Modal articulos ----->

<!--- Fin de modal de articulos --->
<div class="modal inmodal fade" id="ModalPedido" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Lista de artículos</h4>
                <!--- <small class="font-bold">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</small> --->
            </div>
            <div class="modal-body"  >
                <div class="contenidoModal">
                <!--- Valores de datos de localizacion --->
                <div class="datosLocalizacion">
                    <div class="well">
                      <h3>Su pedido sera enviado a la siguiente dirección:</h3>
                      <br>
                      <ul>
                        <li type="circle">
                            <cfoutput><div <!--- class="font-bold text-center" --->><h4 class="dirUser">#session.cbstorage.usuario.address#</h4></div></cfoutput>
                        </li>
                      </ul>
                      <div class="text-center formularioDireccion">
                         <textarea name="direcciontxt" class="form-control direcciontxt" maxlength="200" placeholder="Dirección" required=""></textarea>
                        </div>
                        <br>
                      <div class="text-right verDireccion">
                        <button class="btn btn-default cambiarDireccion">Cambiar dirección</button>
                      </div>
                      <div class="text-right formularioDireccion">
                        <button class="btn btn-default cancelarDireccion">Cancelar</button>
                        <button class="btn btn-primary aceptarDireccion">Cambiar</button>
                      </div>
                      
                    </div>
                </div>
                <div style="overflow-x:auto;">
                <table class="table table-hover margin bottom" >
                    <thead>
                        <tr>
                            <th class="text-center eliminacionElemento"></th>
                            <th class="text-center eliminacionElemento">Especificaciones</th>
                            
                            <th <!--- style="width: 1%" ---> class="text-center">Nombre</th>
                            <th class="text-center">Cantidad</th>
                            <th class="text-center">Precio</th>
                            <th class="text-center">Total</th>
                        </tr>
                    </thead>
                    <tbody class="listaPedido">
                    </tbody>
                </table>
                </div>
                <div class="datosLocalizacion">
                    <h3>
                    <div class="external-event navy-bg ui-draggable ui-draggable-handle totalConfirmacion" style="position: relative;">Total: $</div>
                    </h3>
                </div>
                <div class="text-right">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary pedido">Siguiente</button>
                    <button type="button" class="btn btn-warning volver">Volver</button>
                    <button type="button" class="btn btn-primary confirmacion">Confirmar pedido</button>
                </div>
                </div>
            </div>

            <div class="modal-footer">
                <!--- <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary pedido">Realizar pedido</button> --->
            </div>
        </div>
    </div>
</div>
<!--- <cfinclude template="Odomicilio_js.cfm">
 --->

 <script src="/includes/js/plugins/toastr/toastr.min.js"></script>
<script>
    var contArticulos = 0;
    var articulos =[];
    $(document).ready(
    function (){
        $(".confirmacion").hide();
        $(".pedido").hide();
        $(".volver").hide();
        $(".datosLocalizacion").hide();
        $(".formularioDireccion").hide();
        /*Prueba de toast*/
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "preventDuplicates": false,
            "positionClass": "toast-top-right",
            "onclick": null,
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "7000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        /*Fin de prueba de toast*/
        /*Evento que se ejecuta al terminar de editar*/
        $('#ModalEspecificaciones').on('hidden.bs.modal', function () {
            mostrarArticulos();
       //     console.log("Mostrado");
        });
        /*Evento que se ejectua al terminar la modal*/
        $('#ModalPedido').on('hidden.bs.modal', function () {
            //console.log("Fin de termino de la modal");
            $("#cantidad").val("1");
            /*Metodo de datos*/
            $('.eliminacionElemento').show();
            $('.totales').show();
            $('.pedido').show();
            $(this).hide();
            $('.datosLocalizacion').hide();
            $('.confirmacion').hide();
        });
        $('#inModalCant').on('hidden.bs.modal', function () {
            $("#cantidad").val("1");
            
        });
        $("#especificacionesValor").on('click', function (){
            //console.log("Valor");
            var id = $("#ModalEspecificaciones").attr("valor");
        //    console.log(id);
            articulos[id].especificaciones =  $(".espeficacionArticulo").val();
         //  $(".espeficacionArticulo")
          // console.log( $(".espeficacionArticulo"));
           // mostrarArticulos();
             $("#ModalEspecificaciones").modal('toggle');
           
        });
        $('.confirmacion').on('click',function (){
             $.post('/index.cfm/ordenes/domicilio/realizarPedido',
                {
                    articulos:JSON.stringify(articulos),
                    idRestaurante: <cfoutput>#prc.id#</cfoutput>,
                    direccion:$('.dirUser').text()
                },
            function (data){
                //$('.contenidoModal').html(data);
                location.href='/index.cfm/consultas/consultas/domicilio?orden='+data;
            });
            /*JSON.stringify(*/
        //    console.log( $('.dirUser').text());
        });
        /*inModalCant*/
       /* */
        $('.pedido').on('click',function (){

            //console.log("Datos");
          /*  $.post('/index.cfm/restaurante/restaurante/localizacion',
            function (data){
                $('.contenidoModal').html(data);
            });*/
            /*Eliminacion del boton para eliminar un elemento de la lista*/
            $('.eliminacionElemento').hide();
            $('.totales').hide();
            $('.pedido').hide();
            $('.volver').show();
            $('.datosLocalizacion').show();
            $(".verDireccion").show();   
            $('.confirmacion').show();
            $(".formularioDireccion").hide();
        
        });
        /*Evento que se ejecutara al momento de cerrar la modal*/
         /*$('#inModalAddress').on('hidden.bs.modal', function () {
           // $(this).find('input').val('');
           console.log("Mensaje de termino de la modal");
        });*/
        $('.volver').on('click',function (){
           // console.log("Valores");
           /* $('.eliminacionElemento').show();
            $('.totales').show();*/
            $('.eliminacionElemento').show();
            $('.totales').show();
            $('.pedido').show();
            $(this).hide();
            $('.datosLocalizacion').hide();
            $('.confirmacion').hide();
            $(".formularioDireccion").hide();
            $(".verDireccion").show();        
        });

        $(".cambiarDireccion").on('click',function (){
            $(".formularioDireccion").show();
            $(".verDireccion").hide();
            $(".confirmacion").hide();
        });
        $(".cancelarDireccion").on('click',function (){
            $(".formularioDireccion").hide();
            $(".confirmacion").show();
            $(".verDireccion").show();
            
        });
        $(".aceptarDireccion").on('click',function (){
            var dir = $('.direcciontxt').val();
            $('.dirUser').html(dir);
             $(".formularioDireccion").hide();
              $(".confirmacion").show();
            $(".verDireccion").show();
            //console.log(dir);
        });



        $('#agregarElemento').on('click', function () {
            console.log(articulos);
            var band = false;
            for (var i = articulos.length - 1; i >= 0; i--) {
                if(articulos[i].id == $("#idElemento").val()){
                    articulos[i].cantidad += Number($("input[name='cantidad']").val());
                    band = true;
                    break;
                }
            }
            /*Articulo nuevo*/
            if(!band){
                var articulo = {
                    id:$("#idElemento").val(),
                    nombre: $(".nombre_Elemento").text(),
                    cantidad : Number($("input[name='cantidad']").val()),
                    precio : Number($("#precio").val()),
                    especificaciones : ''
                }
                articulos.push(articulo);
            }
            contArticulos += Number($("input[name='cantidad']").val());
            //$(".cantArt").html(contArticulos);
            changeCantChart(contArticulos);
            toastr.success('Articulo agregado exitosamente');
            $("#cantidad").val("1");
           
            //toastr[info]("Hi, welcome to Inspinia. This is example of Toastr notification box.")
            $("#inModalCant").modal('toggle');
        });

        $(".carrito_compras").on("click",function (){
          //  $(".pedido").hide();
            loadDataElements();
            $("#ModalPedido").modal('toggle');
        });


       
    });
    
    function mostrarArticulos(){
     //   $(".pedido").hide();
        loadDataElements();
        $("#ModalPedido").modal('toggle');
        console.log("Ya esta mostrado la modal");
    }

    
    function changeCantChart(val){
        if(val != 0){
            $(".pedido").show();
        }
        else{
             $(".pedido").hide();
        }
        $(".cantArt").html(val);
    }
    function loadDataElements(){
        var data = '';
        if(articulos.length == 0){
            $(".pedido").hide();
            data = '<tr ><td class="text-center" colspan="5">No se han agregado elementos al pedido</tr>';
        }else{
            var total = 0;
            for (var i = articulos.length - 1; i >= 0; i--) {
                totalM = articulos[i].cantidad * articulos[i].precio;
                data += '<tr><td class="text-center small eliminacionElemento"><span onClick="eraseElement('+articulos[i].id+');" class="label label-danger"><i class="fa fa-window-close" aria-hidden="true"></i></span></td><td class="text-center small eliminacionElemento"><span onClick="addEspecificaciones('+articulos[i].id+');" class="label label-warning"><i class="fa fa-edit" aria-hidden="true"></i></span></td><td class="text-center">'+articulos[i].nombre+'</td><td class="text-center">'+articulos[i].cantidad+'</td><td class="text-center">$ '+articulos[i].precio+'</td><td class="text-center">$ '+totalM +'</td></tr>';
                total += totalM;
            }
            data += '<tr class="totales"><td colspan="5" class="font-bold">Total</td><td class="text-center">$ '+total+'</td></tr>';
            $('.totalConfirmacion').html('Total: $'+total);
        }
        $(".listaPedido").html(data);
    }
   
    function addEspecificaciones(valor){
      //  console.log("Agregar datos de especificaciones");
        $("#ModalPedido").modal('toggle');
       
        for (var i = articulos.length - 1; i >= 0; i--) {
            if(articulos[i].id == valor){
                $(".espeficacionArticulo").text(articulos[i].especificaciones);
                $("#ModalEspecificaciones").attr("valor",i);
                break;
            }
        }
        $("#ModalEspecificaciones").modal('toggle');

    }
    function eraseElement(valor){
        for (var i = articulos.length - 1; i >= 0; i--) {
            if(articulos[i].id == valor){
                contArticulos -= articulos[i].cantidad;
                changeCantChart(contArticulos);
                articulos.splice(i, 1);
                loadDataElements();
            }
        }
    }
    function showModalCantidad(nombre, id, precio){
        prize = precio;
        $(".nombre_Elemento").html(nombre);
        $("#idElemento").attr('value',id);
        $("#precio").attr('value',precio);
        changeTextB();
        $("#inModalCant").modal('toggle');
    }
    function changeTextB(){
        var cant = $("input[name='cantidad']").val();
        var prize = $("#precio").val();
        var cantPrecio = prize*cant;
        $("#agregarElemento").html('Agregar ' +cant+' al pedido <i class="fa fa-cart-plus"></i>'); 
        $(".totalModal").html("Total: $"+cantPrecio);
    }
    $("input[name='cantidad']").TouchSpin({min:1});
    $("input[name='cantidad']").on("touchspin.on.startupspin", function() {
        changeTextB();
    });
    $("input[name='cantidad']").on("touchspin.on.startdownspin", function() {
         changeTextB();
    });
</script>
