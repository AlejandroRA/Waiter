component extends="coldbox.system.EventHandler"{

	function domicilio(event,rc,prc){
		event.setView("/consultas/confirmacionDomicilio");
	}
	function reservacion(event,rc,prc){
		event.setView("/consultas/confirmacionReservacion");
	}	


}