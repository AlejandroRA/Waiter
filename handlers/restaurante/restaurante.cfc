component extends="coldbox.system.EventHandler"{
	property name="cnRestaurante" inject="/restaurante/CN_restaurante";
	property name="cnLocalizacion" inject="/localizacion/CN_localizacion";
	property name="cnFTP" inject="/FTP/CN_FTP";


	function agregarComentario(event,rc,prc){
		var res = cnRestaurante.addComentario(session.cbstorage.usuario.id,rc.id,rc.comentario,rc.raiting);
		setNextEvent(event= "/localizacion/localizacion/consultar", queryString="id=#rc.id#");
	}
	/**
	* menuRestaurante
	*/
	function menuRestaurante(event, rc, prc){
		prc.id = rc.id;
		var srt = structNew();
		prc.rfc = cnRestaurante.getRFC(prc.id);
		prc.categorias = cnRestaurante.getCategorias(prc.id);
		for(categoria in prc.categorias){
			prc.platillos[categoria.id] =  cnRestaurante.getPlatillos(categoria.id);
			for(platillo in prc.platillos[categoria.id]){
				var platillosList = arrayNew(1);
				platillosList[1] = Trim(prc.rfc);
				platillosList[2] = Trim(replace(categoria.nombre,' ','_','ALL'));
				platillosList[3] = Trim(replace(platillo.nombre_p,' ','_','ALL'));
				cnFTP.getImgPlatillos(platillosList);
			}
		}
		event.setView(view="/restaurante/menuRestaurante", layout="Main_C");
	}

	/**
	* ordenarDomicilio
	*/
	function ordenarDomicilio(event, rc, prc){
		prc.id = rc.id;
		var srt = structNew();
		prc.rfc = cnRestaurante.getRFC(prc.id);
		prc.categorias = cnRestaurante.getCategorias(prc.id);
		for(categoria in prc.categorias){
			prc.platillos[categoria.id] =  cnRestaurante.getPlatillos(categoria.id);
			for(platillo in prc.platillos[categoria.id]){
				var platillosList = arrayNew(1);
				platillosList[1] = Trim(prc.rfc);
				platillosList[2] = Trim(replace(categoria.nombre,' ','_','ALL'));
				platillosList[3] = Trim(replace(platillo.nombre_p,' ','_','ALL'));
				cnFTP.getImgPlatillos(platillosList);
			}
		}
		event.setView(view="/restaurante/Odomicilio", layout="Main_C");
	
	}
	/**
	* registrarReservacion
	*/
	function registrarReservacion(event, rc, prc){
		prc.idrestaurante = rc.id;
		prc.id = rc.id;
		event.setView(view="/restaurante/registrarReservacion", layout="Main_C");
	}
	/**
	* localizacion
	*/
	function localizacion(event, prc, rc){
		event.setView('/restaurante/datosLocalizacion').noLayout();
	}


}