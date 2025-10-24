<cfcomponent>
    <cffunction name="multiply" returntype="numeric" access="public">
        <cfset var result = 1>
        <cfloop collection = #arguments# item="key">
            <cfset result = result * arguments[key]>
        </cfloop>
        <cfreturn result>
    </cffunction>
</cfcomponent>