<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on cfswitch & cfcase Tag</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            Enter a Number: <input class="inputClass" type="number" name="number" required>
            <input type="submit" name="submit" value="Submit">
        </form>
        <cfif structKeyExists(form, "submit")>
            <cfset numberInput = val(form.number)> 
            <cfswitch expression = "#numberInput#">
                <cfcase value = "5">
                    <p class="pClass">5 is Very good</p>
                </cfcase>
                <cfcase value = "4">
                    <p class="pClass">4 is Good</p>  
                </cfcase>
                <cfcase value = "3">
                    <p class="pClass">3 is Fair</p>
                </cfcase>
                <cfcase value = "1;2" delimiters=";">
                    <p class="pClass">1 & 2 is Ok</p>
                </cfcase>
                <cfdefaultcase>
                    <p class="pClass">Invalid input. Please enter a number between 1 and 5.</p>
                </cfdefaultcase>
            </cfswitch>
        </cfif>
    </body>
</html>

