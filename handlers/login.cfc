component extends="coldbox.system.EventHandler"{

	property name="cnLogin" inject="login/CN_login";
	property name="cnPerfil" inject="/perfilUsuario/CN_perfil";
	
	function autentificacion(event,rc,prc){
		var res = cnLogin.autentificacion(rc.username, rc.password);
		if(res.recordCount > 0){
			session.cbstorage.usuario.id = res.ID;
			session.cbstorage.usuario.username = res.USERN;
			session.cbstorage.usuario.email = res.EMAIL;
			session.cbstorage.usuario.con = res.CON;
			session.cbstorage.usuario.estado = res.ESTADO;
			var usuario = cnPerfil.getUsuario(session.cbstorage.usuario.id);
			prc.dm = usuario.DM;
			prc.colonia =  usuario.COLONIA;
			prc.calle = usuario.CALLE;
			prc.num = usuario.NUMEXT;
			prc.estado = usuario.ESTADO;
			prc.id_m = usuario.ID_M;
			session.cbstorage.usuario.address = prc.dm & " " & prc.colonia & " " & prc.calle & " " & prc.num;
			setNextEvent("/inicio/index");
		}
		else{
			getInstance( "MessageBox@cbmessagebox" ).setMessage("error","El usuario o contrase&ntilde;a es incorrecto");
			setNextEvent("/main/index");
		}
	}
	function registroUsuario(event, rc, prc){
		prc.municipios = cnLogin.getMunicipios();
		event.setView("/login/registro").noLayout();
		
	}
	function registrarUsuario(event, rc, prc){
		if( cnLogin.getCountUserName(Trim(rc.username)) ){
			getInstance( "MessageBox@cbmessagebox" ).setMessage("warn","El nombre de usuario ya ha sido registrado anteriormente");
			setNextEvent("/login/registroUsuario");
			return;
		}
		if(cnLogin.getCountEmail(Trim(rc.email)) ){
			getInstance( "MessageBox@cbmessagebox" ).setMessage("warn","La cuenta de correo ya ha sido registrado anteriormente");
			setNextEvent("/login/registroUsuario");
			return;
		}
		
		if(rc.estado){	
			resul = cnLogin.insertarUsuarioT(Trim(rc.nombre),Trim(rc.apaterno),Trim(rc.amaterno),Trim(rc.email),Trim(rc.telefono), Trim(rc.calle), Trim(rc.colonia),Trim(rc.numext),Trim(rc.username),Trim(rc.pass), 2, Trim(rc.numTC), Trim(rc.municipio), Trim(rc.segTC));
		}
		else{
			resul = cnLogin.insertarUsuarioN(Trim(rc.nombre),Trim(rc.apaterno),Trim(rc.amaterno),Trim(rc.email),Trim(rc.telefono), Trim(rc.calle), Trim(rc.colonia),Trim(rc.numext),Trim(rc.username),Trim(rc.pass), 1, Trim(rc.municipio));
		}
		if(resul){
			getInstance( "MessageBox@cbmessagebox" ).setMessage("info","El usuario fue correctamente almacenado");
		}
		else{
			getInstance( "MessageBox@cbmessagebox" ).setMessage("error","Hubo un error almacenando el usuario en el sistema");	
		}
		setNextEvent("/main/index");
	}
	
	function cerrarsesion(event, rc, prc){
		StructClear(session);
		setNextEvent("/main/index");
	}


}