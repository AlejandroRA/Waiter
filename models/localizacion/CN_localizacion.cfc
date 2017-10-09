component extends="coldbox.system.EventHandler"{

	property name="daoLocalizacion" inject="localizacion/DAO_localizacion";
	/**
	* init
	*/
	function init(){
		return this;
	}
	/**
	* getRestaurantes
	*/
	function getRestaurantes(){
		return daoLocalizacion.getRestaurantes();
	}
	/**
	* getRestaurant
	*/
	function getRestaurant(id){
		return daoLocalizacion.getRestaurant(id);
	}
	/**
	* getComentariosRestaurante
	*/
	function getComentariosRestaurante(id){
		return daoLocalizacion.getComentariosRestaurante(id);
	
	}
	/**
	* getPuntajeRestaurante
	*/
	function getPuntajeRestaurante(id){
		return daoLocalizacion.getPuntajeRestaurante(id);
	
	}
}
