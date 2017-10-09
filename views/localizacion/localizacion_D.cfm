<cffunction name="findLatLong"  output="false" returntype="struct">
    <cfargument name="street" type="string" required="true" >
    <cfargument name="city" type="string" required="true">
    <cfargument name="state" type="string" required="true">
    <cfargument name="zip" type="string" required="true">
<!---- Replacing all the spaces with '+' and removing ',' ---->
    <cfset VARIABLES.loc_street=trim(replacenocase(replacenocase(ARGUMENTS.street," ","+","all"),",","","all"))>
    <cfset VARIABLES.loc_city=trim(replacenocase(replacenocase(ARGUMENTS.city," ","+","all"),",","","all"))>
    <cfset VARIABLES.loc_state=trim(replacenocase(replacenocase(ARGUMENTS.state," ","+","all"),",","","all"))>
    <cfset VARIABLES.loc_zip=trim(replacenocase(replacenocase(ARGUMENTS.zip," ","+","all"),",","","all"))>
    <!----Creating an address string in proper format for google maps(Streetname,City,State,Zipcode) ---->
    <cfset VARIABLES.urladdress="#loc_street#,#loc_city#,#loc_state#,#loc_zip#">
    <cftry>
      <cfhttp result="geocode" url="http://maps.googleapis.com/maps/api/geocode/xml?address=#urladdress#&sensor=false" method="get">
        <cfhttpparam type="header" name="Content-Type" value="text/xml">
      </cfhttp>
      <cfset VARIABLES.gcode = "#xmlparse(geocode.filecontent)#">
      <cfif VARIABLES.gcode.geocoderesponse.status.xmltext EQ "OK">
        <cfset VARIABLES.newlat = "#VARIABLES.gcode.geocoderesponse.result.geometry.location.lat.xmltext#">
        <cfset VARIABLES.newlon = "#VARIABLES.gcode.geocoderesponse.result.geometry.location.lng.xmltext#">
        <cfset VARIABLES.gcodefail = 0>
      <cfelse>
        <cfset VARIABLES.newlat = "0">
        <cfset VARIABLES.newlon = "0">
        <cfset VARIABLES.gcodefail = 1>
      </cfif>

      <cfcatch>
        <cfdump var="#cfcatch#">
        <cfset VARIABLES.newlat = "0">
        <cfset VARIABLES.newlon = "0">
        <cfset VARIABLES.gcodefail = 1>
      </cfcatch>
    </cftry>
    <cfset VARIABLES.locationstruct=structNew()>
    <cfset VARIABLES.locationstruct.latitude=newlat>
    <cfset VARIABLES.locationstruct.longitude=newlon>
    <cfset VARIABLES.locationstruct.gcodefail=gcodefail>
    <cfreturn VARIABLES.locationstruct>
  </cffunction>
<cffunction name="googleGeoCodeify" access="remote" output="true" returntype="struct">
        <cfargument name="location1_lat" type="numeric" required="true">
        <cfargument name="location1_long" type="numeric" required="true">
        <cfargument name="location2_lat" type="numeric" required="true">
        <cfargument name="location2_long" type="numeric" required="true">
        <cftry>
            <cfset VARIABLES.drivingdetails = structnew()>
            <!---- build querystring to send to google---->
            <cfset VARIABLES.googlequerystring="origins=#ARGUMENTS.location1_lat#,#ARGUMENTS.location1_long#">
            <cfset VARIABLES.googlequerystring=googlequerystring & "&destinations=#ARGUMENTS.location2_lat#,#ARGUMENTS.location2_long#">
            <cfset VARIABLES.googlequerystring=left(googlequerystring,len(googlequerystring)-1)>
            <cfset VARIABLES.googlequerystring=googlequerystring & "&mode=driving&language=en&avoid=tolls&units=imperial&sensor=false">
            <cfset VARIABLES.googleurl="http://maps.googleapis.com/maps/api/distancematrix/json?#googlequerystring#">
 
            <cfhttp url="#VARIABLES.googleurl#" method="GET" throwonerror="no" timeout="10"/>
            <cfset VARIABLES.resultstr = deserializeJSON(cfhttp.FileContent)>
            <cfif VARIABLES.resultstr.status eq "OK">
                <cfset VARIABLES.drivingdetails.drivingdistance = REReplace(VARIABLES.resultstr.rows[1].elements[1].distance.text,"[^0-9.]?","","all")>
                <cfset VARIABLES.drivingdetails.drivingtime = REReplace(VARIABLES.resultstr.rows[1].elements[1].duration.text,"[^0-9.]?","","all")>
            <cfelse>
                <cfset VARIABLES.drivingdetails.drivingdistance = "-999999">
                <cfset VARIABLES.drivingdetails.drivingtime = "-999999">
            </cfif>
 
            <cfcatch>
                <cfset VARIABLES.drivingdetails.drivingdistance = "-999999">
                <cfset VARIABLES.drivingdetails.drivingtime = "-999999">
                <cfdump var="#cfcatch#">
            </cfcatch>
        </cftry>
        <!---- return the struct with requrired driving distance and time ---->
        <cfreturn VARIABLES.drivingdetails>
    </cffunction>

<cfset source = findLatLong('300 Boylston Ave E', 'Seattle', 'WA', '98102')>
<cfset destination = findLatLong('555 N 105th St','Seattle','WA','98133')>
<cfset distance = googleGeoCodeify(source.latitude,source.longitude,destination.latitude,destination.longitude)>
    <cfdump var="#distance#">
<cfdump var=#source# >
<cfdump var=#destination# >
<cfdump var=#distance#>

  