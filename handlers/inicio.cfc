/*
* =========================================================================
* IPN - ESCOM
* Sistema: SII
* Modulo: Principal
* Sub modulo: 
* Fecha: Agosto 12, 2017
* Descripcion: Handler para mostrar el menu principal 
* =========================================================================
*/

component extends="coldbox.system.EventHandler"{
	
	function index(event,rc,prc){
		//var cn	= getModel("usuario.CN_Menu");
			//var rol	= Session.cbstorage.usuario.ROL;			
			//var niveles = cn.getMenu(rol);
			//getPlugin("SessionStorage").setVar("menu", niveles);
			//var rolDesc = cn.getRol(Session.cbstorage.usuario.PK);
			//getPlugin("SessionStorage").setVar("rol", rolDesc);
		event.setView("/sesion/inicio");	
	}


}