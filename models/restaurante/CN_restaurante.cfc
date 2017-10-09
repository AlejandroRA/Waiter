component extends="coldbox.system.EventHandler"{

	property name="daoRestaurante" inject="/restaurante/DAO_restaurante";
	/**
	* init
	*/
	function init(){
		return this;
	}
	/**
	* addComentario
	*/
	function addComentario(id_user, id_restaurante, comentario, raiting){
		return daoRestaurante.addComentario(id_user, id_restaurante, comentario, raiting);
	}
	/**
	* getCa
	*/
	function getCategorias(id_restaurante){
		return daoRestaurante.getCategorias(id_restaurante);
	
	}
	/**
	* getPlatillos
	*/
	function getPlatillos( id_categoria){
		return daoRestaurante.getPlatillos( id_categoria);
	
	}
	/**
	* getRFC
	*/
	function getRFC(id_restaurante){
		return daoRestaurante.getRFC(id_restaurante);
	
	}
}