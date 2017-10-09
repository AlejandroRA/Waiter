<cfcomponent extends="coldbox.system.EventHandler">

	<cffunction name="init">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="addComentario" hint="Agregar un comentario">
		<cfargument name="id_usuario" type="any" hint="pk de usuario">
		<cfargument name="id_restaurante" type="any" hint="pk de restaurante">
		<cfargument name="comentario" type="any" hint="Comentarios">
		<cfargument name="raiting" type="any" hint="Raiting">
		<cfquery datasource="BD_APP" name="result">
		INSERT INTO COMENTARIO (PK_USUARIO, PK_RESTAURANTE, OBSERVACION,PUNTAJE) VALUES (#id_usuario#,#id_restaurante#,'#comentario#',#raiting#)

		</cfquery>
		<cfreturn true>
	</cffunction>

	<cffunction name="getCategorias" hint="Obtiene categorias de platillos">
		<cfargument name="pk_restaurante" type="any" hint="pk del restaurante">
		<cfquery name="result" datasource="BD_APP">
		SELECT  C.ID_CATEGORIA ID ,C.NOMBRE NOMBRE FROM RESTAURANTE R, CATEGORIA C WHERE C.FK_RESTAURANTE = R.ID_RESTAURANTE  AND R.ID_RESTAURANTE = #pk_restaurante# AND C.ESTADO > 0 ORDER BY ORDEN 
	</cfquery>
	<cfreturn result>
	</cffunction>
	

	<cffunction name="getPlatillos" hint="Obtiene platillos por categoria">
		<cfargument name="pk_categoria" type="any" hint="pk de la categoria">
		<cfquery name="result" datasource="BD_APP">
			SELECT P.ID_PLATILLO ID_P, P.NOMBRE NOMBRE_P, P.DESCRIPCION DESCRIPCION, P.TIEMPOPREPARACION TIEMPO, P.PRECIO PRECIO FROM RESTAURANTE R, CATEGORIA C, PLATILLO P WHERE C.FK_RESTAURANTE = R.ID_RESTAURANTE AND P.FK_CATEGORIA = C.ID_CATEGORIA AND C.ID_CATEGORIA = #pk_categoria# AND P.ESTADO > 0 ORDER BY P.NOMBRE
		</cfquery>
		<cfreturn result>
	</cffunction>

	<cffunction name="getRFC" hint="Obtieneel RFC de un restaurante">
		<cfargument name="id_restaurante" hint="id dle restaurante">
		<cfquery name="result" datasource="BD_APP">
			SELECT R.RFC RFC FROM RESTAURANTE R WHERE ID_RESTAURANTE = #id_restaurante#
		</cfquery>
		<cfreturn result.RFC>
	</cffunction>


</cfcomponent>