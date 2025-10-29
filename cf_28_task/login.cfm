<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CMS - Admin & User</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            Username: <input class="inputClass" type="text"  name="username" required><br>
            Password: <input class="inputClass" type="password"  name="password" required><br>
            <input type="submit" name="login" value="Login">
        </form>
        <cfif structKeyExists(form, "login")>
            <cfset username = trim(form.username)>
            <cfset password = trim(form.password)>
            <cfif username EQ "" OR password EQ "">
                <cfoutput>Please enter both username and password.</cfoutput>
            </cfif>
            <cfquery name="getUser" datasource="CFTestDS">
                SELECT username, password, role
                FROM [user]
                WHERE username = <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfif getUser.recordCount EQ 1>
                <cfif getUser.password EQ password>
                    <cfset session.username = getUser.username>
                    <cfset session.role = getUser.role>
                    <cfif getUser.role EQ "admin" OR getUser.role EQ "editor">
                        <cflocation url="admin.cfm">
                    <cfelseif getUser.role EQ "user">
                        <cflocation url="user.cfm">
                    <cfelse>
                        <cfoutput>Invalid role</cfoutput>
                    </cfif>
                <cfelse>
                    <cfoutput>Invalid password</cfoutput>
                </cfif>
            <cfelse>
                <cfoutput>Invalid username or password</cfoutput>
            </cfif>
        </cfif>
    </body>
</html>
