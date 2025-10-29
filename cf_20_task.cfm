<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Task on Captcha using cfImage Tag</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <cfscript>
            function generateRandomText(length) {
                characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                captchaText = "";
                for (i = 1; i <= length; i++) {
                    captchaText &= characters[randRange(1, len(characters))];
                }
                return captchaText;
            }
            captchaValue = generateRandomText(6);

            if (!structKeyExists(session, "captcha")) {
                session.captcha = generateRandomText(6);
            }
            if (!structKeyExists(session, "PreviousCaptcha")) {
                session.PreviousCaptcha = session.captcha;
            }
           session.captcha = captchaValue;
        </cfscript>
        <form action="" method="post" class="formClass">
            Email: <input class="inputClass" type="text" name="email" required>
            Captcha:<input class="inputClass" type="text" name="captcha_input" required>
            <cfimage 
                    action="captcha" 
                    text="#captchaValue#" 
                    width="156" 
                    height="50" 
                    fontSize="24" 
                    fonts="Arial,Helvetica" 
                    difficulty="medium">
            </cfimage>
            <input type="submit" name="submit" value="Submit">
        </form>
        <p class="pClass">
            <cfif structKeyExists(form, "submit")>
                <cfset emailError = "">
                <cfset captchaError = "">
                <cfset successMessage = "">
                <cfset emailPattern = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$">
                <cfif NOT REFindNoCase(emailPattern, trim(form.email))>
                    <cfset emailError = "Please enter a valid email address.">
                </cfif>
                <cfif trim(form.captcha_input) NEQ session.PreviousCaptcha>
                    <cfset captchaError = "Incorrect CAPTCHA. Please try again.">
                    <cfset session.PreviousCaptcha = session.captcha>
                    <cfset session.captcha = generateRandomText(6)>
                </cfif>
                <cfif emailError EQ "" AND captchaError EQ "">
                    <cfset successMessage = "Email Address successfully subscribed to our newsletter!">
                    <cfset structDelete(session, "captcha")>
                    <cfset structDelete(session, "PreviousCaptcha")>
                </cfif>
                <cfoutput>
                    #emailError#
                    #captchaError#
                    #successMessage#
                </cfoutput>
            </cfif>
        </p>
    </body>
</html>



