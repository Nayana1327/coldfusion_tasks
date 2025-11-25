<cfcomponent output="false">

    <cfset this.name = "AddressBook">
    <cfset this.applicationTimeout = createTimespan(0, 1, 0, 0)>

    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimespan(0, 1, 0, 0)>

    <cfset this.enableCSRFToken = true>

    <cfset this.ormEnabled = true>
    <cfset this.datasource = "CFTestDS">

    <cfset this.ormSettings = {
        cfclocation = "model",   
        dbcreate    = "update",  
        logSQL      = true       
    }>

    <cffunction name="onApplicationStart" returnType="boolean" output="false">
        <cfreturn true>
    </cffunction>

    <cffunction name="onSessionStart" returnType="void" output="false">
        <cfset session.userID = "">
        <cfset session.username = "">
    </cffunction>

</cfcomponent>
