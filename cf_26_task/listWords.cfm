<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Q25</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <cfset tagCloud = createObject("component", "tagCloud")>
        <cfset results = tagCloud.getWordCount()>
        <cfoutput>
            <cfloop array="#results#" index="item">
                #item.word#(#item.count#)<br>
            </cfloop>
        </cfoutput>
    </body>
</html>