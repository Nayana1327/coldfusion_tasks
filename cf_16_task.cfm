<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Task on Pattern</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <p class="pClass">
            <cfloop index="i" from="1" to="3"> 
                <cfloop index="j" from="0" to="2">
                    <cfoutput> #(i + (j * 3))#&nbsp;</cfoutput>
                </cfloop>
                <br>
            </cfloop>
        </p>
    </body>
</html>