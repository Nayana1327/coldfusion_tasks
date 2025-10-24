<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on Image & Thumbnail</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form class="formClass" method="post" enctype="multipart/form-data">
            <label for="name">Name:</label>
            <input class="inputClass" type="text" name="name" required placeholder="Enter image name">

            <label for="description">Description:</label>
            <textarea class="inputClass" name="description" rows="3" cols="20" required placeholder="Enter image description"></textarea>

            <label for="fileInput">Select Image:</label>
            <input class="inputClass" type="file" name="fileInput" required>

            <input type="submit" name="submitButton" value="Upload">
            <a href="image_list.cfm">View Uploaded Images</a>
        </form>

        <cfif structKeyExists(form, "submitButton")>
            <cfset uploadDir = expandPath("./uploads/")>
            <cfif NOT directoryExists(uploadDir)>
                <cfdirectory action="create" directory="#uploadDir#">
            </cfif>
            <cfset allowedExtensions = "jpg,jpeg,png,gif">
            <cfset maxFileSize = 1024 * 1024>
            <cffile 
                action="upload" 
                filefield="fileInput" 
                destination="#uploadDir#" 
                nameConflict="overwrite" 
                result="uploadResult">

            <cfset fileUploadOk = 0>
            <cfset message = "">
            <cfif uploadResult.FileSize GT maxFileSize>
                <cffile action="delete" file="#uploadResult.ServerDirectory#/#uploadResult.ServerFile#">
                <cfset fileUploadOk = 1>
                <cfset message = "File too large! Maximum allowed size is 1 MB.">
                <cfoutput>#message#</cfoutput>
            </cfif>
            <cfif NOT listFindNoCase(allowedExtensions, uploadResult.ClientFileExt)>
                <cffile action="delete" file="#uploadResult.ServerDirectory#/#uploadResult.ServerFile#">
                <cfset fileUploadOk = 1>
                <cfset message = "Invalid file type! Only JPG, PNG, GIF allowed.">
                <cfoutput>#message#</cfoutput>
            </cfif>
            <cfif fileUploadOk EQ 0>
                <cfset thumbFile = "thumb_" & uploadResult.serverFile>
                <cfset thumbPath = uploadDir & thumbFile>
                <cfimage 
                    action="resize" 
                    source="#uploadResult.serverDirectory#/#uploadResult.serverFile#" 
                    destination="#thumbPath#" 
                    width="20" 
                    height="20"
                    overwrite="yes">

                <cfquery datasource="CFTestDS">
                    INSERT INTO images (name, description, image_path, thumbnail_path)
                    VALUES (
                        <cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.description#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#uploadResult.serverFile#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#thumbFile#" cfsqltype="cf_sql_varchar">
                    )
                </cfquery>
                <div class="success">Image uploaded successfully!</div>
            </cfif>
        </cfif>
    </body>
</html>

