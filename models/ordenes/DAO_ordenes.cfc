<cfcomponent extends="coldbox.system.EventHandler">

	<cffunction name="init">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="crearOrderDomicilio" hint="Obtencion del pk de orden actual">
		<cfargument name="idRestaurante" type="any" hint="id del restaurante">
		<cfargument name="idUsuario" type="any" hint="id del usuario">
		<cfargument name="direccion" type="any" hint="Direccion del usuario">
		<cfquery name="result" datasource="BD_APP">
			INSERT INTO "WAITER"."ORDEN" 
			( FECHA, HORA, FK_USUARIO, FK_TIPO_ORDEN, FK_RESTAURANTE, DIRECCION,ESTADO) 
			VALUES 
			(to_char(sysdate,'DD/MM/YY'), 
				to_char(sysdate,'HH24:MI:SS'),#idUsuario#,3,#idRestaurante#, '#direccion#',1)
		</cfquery>
	<!--- <cfreturn result>
	 ---></cffunction>
	<cffunction name="getId" hint="obtiene el ultimo pk generado en ordenes por el usuario">
		<cfargument name="idRestaurante" hint="id del restaurante" type="any">
		<cfargument name="idUsuario" hint="id del usuario" type="any">
		<cfquery name="result" datasource="BD_APP">
			SELECT MAX(ID_ORDEN) ID FROM ORDEN WHERE FK_RESTAURANTE = #idRestaurante# AND FK_USUARIO = #idUsuario# AND ESTADO > 0
		</cfquery>
		<cfreturn result.ID>
	</cffunction>
	<cffunction name="agregarPlatilloOrden" hint="Agrega platillos al pedido">
		<cfargument name="idOrden" hint="pk de la orden">
		<cfargument name="idPlatillo" hint="pk del platillo">
		<cfargument name="espeficaciones" hint="especificaciones del platillo">
		<cfargument name="cantidad" hint="cantidad del platillo">
		<cfquery name="resulto" datasource="BD_APP">
			INSERT INTO PLATILLO_ORDEN(ESTADO,CANTIDAD,ESPECIFICACIONES,FK_ORDEN,FK_PLATILLO) VALUES(1,#cantidad#,'#espeficaciones#',#idOrden#,#idPlatillo#)
		</cfquery>
	</cffunction>
	<cffunction name="registrarReservacion" hint="registrar reservacion">
		<cfargument name="idUsuario" type="any" hint="pk de usuario">
		<cfargument name="idRestaurante" type="any" hint="pk de usuario">
		<cfargument name="fecha" type="any" hint="pk de usuario">
		<cfargument name="hora" type="any" hint="pk de usuario">
		<cfargument name="cantidad" type="any" hint="pk de usuario">
		<cfargument name="estado" type="any" hint="pk de usuario">
		<cfquery datasource="BD_APP" name="resultado">
		INSERT INTO RESERVACION (FECHA,HORA,NUMPERSONAS, FK_USUARIO,FK_RESTAURANTE, ESTADO) VALUES(TO_DATE('#fecha#', 'DD/MM/YY'),'#hora#',#cantidad#,#idUsuario#,#idrestaurante#,#estado#)
		</cfquery>
		<cfreturn true>
	</cffunction>
	
</cfcomponent>