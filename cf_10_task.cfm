<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on Struct Sort Key</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            Key: <input class="inputClass" type="text" name="keyField" required>
            Value: <input class="inputClass" type="text" name="valueField" required>
            <input type="submit" name="submit" value="Submit">
        </form>

        <cfif NOT structKeyExists(session, "myStructureSort")>
            <cfset session.myStructureSort = {}>
        </cfif>
        <cfif structKeyExists(form, "submit")>
            <cfset keyValue = trim(form.keyField)>
            <cfset value = trim(form.valueField)>

            <cfif structKeyExists(session.myStructureSort, keyValue)>
                    <cfset structUpdate(session.myStructureSort, keyValue, value)>
                <cfelse>
                    <cfset structInsert(session.myStructureSort, keyValue, value)>
            </cfif>
            <cfset sortedKeys = structSort(session.myStructureSort, "text", "asc")>
            
            <cfdump var="#session.myStructureSort#">
        </cfif>
    </body>
</html>