component extends="coldbox.system.EventHandler"{
	property name="cnReservacion" inject="/ordenes/CN_ordenes";
	
	
	function registrarReservacion(event, rc, prc){
		var data = cnReservacion.registrarReservacion(session.cbstorage.usuario.id,rc.id,rc.fecha,rc.hora,rc.cantidad,1);
		event.setView("/consultas/confirmacionReservacion");
		setNextEvent("/consultas/consultas/reservacion");
	}
}