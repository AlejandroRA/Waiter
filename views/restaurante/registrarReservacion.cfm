<cfprocessingdirective pageEncoding="utf-8">
<script src="/includes/js/jquery-3.1.1.min.js"></script>
<script src="/includes/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="/includes/js/plugins/clockpicker/clockpicker.js"></script>
<link href="/includes/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="/includes/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-primary">
            <div class="panel-heading">
                <div class="font-bold"><i class="fa fa-sticky-note-o" aria-hidden="true"></i>  Registrar reservación</div>
            </div>
            <div class="panel-body">
                <p>Complete el siguiente formulario para registrar una reservación.</p>
                <form action="/index.cfm/ordenes/reservacion/registrarReservacion" method="post">
                <div class="row">    
                    <div class="col-md-12">
                        <label class="font-bold">Número de personas</label>
                        <input type="number" name="cantidad" required="" class="form-control" value="1">
                    </div>
                </div>
                <br>
                <div class="row">
                	<div class="col-md-6">
                		<div class="form-group" id="data_1">
                            <label class="font-bold">Fecha</label>
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" name="fecha" required="" class="form-control fecha" <!--- value="03/04/2014" --->>
                            </div>
                        </div>
                	</div>
                	<div class="col-md-6">
                        <label class="font-bold">Hora</label>
                            
                        <div class="input-group clockpicker" data-autoclose="true">
                            <input type="text" name="hora" required="" class="form-control" <!--- value="09:30" ---> >
                            <span class="input-group-addon">
                                <span class="fa fa-clock-o"></span>
                            </span>
                        </div>
                	</div>
                </div>
                <br>
                <div class="row">   
                    <div class="col-md-12">
                        <cfoutput>
                            <input type="hidden" value="#prc.idrestaurante#" name="id"> 
                        </cfoutput>
                        <div class="text-right">
                            <input type="submit" class="btn btn-primary " value="Reservar">
                        </div>
                        
                    </div>
                </div>
                <br>
                </form>
            </div>
        </div>
	</div>
</div>
<cfdump var="#DateFormat(Now())#">
<script type="text/javascript">
	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$('#data_1 .input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });
    $('.clockpicker').clockpicker();
    $(document).ready(function(){
        $( "#data_1" ).change(function() {
             alert( "Handler for .change() called." );
        });
        $(".fecha").on("change",function (){
            console.log("Datos");
        });
        console.log("Datos terminados");
    });
    $('#data_1 .input-group.date').datepicker()
    .on("changeDate", function(e) {
        var fecha_usuario = new Date($('.fecha').val());// Valor del tiempo usuario;
        var aux = new Date();
        var fecha = aux.getDate()+"/"+Number(aux.getMonth()+1)+"/"+aux.getFullYear();
        console.log(fecha);
        var fecha_actual = new Date(fecha);
        console.log(fecha_usuario);
        if(fecha_usuario > fecha_actual)
            console.log("Menor")
    });
</script>