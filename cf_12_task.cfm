<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on DB Insert-Random 10 rows</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            Enter Number: <input class="formClass" type="number" name="numberValue" required><br><br>
            <input type="submit" name="submit" value="Proceed">
        </form>
        <cfif structKeyExists(form, "submit")>
            <cfset numberInput = val(trim(form.numberValue))>
            <cfif numberInput GT 10>
                <p class="pClass">Invalid Entry please try number below 10</p>
            <cfelse>
                <cfquery name="getUsers" datasource="CFTestDS">
                    SELECT * FROM users ORDER BY firstname ASC
                </cfquery>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>FirstName</th>
                            <th>LastName</th>
                        </tr>
                        <cfoutput query="getUsers">
                            <tr>
                                <td>#currentRow#</td>
                                <td>#firstname#</td>
                                <td>#lastname#</td>
                            </tr>
                        </cfoutput>
                    </table>
                <cfset nRowValue = QueryGetRow(getUsers, numberInput)> 
                <cfoutput>
                    First Name of #numberInput# row is #nRowValue.firstname#
                </cfoutput>
            </cfif>
        </cfif>
    </body>
</html>

