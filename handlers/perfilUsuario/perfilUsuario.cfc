component extends="coldbox.system.EventHandler"{

	property name="cnPerfil" inject="/perfilUsuario/CN_perfil";
	property name="cnLogin" inject="/login/CN_login";


	function index(event,rc,prc){
		var res = cnPerfil.getUsuario(session.cbstorage.usuario.id);
		/*Municipios para edicion*/
		prc.municipios = cnLogin.getMunicipios();
		/*Generales*/
		prc.username = res.USERN;
		prc.nombre = res.NOMBRE;
		prc.apaterno = res.APATERNO;
		prc.amaterno = res.AMATERNO;
		prc.email = res.EMAIL;
		prc.cel =  res.CEL;
		/*Localizacion*/
		prc.dm = res.DM;
		prc.colonia =  res.COLONIA;
		prc.calle = res.CALLE;
		prc.num = res.NUMEXT;
		prc.estado = res.ESTADO;
		prc.id_m = res.ID_M;
		prc.direccion = prc.dm & " " & prc.colonia & " " & prc.calle & " " & prc.num;
		/*Finanzas*/
		prc.numt = res.NUMT;
		prc.nums = res.NIP;
		event.setView("/perfilUsuario/perfilUsuario");
	}
	/**
	* editarPerfil
	*/
	function editarPerfil(event, rc, prc){
		/*Edicion de datos generales*/
		//writeDump(rc);
		//abort;
		if(rc.type EQ 1){
			/*Coincidencias en el correo*/
			if(cnLogin.getCountEmail(Trim(rc.email)) && CompareNoCase(Trim(rc.email), session.cbstorage.usuario.email) NEQ 0){
				getInstance( "MessageBox@cbmessagebox" ).setMessage("warn","No se puedieron actualizar los datos ya que la cuenta de correo ya ha sido registrado anteriormente");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
				return;
			}
			res = cnPerfil.editarDatosGenerales(session.cbstorage.usuario.id,Trim(rc.nombre),Trim(rc.apaterno),Trim(rc.amaterno),Trim(rc.telefono),Trim(rc.email));
			if(res){
				session.cbstorage.usuario.email = Trim(rc.email);
				getInstance( "MessageBox@cbmessagebox" ).setMessage("info","Los datos fueron correctamente modificados");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}
			else{
				getInstance( "MessageBox@cbmessagebox" ).setMessage("error","Ocurrio un error al modificar los datos");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}
		
		}else if(rc.type EQ 2){
			res = cnPerfil.editarDatosLocalizacion(session.cbstorage.usuario.id,rc.delegacion,Trim(rc.colonia),Trim(rc.calle),Trim(rc.numero));
			if(res){

				getInstance( "MessageBox@cbmessagebox" ).setMessage("info","Los datos fueron correctamente modificados");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}else{
				getInstance( "MessageBox@cbmessagebox" ).setMessage("error","Ocurrio un error al modificar los datos");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}
		}else if(rc.type EQ 3){
			res = cnPerfil.editarDatosBancarios(session.cbstorage.usuario.id,Trim(rc.numerotarjeta),Trim(rc.numeroseguridad),2);
			if(res){
				session.cbstorage.usuario.estado = 2;
				getInstance( "MessageBox@cbmessagebox" ).setMessage("info","Los datos fueron correctamente modificados");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}else{
				getInstance( "MessageBox@cbmessagebox" ).setMessage("error","Ocurrio un error al modificar los datos");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}
		}else if(rc.type EQ 4){
			res = cnPerfil.editarDatosBancarios(session.cbstorage.usuario.id,"","",1);
			if(res){
				session.cbstorage.usuario.estado = 1;
				getInstance( "MessageBox@cbmessagebox" ).setMessage("info","Los datos fueron correctamente modificados");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}else{
				getInstance( "MessageBox@cbmessagebox" ).setMessage("error","Ocurrio un error al modificar los datos");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}
		}else if(rc.type EQ 5){
			res = cnPerfil.desactivarCuenta(session.cbstorage.usuario.id);
			if(res){
				getInstance( "MessageBox@cbmessagebox" ).setMessage("info","El perfil de usuario fue eliminado exitosamente");
				setNextEvent("/main/index");
			}else{
				getInstance( "MessageBox@cbmessagebox" ).setMessage("error","Ocurrio al eliminar el perfil");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}
		}else{
			if( compare(session.cbstorage.usuario.con,Trim(rc.conc)) NEQ 0){
				getInstance( "MessageBox@cbmessagebox" ).setMessage("error","La contrase&ntilde;a ingresada no es correcta");
				setNextEvent("/perfilUsuario/perfilUsuario/index");
			}else{
				res = cnPerfil.editarContrasena(session.cbstorage.usuario.id,Trim(rc.conn));
				if(res){
					getInstance( "MessageBox@cbmessagebox" ).setMessage("info","La contrase&ntilde;a fue cambiada correctamente");
					setNextEvent("/perfilUsuario/perfilUsuario/index");
				}else{
					getInstance( "MessageBox@cbmessagebox" ).setMessage("error","Ocurrio un error al modificar los datos");
					setNextEvent("/perfilUsuario/perfilUsuario/index");
				}
			}
		}
	
	}

}