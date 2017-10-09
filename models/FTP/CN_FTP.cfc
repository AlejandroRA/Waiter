<cfcomponent extends="coldbox.system.EventHandler">
   <cfset SERV = "127.0.0.1">
   <cfset USER = "Alejandro-RA">
   <cfset PASS = "019972">
   
   <cffunction name="init">
      <cfscript>
         return this;
      </cfscript>
   </cffunction>
    <cffunction name="getImgPlatillos" returntype="any">
      <cfargument name="datos" type="any" hint="Conjuntos de datos">
      <cfset root = "#expandPath("\includes\img\platillos")#">
      <!---- Creacion de directorios ----->
      <cfloop from="1" to="2" index="i">
        <cfset root = root &"\"& datos[i]>
        <cfif not directoryExists(root)>
          <cfset DirectoryCreate(root)>
        </cfif>
      </cfloop>
      
      <cfset fileRoute = root &"\"&datos[3]&".jpg">
      <cfif fileExists(fileRoute)>
        <cffile
               action = "delete"
               file = "#fileRoute#">
      </cfif>
        <!----<cfdump var="#root#">----->
      <cfftp action = "open"
             username = #USER#
             connection = "CON_FTP"
             password = #PASS#
             server = #SERV#
             stopOnError = "Yes"> 
       <cfftp connection="CON_FTP"
             action="changedir"
             directory="platillos">
        <cfflush> 
      <cfloop from="1" to="2" index="i">
        <cfftp connection="CON_FTP"
             action="changedir"
             directory="#datos[i]#">
        <cfflush> 
      </cfloop>

       <cfftp connection="CON_FTP"
             action="getFile"
             remoteFile="#datos[3]#.jpg"
             localfile="#fileRoute#"
             timeout="3000"
             passive="yes">
      <cfflush>

      <cfftp action="close" connection="CON_FTP">
  
      
      <cfreturn root>
    </cffunction>

   <cffunction name="getLogo" returntype="boolean">
      <cfargument name="id" type="any" required="true" hint="Identificador imagen">
      <cfset dato = "#expandPath("\includes\img\restaurantes")#\#id#.jpg">
      <cfset imga = "#id#.jpg">

      <cfif FileExists("#expandPath("\includes\img\restaurantes")#\#id#.jpg")> 
         <cffile
               action = "delete"
               file = "#expandPath("\includes\img\restaurantes")#\#id#.jpg">
      </cfif>
      <cfftp action = "open"
             username = #USER#
             connection = "CON_FTP"
             password = #PASS#
             server = #SERV#
             stopOnError = "Yes"> 
      <cfftp connection="CON_FTP"
             action="changedir"
             directory="restaurantes">
      <cfflush> 
      <cfftp connection="CON_FTP"
             action="getFile"
             remoteFile="#id#.jpg"
             localfile="#expandPath("\includes\img\restaurantes")#\#id#.jpg"
             timeout="3000"
             passive="yes">
      <cfflush>
      <cfftp action="close" connection="CON_FTP">
      <cfscript> 
          return true;
      </cfscript>
      
   </cffunction>
</cfcomponent>
