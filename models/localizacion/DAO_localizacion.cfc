<cfcomponent extends="coldbox.system.EventHandler">

	<cffunction name="init">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="getRestaurantes" hint="Obtiene los restaurante">
		<cfquery name="result" datasource="BD_APP">
			SELECT R.ID_RESTAURANTE ID, R.NOMBRE NOMBRE, R.FK_DEL_MPIO ID_M, D.NOMBRE DELEGACION , R.COLONIA COLONIA, R.CALLE CALLE, R.CODIGOPOSTAL CODIGOPOSTAL, R.NUMEXT NUMEXT FROM RESTAURANTE R, DEL_MPIO D WHERE R.FK_DEL_MPIO =D.ID_DEL_MPIO
		</cfquery>
		<cfreturn result>
	</cffunction>

	<cffunction name="getRestaurant" hint="Obtiene un restaurante a partir del pk">
		<cfargument name="id" type="any" hint="id del restaurant">
		<cfquery name="result" datasource="BD_APP">
		SELECT R.ID_RESTAURANTE ID, R.NOMBRE NOMBRE, R.RFC RFC, R.FK_DEL_MPIO ID_M, D.NOMBRE DELEGACION , R.COLONIA COLONIA, R.CALLE CALLE,R.EMAIL EMAIL, R.CODIGOPOSTAL CODIGOPOSTAL, R.NUMEXT 
			NUMEXT FROM RESTAURANTE R, DEL_MPIO D WHERE R.FK_DEL_MPIO =D.ID_DEL_MPIO 
			AND R.ID_RESTAURANTE = #id#
	    </cfquery>
	    <cfreturn result>
	</cffunction>			
	<cffunction name="getComentariosRestaurante" hint="Obtiene los comentario de un restaurante">
		<cfargument name="id" type="any" hint="id del restaurante">
		<cfquery name="result" datasource="BD_APP">
		SELECT NOMBREUSUARIO,OBSERVACION,PUNTAJE FROM USUARIO,COMENTARIO , RESTAURANTE WHERE ID_USUARIO = PK_USUARIO AND ID_RESTAURANTE = PK_RESTAURANTE  AND PK_RESTAURANTE=#id#
		ORDER BY PUNTAJE DESC
	</cfquery>
	<cfreturn result>
	</cffunction>	
	<cffunction name="getPuntajeRestaurante" hint="Obtiene el puntaje obtenido por un restaurante">
		<cfargument name="id" type="any" hint="id del restaurante">
		<cfquery name="result" datasource="BD_APP">
		SELECT  NVL(ROUND(AVG(PUNTAJE)),0) PUNTAJE FROM COMENTARIO,RESTAURANTE WHERE ID_RESTAURANTE = PK_RESTAURANTE AND ID_RESTAURANTE=#id# 
	</cfquery>
	<cfreturn result>
	</cffunction>			
</cfcomponent>