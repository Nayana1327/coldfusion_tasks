<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Q25</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            <textarea class="inputClass" type="text" name="inputValue"></textarea><br>
            <input type="submit" name="submit" value="Submit">
        </form>
        <cfif structKeyExists(form, "submit")>
            <cfset textValue = trim(form.inputValue)>
            <cfif textValue NEQ "">
                <cfinvoke 
                    component="tagCloud"
                    method="init"
                    returnVariable="result"
                    textValue="#textValue#">
                <cfif structKeyExists(result, "success") AND result.success>
                    <p>Words inserted successfully!</p>
                <cfelse>
                    <p>Error inserting words.</p>
                </cfif>
            </cfif>
        </cfif>
    </body>
</html>