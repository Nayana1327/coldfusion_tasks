<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on cfif Tag</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form action="" method="post" class="formClass">
            Enter a number: <input type="number" name="number" required class="inputClass">
            <input type="submit" name="submit" value="Submit">
        </form>

        <cfif structKeyExists(form, "submit")> 
            <cfset numberInput = val(form.number)>
            <cfif numberInput EQ 5>
                <p class="pClass">5 is Very good</p>
            <cfelseif numberInput EQ 4>
                <p class="pClass">4 is Good</p>
            <cfelseif numberInput EQ 3>
                <p class="pClass">3 is Fair</p>
            <cfelseif numberInput EQ 2 OR numberInput EQ 1>
                <p class="pClass">1 & 2 is Ok</p>
            <cfelse>
                <p class="pClass">Invalid input. Please enter a number between 1 and 5.</p>
            </cfif>
        </cfif>

    </body>
</html>