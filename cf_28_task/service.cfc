<cfcomponent>
    
    <cffunction name="getPages" access="public" returntype="query" output="false">
        <cfquery name="qPages" datasource="CFTestDS">
            SELECT id, page_name, page_desc
            FROM page
            ORDER BY id
        </cfquery>
        <cfreturn qPages>
    </cffunction>

    <cffunction name="addPage" access="public" output="false">
        <cfargument name="page_name" required="true" type="string">
        <cfargument name="page_desc" required="true" type="string">
        <cfquery datasource="CFTestDS">
            INSERT INTO page (page_name, page_desc)
            VALUES (
                <cfqueryparam value="#arguments.page_name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.page_desc#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    </cffunction>

    <cffunction name="editPage" access="public" output="false">
        <cfargument name="id" required="true" type="numeric">
        <cfargument name="page_name" required="true" type="string">
        <cfargument name="page_desc" required="true" type="string">
        <cfquery datasource="CFTestDS">
            UPDATE page
            SET page_name = <cfqueryparam value="#arguments.page_name#" cfsqltype="cf_sql_varchar">,
                page_desc = <cfqueryparam value="#arguments.page_desc#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>

    <cffunction name="deletePage" access="public" output="false">
        <cfargument name="id" required="true" type="numeric">
        <cfquery datasource="CFTestDS">
            DELETE FROM page
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>

</cfcomponent>
