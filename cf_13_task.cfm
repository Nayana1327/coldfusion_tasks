<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on Word Search</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            Enter the word: <input class="inputClass" type="text" name="value" required>
            <input type="submit" name="submit" value="Search">
        </form>
        <p class="pClass">
            <cfif structKeyExists(form, "submit")>
                <cfset enteredValue = trim(form.value)>
                <cfset myString= "the quick brown fox jumps over the lazy dog">
                <cfset arrayValue = listToArray(myString, ' ')>
                <cfset wordCount = 0>
                <cfloop array= #arrayValue# index= "i">
                    <cfif i EQ enteredValue>
                        <cfset wordCount++>
                    </cfif>
                </cfloop>
                <cfoutput>
                    Found the key word in <strong>#wordCount#</strong> time - <strong>#myString#</strong>
                </cfoutput>
            </cfif>
        </p>
    </body>
</html>