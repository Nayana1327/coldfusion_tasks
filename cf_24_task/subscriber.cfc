<cfcomponent>

    <cffunction name="checkEmail" access="remote" returntype="any" output="false" returnFormat="json">
        <cfargument name="email" type="string" required="true">

        <cfset var result = { "exists" = false }>

        <cfquery name="qCheck" datasource="CFTestDS">
            SELECT COUNT(*) AS total
            FROM subscribers
            WHERE email = <cfqueryparam value="#trim(arguments.email)#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfif qCheck.total GT 0>
            <cfset result.exists = true>
        </cfif>

        <cfreturn serializeJSON(result)>
    </cffunction>

    <cffunction name="insertSubscriber" access="remote" returntype="any" output="false" returnFormat="json">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="email" type="string" required="true">

        <cfset var result = { "success" = false, "message" = "" }>

        <cftry>
            <cfquery datasource="CFTestDS">
                INSERT INTO subscribers (first_name, email)
                VALUES (
                    <cfqueryparam value="#trim(arguments.firstName)#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#trim(arguments.email)#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>

            <cfset result.success = true>
            <cfset result.message = "Inserted successfully.">

            <cfcatch type="any">
                <cfset result.message = cfcatch.message>
            </cfcatch>
        </cftry>

        <cfreturn serializeJSON(result)>
    </cffunction>

</cfcomponent>
