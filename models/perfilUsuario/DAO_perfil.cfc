<cfcomponent extends="coldbox.system.EventHandler">

	<cffunction name="init">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="getUsuario" returntype="query">
		<cfargument name="pk" type="any" hint="pk de usuario">
		<cfquery name="resultado" datasource="BD_APP">
			SELECT USR.ID_USUARIO ID, USR.NOMBRE NOMBRE, USR.APATERNO APATERNO, USR.AMATERNO AMATERNO, USR.EMAIL EMAIL, 
				USR.CELULAR CEL, USR.COLONIA COLONIA, USR.CALLE CALLE, USR.NUMEROEXT NUMEXT, 
				USR.NOMBREUSUARIO USERN, USR.NUM_TRAJETA NUMT, USR.NIP NIP, DELM.NOMBRE DM, USR.ESTADO ESTADO, DELM.ID_DEL_MPIO ID_M
			FROM USUARIO USR, DEL_MPIO DELM  WHERE USR.ID_USUARIO = #pk# AND DELM.ID_DEL_MPIO = USR.FK_DEL_MPIO
		</cfquery>
		<cfreturn resultado>
	</cffunction>

	<cffunction name="editarDatosGenerales" returntype="boolean">
		<cfargument name="pk" type="any" hint="pk de usuario">
		<cfargument name="nombre" type="any" hint="Nombre del usuario">
		<cfargument name="apaterno" type="any" hint="Apellido paterno">
		<cfargument name="amaterno" type="any" hint="Apellido materno">
		<cfargument name="telefono" type="any" hint="Telefono">
		<cfargument name="email" type="any" hint="Email">
		<cftry>
			<cfquery name="resultado" datasource="BD_APP">
				UPDATE USUARIO SET NOMBRE = '#nombre#', APATERNO = '#apaterno#', AMATERNO = '#amaterno#', CELULAR = '#telefono#', EMAIL = '#email#' WHERE ID_USUARIO = #pk#
			</cfquery>
			<cfreturn true>
		<cfcatch>
			<cfreturn false>
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="editarDatosLocalizacion" returntype="boolean">
		<cfargument name="pk" type="any" hint="pk de usuario">
		<cfargument name="delegacion" type="any" hint="delegacion">
		<cfargument name="colonia" type="any" hint="colonia de usuario">
		<cfargument name="calle" type="any" hint="calle de usuario">
		<cfargument name="numero" type="any" hint="numero de usuario">
		<cftry>
			<cfquery name="resultado" datasource="BD_APP">
				UPDATE USUARIO SET FK_DEL_MPIO = #delegacion#, COLONIA='#colonia#', CALLE='#calle#', NUMEROEXT=#numero# WHERE ID_USUARIO = #pk#
			</cfquery>
			<cfreturn true>
		<cfcatch>
			<cfreturn false>
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="editarDatosBancarios" returntype="boolean">
		<cfargument name="pk" type="any" hint="pk de usuario">
		<cfargument name="numerotarjeta" hint="numero tarjeta">
		<cfargument name="numeroseguridad" hint="numero de seguridad">
		<cfargument name="estado" hint="numero de seguridad">
		
		<cftry>
			<cfquery name="resultado" datasource="BD_APP">
				UPDATE USUARIO SET NUM_TRAJETA='#numerotarjeta#', NIP='#numeroseguridad#', ESTADO=#estado# WHERE ID_USUARIO = #pk#
			</cfquery>
			<cfreturn true>
		<cfcatch>
			<cfreturn false>
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="desactivarCuenta" returntype="boolean">
		<cfargument name="pk" type="any" hint="pk de usuario">
		<cftry>
			<cfquery name="resultado" datasource="BD_APP">
				UPDATE USUARIO SET ESTADO = 0 WHERE ID_USUARIO = #pk#
			</cfquery>
			<cfreturn true>
		<cfcatch>
			<cfreturn false>
		</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="editarContrasena" returntype="boolean">
		<cfargument name="pk" type="any" hint="pk de usuario">
		<cfargument name="contrasena" type="any" hint="contrasena nueva">
		<cftry>
			<cfquery name="resultado" datasource="BD_APP">
				UPDATE USUARIO SET PASSWORD = '#contrasena#' WHERE ID_USUARIO = #pk#
			</cfquery>
			<cfreturn true>
		<cfcatch>
			<cfreturn false>
		</cfcatch>
		</cftry>
	</cffunction>

</cfcomponent>