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
            Key:<input class="inputClass" type="text" name="keyField" required>
            Value:<input class="inputClass" type="text" name="valueField" required>
            <input type="submit" name="submit" value="Submit">
        </form>

        <cfif NOT structKeyExists(session, "myStruct")>
            <cfset session.myStruct = structNew()>
        </cfif>

        <cfif structKeyExists(form, "submit")>
            <cfset newKey = trim(form.keyField)>
            <cfset newValue = trim(form.valueField)>
            <cfset session.myStruct[newKey] = newValue>

            <cfdump var="#session.myStruct#">
        </cfif>
    </body>
</html>