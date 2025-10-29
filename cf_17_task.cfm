<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Task on JS Validation</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form action="" method="post" class="formClass" onsubmit="return validateForm();">
            Enter a number: <input class="inputClass" type="text" name="numberInput" id="numberInput" required>
            <input type="submit" name="submit" value="Submit">
        </form>
        <p class="pClass">
            <cfif structKeyExists(form, "submit")>
                <cfset numberValue = int(trim(form.numberInput))>
                <cfloop index="i" from="1" to="#numberValue#">
                    <cfif i MOD 2 EQ 0>
                        <cfoutput><span style="color:green;">#i#</span>&nbsp;</cfoutput>
                    <cfelse>
                        <cfoutput><span style="color:blue;">#i#</span>&nbsp;</cfoutput>
                    </cfif>
                </cfloop>
            </cfif>
        </p>
        <script>
            function validateForm() {
                var num = document.getElementById("numberInput").value;
                if (!num || isNaN(num) || num <= 0) {
                    alert("Please enter a valid positive number.");
                    return false;
                } 
                return true;
            }
        </script>
    </body>
</html>
