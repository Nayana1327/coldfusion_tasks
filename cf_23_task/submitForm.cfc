<cfcomponent>

    <cffunction name="insertApplication" access="public" returntype="struct" output="false">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="lastName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="phonePart1" type="string" required="true">
        <cfargument name="phonePart2" type="string" required="true">
        <cfargument name="phonePart3" type="string" required="true">
        <cfargument name="position" type="string" required="true">
        <cfargument name="relocate" type="string" required="true">
        <cfargument name="startDay" type="string" required="true">
        <cfargument name="startMonth" type="string" required="true">
        <cfargument name="startYear" type="string" required="true">
        <cfargument name="portfolio" type="string">
        <cfargument name="salaryDollars" type="string">
        <cfargument name="salaryCents" type="string">
        <cfargument name="resume" type="string">
       
        <cfset var result = {}>
        <cfset phoneNumber = arguments.phonePart1 & "-" & arguments.phonePart2 & "-" & arguments.phonePart3>
        <cfset startDate = arguments.startYear, arguments.startMonth, arguments.startDay>
        <cfset salary = arguments.salaryDollars & "." & arguments.salaryCents>

        <cftry>
            <cfif structKeyExists(form, "resume") AND len(trim(form.resume))>
                <cfset uploadDir = expandPath("./uploads/")>
                <cfif NOT directoryExists(uploadDir)>
                    <cfdirectory action="create" directory="#uploadDir#">
                </cfif>
                <cffile 
                        action="upload" 
                        filefield="resume" 
                        destination="#uploadDir#" 
                        nameConflict="overwrite" 
                        result="uploadResult">
                
                <cfset arguments.resume = uploadResult.ServerFile>
            <cfelse>
                <cfset arguments.resume = "">
            </cfif>

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
                    <cfqueryparam value="#phoneNumber#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.position#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.relocate#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#startDate#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.portfolio#" cfsqltype="cf_sql_varchar">,
                     <cfqueryparam value="#salary#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.resume#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>

            <cfset result.success = true>
            <cfset result.message = "Application submitted successfully.">

            <cfcatch type="any">
                <cfset result.success = false>
                <cfset result.message = cfcatch.message>
            </cfcatch>
        </cftry>

        <cfreturn result>
    </cffunction>

</cfcomponent>
