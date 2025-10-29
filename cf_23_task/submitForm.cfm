<!DOCTYPE html>
<html>
    <head>
        <title>Employee Application Form</title>
    </head>
    <body>
        <cfif structKeyExists(form, "submit")>
            <cfset phoneNumber = trim(form.phonePart1) & "-" & trim(form.phonePart2) & "-" & trim(form.phonePart3)>
            <cfset salary = trim(form.salaryDollars) & "." & trim(form.salaryCents)>
            <cfset startDate = trim(form.startYear) & "-" & trim(form.startMonth) & "-" & trim(form.startDay)>
            <cfif structKeyExists(form, "resume") AND len(trim(form.resume))>
                <cfset uploadDir = expandPath("./uploads/")>
                <cfif NOT directoryExists(uploadDir)>
                    <cfdirectory action="create" directory="#uploadDir#">
                </cfif>
                <cffile 
                        action="upload" 
                        filefield="resume" 
                        destination="#uploadDir#" 
                        nameConflict="overwrite" 
                        result="uploadResult">
                <cfset resume = uploadResult.ServerFile>
            <cfelse>
                <cfset resume = "">
            </cfif>
                <cfinvoke 
                component="service"
                method="insertApplication"
                firstName="#form.firstName#"
                lastName=#form.lastName#
                email=#form.email#
                phoneNumber=#phoneNumber#
                position=#form.position#
                relocate=#form.relocate#
                startDate=#startDate#
                portfolio=#form.portfolio#
                salary=#salary#
                resume=#resume#
                />
                <cfoutput>
                    <p style="color:green;">Data saved successfully</p>
                </cfoutput>
        <cfelse>
                <cfoutput>
                    <p style="color:red;">Data Not Updated</p>
                </cfoutput>
        </cfif>
    </body>
</html>