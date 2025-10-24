<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on Session StructKey</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            Key: <input class="inputClass" type="text" name="keyField" required>
            Value: <input class="inputClass" type="text" name="valueField" required>
            <input type="submit" name="submit" value="Submit">
        </form>

        <cfif NOT structKeyExists(session, "myStruct")>
            <cfset session.myStruct = structNew()>
        </cfif>

        <cfif structKeyExists(form, "submit")>
            <cfset structInsert(session.myStruct, trim(form.keyField), trim(form.valueField))>

            <h3>All Key-Value Pairs:</h3>
            <cfdump var="#session.myStruct#">
        </cfif>

    </body>
</html>