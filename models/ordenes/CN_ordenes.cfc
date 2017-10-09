component extends="coldbox.system.EventHandler"{

	property name="daoOrden" inject="/ordenes/DAO_ordenes";


	function init(){
		return this;
	}
	

	
	function generarOrden(idRestaurante,idUsuario,articulos,direccion){
		daoOrden.crearOrderDomicilio(idRestaurante,idUsuario,direccion);
		var id =  daoOrden.getId(idRestaurante,idUsuario);
		/*Se almacenan los platillos*/
		for(i = 1; i <= ArrayLen(articulos);i++){
			daoOrden.agregarPlatilloOrden(id, articulos[i].id, articulos[i].especificaciones,articulos[i].cantidad  );
		}
		return id;
	}

	function registrarReservacion(idusuario,idrestaurante,fecha,hora,cantidad,estado){

		daoOrden.registrarReservacion(idusuario,idrestaurante,fecha,hora,cantidad,estado);
	
	}
}