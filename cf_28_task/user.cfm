<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CMS - Admin & User</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <cfif NOT structKeyExists(session, "username")>
            <cflocation url="login.cfm">
        </cfif>
        <cfset pageAction = createObject("component", "service")>
        <cfset pages = pageAction.getPages()>
        <cfoutput>
            <h1>Welcome, #session.username#!</h1>
            <cfif pages.recordCount EQ 0>
                <p>No Details to show.</p>
            <cfelse>
                <table border="1" cellpadding="6" cellspacing="0">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop query="pages">
                            <tr>
                                <td>#currentrow#</td>
                                <td>#page_name#</td>
                                <td>#page_desc#</td>
                            </tr>
                        </cfloop>
                    </tbody>
                </table>
            </cfif>
            <br><br>
           <a class="aClass" href="logout.cfm">Logout</a>
        </cfoutput>
    </body>
</html>