<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Q 27</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            Username: <input class="inputClass" type="text"  name="username" required><br>
            Password: <input class="inputClass" type="password"  name="password" required><br>
            <input type="submit" name="login" value="Login">
        </form>
        <cfif structKeyExists(form, "login")>
            <cfparam name="form.username" default="" type="string">
            <cfparam name="form.password" default="" type="string">

            <cfquery name="getUser" datasource="CFTestDS">
                SELECT username, password
                FROM users
                WHERE username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
            </cfquery>

            <cfif getUser.recordCount EQ 1 AND hash(form.password, "SHA-512") EQ getUser.password>
                <cfset session.loggedIn = true>
                <cfset session.username = form.username>
                <cflocation url="welcome.cfm">
            <cfelse>
                <cfoutput><p style="color:red;">Invalid login credentials. Please try again.</p></cfoutput>
            </cfif>

        </cfif>
    </body>
</html>
