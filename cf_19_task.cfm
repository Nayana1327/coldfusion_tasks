<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Increment Count with cfcookie function</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form action="" method="post" class="formClass">
            <input type="submit" name="submit" value="Submit">
        </form>
        <p class="pClass">
            <cfif structKeyExists(form, "submit")>
                <cfif structKeyExists(cookie, "VisitsCounter")> 
                    <cfset cookie.VisitsCounter = cookie.VisitsCounter + 1>
                <cfelse>
                    <cfcookie name="VisitsCounter" value=1 expires="30">
                </cfif>
               <cfoutput>
                    The value of VisitsCounter is: #cookie.VisitsCounter#
               </cfoutput>
            </cfif>
        </p>
    </body>
</html>

