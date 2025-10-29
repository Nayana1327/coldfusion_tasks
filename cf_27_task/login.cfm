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
            <cfset username = form.username>
            <cfset password = form.password>
            <cfif username EQ "admin" AND password EQ "password123">
                <cfset session.loggedIn = true>
                <cfset session.username = username>
                <cflocation url="welcome.cfm">
            <cfelse>
                <cfoutput>
                    <p style="color: red;">Invalid login credentials. Please try again.</p>
                </cfoutput>
            </cfif>
        </cfif>
    </body>
</html>
