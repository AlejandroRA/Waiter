component extends="coldbox.system.EventHandler"{

	property name="daoPerfil" inject="perfilUsuario/DAO_perfil";

	/**
	* init
	*/
	function init(){
		return this;
	}

	/**
	* getUsuario
	*/
	function getUsuario(pk){
		return daoPerfil.getUsuario(pk);
	}
	/**
	* editarDatosGenerales
	*/
	function editarDatosGenerales(pk,nombre,apaterno,amaterno,telefono,email){
		return daoPerfil.editarDatosGenerales(pk,nombre,apaterno,amaterno,telefono,email);
	}
	/**
	* editarDatosLocalizacion
	*/
	function editarDatosLocalizacion(pk,delegacion,colonia,calle,numero){
		return daoPerfil.editarDatosLocalizacion(pk,delegacion,colonia,calle,numero);
	}
	/**
	* editarDatosBancarios
	*/
	function editarDatosBancarios(pk,numerotarjeta, numeroseguridad,estado){
		return daoPerfil.editarDatosBancarios(pk,numerotarjeta,numeroseguridad,estado);
	}
	/**
	* desactivarCuenta
	*/
	function desactivarCuenta(pk){
		return daoPerfil.desactivarCuenta(pk);
	}
	/**
	* editarContrasena
	*/
	function editarContrasena(pk,contrasena){
		return daoPerfil.editarContrasena(pk,contrasena);
	}

}