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
        <cfset wordQuery = tagCloud.getWordCount()>

        <cfif arrayLen(wordQuery) EQ 0>
            <p>No words to display.</p>
        <cfelse>
            <cfset count = 0>
            <cfset fontSize = 25>
            <cfset colors = ["red", "green", "blue", "orange", "purple", "brown"]>
            <cfoutput>
                <cfloop array="#wordQuery#" index="item">
                    <cfif item.count NEQ count>
                        <cfset count = item.count>
                        <cfset fontSize = fontSize - 3>
                        <cfset fontColor = colors[randRange(1, arrayLen(colors))]>
                    </cfif>
                    <span style="font-size:#fontSize#px; color:#fontColor#; margin:2px;">
                        #item.word# (#item.count#)<br>
                    </span>
                </cfloop>
            </cfoutput>
        </cfif>
    </body>
</html>