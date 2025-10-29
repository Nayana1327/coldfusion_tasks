<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on Multiply with cfFunction</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <p class="pClass">
            <cffunction name="multiply" returntype="numeric" access="public">
                <cfset var result = 1>
                <cfloop collection = #arguments# item="key">
                    <cfset result = result * arguments[key]>
                </cfloop>
                <cfreturn result>
            </cffunction>
            <cfset res = multiply(1,2)>
                <cfdump var="#res#"></br>
            <cfset res = multiply(1,2,3)>
                <cfdump var="#res#"></br>
            <cfset res = multiply(1,2,3,4)>
                <cfdump var="#res#"><br>
        </p>
    </body>
</html>