<cfcomponent output="false">
    
    <cffunction name="init" access="public" returntype="struct" output="false">
        <cfargument name="textValue" type="string" required="true">
        <cfset var result = {}>
        <cfset newText = Replace(arguments.textValue, ".", " ", "ALL")>
        <cfset words = listToArray(trim(newText), " ")>
        <cfloop array="#words#" index="w">
            <cfif len(trim(w)) GT 2 && !isNumeric(w)>
                <cfquery datasource="CFTestDS">
                    INSERT INTO words (word)
                    VALUES (<cfqueryparam value="#w#" cfsqltype="cf_sql_varchar">)
                </cfquery>
            </cfif>
        </cfloop>
        <cfset result.success = true>
        <cfreturn result>
    </cffunction>

    <cffunction name="getWordCount" access="public" returntype="array" output="false">
        <cfset var getWords = "">
        <cfset var wordCounts = {}>
        <cfquery name="getWords" datasource="CFTestDS">
            SELECT word FROM words
        </cfquery>
        <cfloop query="getWords">
            <cfset var w = trim(getWords.word)>
            <cfset wordCounts[w] = (structKeyExists(wordCounts, w) ? wordCounts[w] + 1 : 1)>
        </cfloop>
        <cfset var wordArray = []>
        <cfloop collection="#wordCounts#" item="w">
            <cfset arrayAppend(wordArray, {
                word = w,
                count = wordCounts[w],
                length = len(w)
            })>
        </cfloop>
        <cfset arraySort(wordArray, function(a, b) {
            if (a.count NEQ b.count)
                return b.count - a.count;
            else if (a.length NEQ b.length)
                return b.length - a.length;
            else
                return compareNoCase(a.word, b.word);
        })>
        <cfreturn wordArray>
    </cffunction>
</cfcomponent>
