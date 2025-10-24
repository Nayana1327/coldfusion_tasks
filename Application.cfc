<cfcomponent>
    <cfset this.name = "MyApp">
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0,0,30,0)>
</cfcomponent>
