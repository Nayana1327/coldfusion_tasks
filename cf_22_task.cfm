<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Convert JSON to Table Format</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <cfset jsonString = '[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]'>
        <cfset dataStruct = DeserializeJSON(jsonString)>

        <table border="1" cellpadding="6" cellspacing="0">
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Location</th>
            </tr>
            <cfloop array="#dataStruct#" index="row">
                <cfoutput>
                    <tr>
                        <td>#row.Name#</td>
                        <td>#row.Age#</td>
                        <td>#row.LOCATION#</td>
                    </tr>
                </cfoutput>
            </cfloop>
        </table>
    </body>
</html>
