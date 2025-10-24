<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Q 26</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <form class="formClass" action="" enctype="multipart/form-data" method="post">
            <input type="file"  name="txtFile" required><br><br>
            <input type="submit" name="submit" value="Submit">
        </form>

        <cfif structKeyExists(form, "submit")> 
            <cfif structKeyExists(form, "txtFile") AND len(form.txtFile) GT 0>
                <cfset uploadDir = expandPath("./uploads/")>
                    <cfif NOT directoryExists(uploadDir)>
                        <cfdirectory action="create" directory="#uploadDir#">
                    </cfif>
                <cffile 
                    action="upload" 
                    filefield="txtFile" 
                    destination="#uploadDir#" 
                    nameConflict="overwrite" 
                    result="uploadResult">
                <cfset uploadedFilePath = uploadResult.ServerDirectory & "/" & uploadResult.ServerFile>
                <cffile action="read"
                    file="#uploadedFilePath#"
                    variable="fileContent">
                <cfset textValue = trim(fileContent)>
                <cfinvoke 
                    component="tagCloud"
                    method="init"
                    returnVariable="result"
                    textValue="#textValue#">
                <cfif structKeyExists(result, "success") AND result.success>
                    <p>Text File Words inserted successfully!</p>
                <cfelse>
                    <p>Error inserting words.</p>
                </cfif>
            </cfif>
        </cfif>
    </body>
</html>