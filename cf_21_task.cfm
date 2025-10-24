<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Task on Birthday Wishes Mail</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form class="formClass" method="post" enctype="multipart/form-data">
            <label for="baby_name">Birthday Baby Name:</label>
            <input class="inputClass" type="text" name="baby_name" required placeholder="Enter Birthday Baby name"><br><br>

            <label for="email">Email Id:</label>
            <input class="inputClass" type="text" name="email_input" required placeholder="Enter Email"><br><br>

            <label for="birthday_wishes">Birthday Wishes:</label>
            <textarea class="inputClass" name="birthday_wish" rows="3" cols="20" required placeholder="Enter Birthday Wishes"></textarea><br><br>

            <label for="fileInput">Greeting Image:</label>
            <input type="file" name="fileInput" required><br><br>

            <input type="submit" name="submit" value="Upload">
        </form>

        <p class="pClass">
            <cfif structKeyExists(form, "submit")>
                <cfset emailError = "">
                <cfset uploadError = "">
                <cfset successMessage = "">
                <cfset babyName = trim(form.baby_name)>
                <cfset emailId = trim(form.email_input)>
                <cfset birthdayWish = trim(form.birthday_wish)>
                
                <cfset emailPattern = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$">
                <cfif NOT REFindNoCase(emailPattern, emailId)>
                    <cfset emailError = "Please enter a valid email address.">
                </cfif>

                <cfif structKeyExists(form, "fileInput") AND len(form.fileInput)>
                    <cfset uploadDir = expandPath("./uploads/")>
                    <cfif NOT directoryExists(uploadDir)>
                        <cfdirectory action="create" directory="#uploadDir#">
                    </cfif>
                    <cffile 
                        action="upload" 
                        filefield="fileInput" 
                        destination="#uploadDir#" 
                        nameConflict="overwrite"
                        result="uploadResult">
                            <cfset uploadedFilePath = uploadResult.serverDirectory & "/" & uploadResult.serverFile>
                    <cfelse>
                        <cfset uploadError = "Please select a greeting image to upload.">
                </cfif>

                <cfif emailError EQ "" AND uploadError EQ "">
                    <cftry>
                        <cfmail
                            from="test@test.com"
                            to="#emailId#"
                            subject="Birthday Greetings"
                            server="smtp.gmail.com"
                            port="587"
                            username="test@test.com"
                            password="xqilqyfwhjoa"
                            useTLS="true">
                            <h2>Happy Birthday, #babyName#!</h2>
                            <p>#birthdayWish#</p>
                            <p>Wishing you a wonderful day!</p>
                            <cfmailparam 
                                file="#uploadedFilePath#"
                                disposition="attachment">
                            </cfmail>
                        <cfset successMessage = "Greeting mail successfully sent to #emailId#.">
                        <cfoutput>
                                #emailError#
                                #uploadError#
                                #successMessage#
                        </cfoutput>
                    <cfcatch type="any">
                            <cfset uploadError = "Error sending email: #cfcatch.message#">
                            <cfoutput><p style="color:green;">#uploadError#</p></cfoutput>
                    </cfcatch>
                    </cftry>
                </cfif>
            </cfif>
        </p>
    </body>
</html>