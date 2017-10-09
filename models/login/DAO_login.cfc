<cfcomponent extends="coldbox.system.EventHandler">

	<cffunction name="init">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>

	
	<cffunction name="autentificacion" returntype="query">
		<cfargument name="username" type="any" hint="Nombre de usuario">
		<cfargument name="password" type="any" hint="Contraseña de usuario">
		<cfquery name="resultado" datasource="BD_APP">
			SELECT ID_USUARIO ID, NOMBRE NOMBRE, APATERNO APATERNO, AMATERNO AMATERNO, EMAIL EMAIL, CELULAR CEL, COLONIA COLONIA, NUMEROEXT NUME, NOMBREUSUARIO USERN, NUM_TRAJETA NUMT, FK_DEL_MPIO DM, PASSWORD CON, ESTADO ESTADO
				FROM USUARIO WHERE NOMBREUSUARIO = '#username#' AND PASSWORD = '#password#' AND ESTADO IN (1,2)
		</cfquery>
		<cfreturn resultado>
	</cffunction>

	<cffunction name="getMunicipios" returntype="query">
		<cfquery name="resultado" datasource="BD_APP">
			SELECT ID_DEL_MPIO ID, NOMBRE NOMBRE FROM DEL_MPIO ORDER BY NOMBRE
		</cfquery>
		<cfreturn resultado>
	</cffunction>
	<cffunction name="getCountEmail" returntype="numeric">
		<cfargument name="email" type="any" hint="Nombre de usuario">	
		<cfquery name="resultado" datasource="BD_APP">
			SELECT COUNT(EMAIL) C FROM USUARIO WHERE EMAIL='#email#'
		</cfquery>
		<cfreturn resultado.C>
	</cffunction>
	<cffunction name="getCountUserName" returntype="numeric">
		<cfargument name="username" type="any" hint="Nombre de usuario">	
		<cfquery name="resultado" datasource="BD_APP">
			SELECT COUNT(NOMBREUSUARIO) C FROM USUARIO WHERE NOMBREUSUARIO='#username#'
		</cfquery>
		<cfreturn resultado.C>
	</cffunction>
	
	<cffunction name="insertarUsuarioT" returntype="any">
		<cfargument name="nombre" type="any" hint="Nombre de usuario">
		<cfargument name="apaterno" type="any" hint="Nombre de usuario">
		<cfargument name="amaterno" type="any" hint="Nombre de usuario">
		<cfargument name="email" type="any" hint="Nombre de usuario">
		<cfargument name="telefono" type="any" hint="Nombre de usuario">
		<cfargument name="calle" type="any" hint="Nombre de usuario">
		<cfargument name="colonia" type="any" hint="Nombre de usuario">
		<cfargument name="numeroext" type="any" hint="Nombre de usuario">
		<cfargument name="username" type="any" hint="Nombre de usuario">
		<cfargument name="pass" type="any" hint="Nombre de usuario">
		<cfargument name="estado" type="any" hint="Nombre de usuario">
		<cfargument name="numTC" type="any" hint="Nombre de usuario">
		<cfargument name="municipio" type="any" hint="Nombre de usuario">
		<cfargument name="segTC" type="any" hint="Nombre de usuario">
		<cftry>
			<cfquery name="resultado" datasource="BD_APP" result="result">
				INSERT INTO USUARIO (NOMBRE, APATERNO, AMATERNO,EMAIL,CELULAR,CALLE,COLONIA,NUMEROEXT,NOMBREUSUARIO,PASSWORD,ESTADO,NUM_TRAJETA,FK_DEL_MPIO,NIP) 
				VALUES ('#nombre#','#apaterno#','#amaterno#','#email#','#telefono#','#calle#','#colonia#',#numeroext#,'#username#','#pass#',#estado#,'#numTC#',#municipio#,'#segTC#')
			</cfquery>
			<cfdump var="#result['ROWID']#" abort="true">
			<cfreturn true>
			<cfcatch type="Database">
				<cfdump var=" #CFCATCH.TYPE#" abort="true">
				<cfreturn false>
			</cfcatch>
		</cftry>
		

	</cffunction>
	<cffunction name="insertarUsuarioN" returntype="any">
		<cfargument name="nombre" type="any" hint="Nombre de usuario">
		<cfargument name="apaterno" type="any" hint="Nombre de usuario">
		<cfargument name="amaterno" type="any" hint="Nombre de usuario">
		<cfargument name="email" type="any" hint="Nombre de usuario">
		<cfargument name="telefono" type="any" hint="Nombre de usuario">
		<cfargument name="calle" type="any" hint="Nombre de usuario">
		<cfargument name="colonia" type="any" hint="Nombre de usuario">
		<cfargument name="numeroext" type="any" hint="Nombre de usuario">
		<cfargument name="username" type="any" hint="Nombre de usuario">
		<cfargument name="pass" type="any" hint="Nombre de usuario">
		<cfargument name="estado" type="any" hint="Nombre de usuario">
		<cfargument name="municipio" type="any" hint="Nombre de usuario">
		<cftry>
			<cfquery name="resultado" datasource="BD_APP">
				INSERT INTO USUARIO (NOMBRE, APATERNO, AMATERNO,EMAIL,CELULAR,CALLE,COLONIA,NUMEROEXT,NOMBREUSUARIO,PASSWORD,ESTADO,FK_DEL_MPIO) 
				VALUES ('#nombre#','#apaterno#','#amaterno#','#email#','#telefono#','#calle#','#colonia#',#numeroext#,'#username#','#pass#',#estado#,#municipio#)
			</cfquery>
			<cfreturn true>
			<cfcatch type="Database">
				<cfdump var=" #CFCATCH.TYPE#" abort="true">
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>