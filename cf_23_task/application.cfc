<cfcomponent>
    <cffunction name="insertApplication" access="public" returntype="void" output="false">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="lastName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="phoneNumber" type="string" required="true">
        <cfargument name="position" type="string" required="true">
        <cfargument name="relocate" type="string" required="true">
        <cfargument name="startDate" type="string" required="true">
        <cfargument name="portfolio" type="string">
        <cfargument name="salary" type="string">
        <cfargument name="resume" type="string">
       
            <cfquery datasource="CFTestDS">
                INSERT INTO application_details (
                    first_name, last_name, email_id, phone_number, 
                    position, relocate, start_date, portfolio, 
                    salary,resume
                )
                VALUES (
                    <cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.phoneNumber#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.position#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.relocate#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.startDate#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.portfolio#" cfsqltype="cf_sql_varchar">,
                     <cfqueryparam value="#arguments.salary#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.resume#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
    </cffunction>
</cfcomponent>
