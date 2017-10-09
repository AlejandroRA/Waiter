component extends="coldbox.system.EventHandler"{

	property name="cnDomicilio" inject="/ordenes/CN_ordenes";
	
	function realizarPedido(rc,prc,event){

		
		
		var idOrden = cnDomicilio.generarOrden(rc.idRestaurante,session.cbstorage.usuario.id,deserializeJSON(rc.articulos),rc.direccion);
		return idOrden;
	}
	
}