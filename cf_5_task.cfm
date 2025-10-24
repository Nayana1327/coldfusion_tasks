<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task User & Mother DOB</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <form class="formClass" action="" method="post">
            User DOB: <input class="inputClass" type="date" name="user_dob" required>
            Mother DOB: <input class="inputClass" type="date" name="mother_dob" required>
            <input type="submit" name="submit" value="Submit">
        </form>

        <cfif structKeyExists(form, "submit")>
            <cfset userDOB = form.user_dob>
            <cfset motherDOB = form.mother_dob>

            <cfset userAge = DateDiff("yyyy", userDOB, now())>
            <cfset motherAge = DateDiff("yyyy", motherDOB, now())>
            <cfset todayDate=now()>
            <cfset ageAtMotherDelivered = Abs(userAge - motherAge)>

            <cfset thisYearBirthdayUser = createDate(year(todayDate), month(userDOB), day(userDOB))>
            
            <cfif thisYearBirthdayUser LT todayDate>
                <cfset nextBirthdayUser = createDate(year(todayDate) + 1, month(userDOB), day(userDOB))>
            <cfelse>
                <cfset nextBirthdayUser = thisYearBirthdayUser>
            </cfif>
            <cfset daysRemainingUserBirthday = dateDiff("d", todayDate, nextBirthdayUser)>

            <cfset thisYearBirthdayMother = createDate(year(todayDate), month(motherDOB), day(motherDOB))>
                <cfif thisYearBirthdayMother LT todayDate> 
                    <cfset nextBirthdayMother = createDate(year(todayDate) + 1, month(motherDOB), day(motherDOB))>
                <cfelse>
                    <cfset nextBirthdayMother = thisYearBirthdayMother>
                </cfif>
            <cfset daysRemainingMotherBirthday = dateDiff("d", todayDate, nextBirthdayMother)>

            <cfoutput>
                User Age: #userAge# <br><br>
                Mother Age: #motherAge# <br><br>
                Mother age where she delivered the baby : #ageAtMotherDelivered# <br><br>
                Days Remaining for User Birthday: <strong>#daysRemainingUserBirthday#</strong> days<br><br>
                Days Remaining for Mother Birthday: <strong>#daysRemainingMotherBirthday#</strong> days
            </cfoutput>
        </cfif>
    </body>
</html>