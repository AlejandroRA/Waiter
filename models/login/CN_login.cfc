component extends="coldbox.system.EventHandler"{

	property name="daoLogin" inject="login/DAO_login";

	/**
	* init
	*/
	function init(){
		return this;
	}
	/**
	* autentificacion
	*/
	function autentificacion(username, password){
		return daoLogin.autentificacion(username,password);
	}
	/**
	* getMunicipios
	*/
	function getMunicipios(){
		return daoLogin.getMunicipios();
	}
	/**
	* insertarUsuarioT
	*/
	//		resul = cnLogin.insertarUsuarioT(rc.nombre,rc.apaterno,rc.amaterno,rc.email,rc.telefono, rc.calle, rc.colonia,rc.numext,rc.username,rc.pass, 2, rc.numTC, 1, rc.segTC);
	/**
	* getCountUserName
	*/
	function getCountUserName(username){
		return daoLogin.getCountUserName(username);
	}
	function getCountEmail(email){
		return daoLogin.getCountEmail(email);
	}

	function insertarUsuarioT(nombre,apaterno,amaterno,email,telefono,calle,colonia,numext,username,pass,estado,numTC,mun,segTC){
		return daoLogin.insertarUsuarioT(nombre,apaterno,amaterno,email,telefono,calle,colonia,numext,username,pass,estado,numTC,mun,segTC);
	}
	function insertarUsuarioN(nombre,apaterno,amaterno,email,telefono,calle,colonia,numext,username,pass,estado,mun){
		return daoLogin.insertarUsuarioN(nombre,apaterno,amaterno,email,telefono,calle,colonia,numext,username,pass,estado,mun);
	}

}