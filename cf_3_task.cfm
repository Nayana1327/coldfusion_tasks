<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on Loop Numeric number set</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form action="" method="post" class="formClass">
            Enter Numbers: <input class="inputClass" type="text" name="numberList" placeholder="1,2,3,5" required>
            <input type="submit" name="submit" value="Submit">
        </form>
        <p class="pClass">
            <cfif structKeyExists(form, "submit")> 
                <cfset inputString = trim(form.numberList)>
                <cfset numberArray = listToArray(inputString, ',')>
                <cfloop array="#numberArray#" item="item">
                    <cfif IsNumeric(item)>
                        <cfif item MOD 3 EQ 0>
                            <cfoutput>#item#</cfoutput>
                        <cfelse>
                            <cfcontinue>
                        </cfif>
                    </cfif>
                </cfloop>
            </cfif>
        </p>
    </body>
</html>