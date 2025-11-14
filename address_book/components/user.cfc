<cfcomponent output="false">

    <cffunction name="registerUser" access="remote" returntype="struct" returnformat="json">
        <cfargument name="name" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfargument name="confirm_password" type="string" required="true">

        <cfset var result = { "success" = false, "message" = "" }>

        <cftry>
            <cfif NOT structKeyExists(arguments, "username") OR NOT structKeyExists(arguments, "password")>
                <cfset result.message = "Missing required fields.">
                <cfreturn result>
            </cfif>

            <cfset var fullName  = trim(encodeForHTML(arguments.name))>
            <cfset var emailAddr = trim(encodeForHTML(arguments.email))>
            <cfset var userName  = trim(encodeForHTML(arguments.username))>
            <cfset var password     = trim(arguments.password)>
            <cfset var confirmPassword   = trim(arguments.confirm_password)>

            <cfif len(fullName) LT 2>
                <cfset result.message = "Full name must be at least 2 characters.">
                <cfreturn result>
            </cfif>

            <cfif NOT isValid("email", emailAddr)>
                <cfset result.message = "Invalid email format.">
                <cfreturn result>
            </cfif>

            <cfif len(userName) LT 4>
                <cfset result.message = "Username must be at least 4 characters.">
                <cfreturn result>
            </cfif>

            <cfif len(password) LT 8>
                <cfset result.message = "Password must be at least 8 characters.">
                <cfreturn result>
            </cfif>

            <cfif password NEQ confirmPassword>
                <cfset result.message = "Passwords do not match.">
                <cfreturn result>
            </cfif>

            <cfquery name="qDup" datasource="CFTestDS">
                SELECT id FROM address_book
                WHERE email = <cfqueryparam value="#emailAddr#" cfsqltype="cf_sql_varchar">
                OR username = <cfqueryparam value="#userName#" cfsqltype="cf_sql_varchar">
            </cfquery>

            <cfif qDup.recordCount GT 0>
                <cfset result.message = "Email or username already exists.">
                <cfreturn result>
            </cfif>

            <cfset var passwordHash = hash(password, "SHA-512")>

            <cfquery datasource="CFTestDS">
                INSERT INTO address_book (full_name, email, username, password_hash, created_at)
                VALUES (
                    <cfqueryparam value="#fullName#" cfsqltype="cf_sql_varchar" maxlength="100">,
                    <cfqueryparam value="#emailAddr#" cfsqltype="cf_sql_varchar" maxlength="150">,
                    <cfqueryparam value="#userName#" cfsqltype="cf_sql_varchar" maxlength="100">,
                    <cfqueryparam value="#passwordHash#" cfsqltype="cf_sql_varchar" maxlength="255">,
                    <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                )
            </cfquery>

            <cfset result.success = true>
            <cfset result.message = "Registration successful!">
            <cfreturn result>

            <cfcatch>
                <cflog type="error" text="Registration error: #cfcatch.message#">
                <cfset result.message = "Server error. Please try again later.">
                <cfreturn result>
            </cfcatch>
        </cftry>
    </cffunction>

</cfcomponent>
