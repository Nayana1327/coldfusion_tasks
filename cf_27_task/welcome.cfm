<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Q 27</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <cfif NOT structKeyExists(session, "loggedIn") OR NOT session.loggedIn>
            <cflocation url="login.cfm">
        </cfif>
        <cfoutput>
            <h1>Welcome, #session.username#!</h1>
            <a class="aClass" href="logout.cfm">Logout</a>
        </cfoutput>
    </body>
</html>