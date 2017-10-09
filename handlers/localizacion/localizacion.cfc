
component extends="coldbox.system.EventHandler"{
	
	property name="cnLocalizacion" inject="/localizacion/CN_localizacion";
	property name="cnFTP" inject="/FTP/CN_FTP";

	function index(event,rc,prc){
		prc.restaurantes = cnLocalizacion.getRestaurantes();
		event.setView("/localizacion/localizacion");
	}
	function consultar(event, rc, prc){
		prc.id = rc.id;
		prc.res = cnLocalizacion.getRestaurant(rc.ID);
		prc.direccion = prc.res.DELEGACION & " "  & prc.res.COLONIA &" "&prc.res.CODIGOPOSTAL& " "& prc.res.CALLE &" "& prc.res.NUMEXT; 
		prc.comentarios = cnLocalizacion.getComentariosRestaurante(rc.ID);
		prc.puntaje = cnLocalizacion.getPuntajeRestaurante(rc.ID);
		cnFTP.getLogo(prc.res.RFC);
		event.setView(view="/localizacion/consulta", layout="Main_R");
		
	}

}