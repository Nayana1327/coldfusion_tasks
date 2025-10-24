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
            <cfset minFont = 20>
            <cfset maxFont = 35>
            <cfset colors = ["red", "green", "blue", "orange", "purple", "brown"]>

            <cfset counts = arrayMap(wordQuery, function(item) { return item.count; })>
            <cfset minCount = arrayMin(counts)>
            <cfset maxCount = arrayMax(counts)>

            <cfoutput>
                <cfloop array="#wordQuery#" index="item">
                    <cfset fontSize = minFont>
                    <cfif maxCount NEQ minCount>
                        <cfset fontSize = minFont + (item.count - minCount) * (maxFont - minFont) / (maxCount - minCount)>
                    </cfif>

                    <cfset colorIndex = (item.count MOD arrayLen(colors)) + 1>
                    <cfset color = colors[colorIndex]>

                    <span style="font-size:#fontSize#px; color:#color#; margin:2px;">
                        #item.word# (#item.count#)<br>
                    </span>
                </cfloop>
            </cfoutput>
        </cfif>
    </body>
</html>