<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on StructKey Add & Replace</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            Key: <input class="inputClass" type="text" name="keyField" required>
            Value: <input class="inputClass" type="text" name="valueField" required>
            <input type="submit" name="submit" value="Submit">
        </form>
        <p class="pClass">
            <cfif NOT structKeyExists(session, "myStructure")>
                <cfset session.myStructure = {}>
            </cfif>

            <cfif structKeyExists(form, "submit")>
                <cfset keyValue = trim(form.keyField)>
                <cfset value = trim(form.valueField)>

                <cfif structKeyExists(session.myStructure, keyValue)>
                        <cfoutput>#keyValue# already present. Cannot add again</cfoutput>
                    <cfelse>
                        <cfset structInsert(session.myStructure, keyValue, value)>
                </cfif>
                
                <cfdump var="#session.myStructure#">
            </cfif>
        </p>
    </body>
</html>