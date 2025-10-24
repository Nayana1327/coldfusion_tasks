<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on Dates</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <cfset todayDate=now()>
        <cfset currentDateFormatted = dateFormat(todayDate, 'yyyy-mm-dd')>
        <cfset currentMonthNumeric = month(todayDate)>
        <cfset currentMonthWord = dateFormat(todayDate, 'mmmm')>
        <cfset firstOfNextMonth = createDate(year(todayDate), month(todayDate) + 1, 1)>
        <cfset lastDayOfMonth = dateAdd("d", -1, firstOfNextMonth)>
        <cfset lastDayOfMonthString = dayOfWeekAsString(dayOfWeek(lastDayOfMonth))>
        
        <cfset dayOfWeekToday = DayOfWeek(todayDate)>
        <cfset daysToSubtract = 0>
            <cfif dayOfWeekToday EQ 7>  
                <cfset daysToSubtract = 1>
            <cfelseif dayOfWeekToday EQ 6>  
                <cfset daysToSubtract = 0>
            <cfelseif dayOfWeekToday EQ 5>  
                <cfset daysToSubtract = 6>
            <cfelseif dayOfWeekToday EQ 4> 
                <cfset daysToSubtract = 5>
            <cfelseif dayOfWeekToday EQ 3>  
                <cfset daysToSubtract = 4>
            <cfelseif dayOfWeekToday EQ 2>  
                <cfset daysToSubtract = 3>
            <cfelseif dayOfWeekToday EQ 1> 
                <cfset daysToSubtract = 2>
            </cfif>
        <cfset lastFriday = dateAdd("d", -daysToSubtract, todayDate)>
        <cfset lastFridayFormatted = dateFormat(lastFriday, 'yyyy-mm-dd')>
        
            <cfoutput> 
                Current Date : #currentDateFormatted# <br><br>
                Current Month Numeric : #currentMonthNumeric# <br><br>
                Current Month Word : #currentMonthWord# <br><br>
                Last day of the Month : #lastDayOfMonthString# <br><br>
                Last Friday Date : #lastFridayFormatted# <br><br>
            </cfoutput>

        <!-- last 5 days -->
        <cfloop from="1" to="5" index="i">
           
            <cfset pastDate = dateAdd("d", -i, todayDate)>
            <cfset displayDate = dateFormat(pastDate, "dd-mmm-yyyy")>
            <cfset displayDay  = dayOfWeekAsString(dayOfWeek(pastDate))>
            
            <cfswitch expression="#displayDay#">
                <cfcase value="Sunday">
                    <cfset style = "color:red;">
                </cfcase>
                <cfcase value="Monday">
                    <cfset style = "color:green;">
                </cfcase>
                <cfcase value="Tuesday">
                    <cfset style = "color:orange;">
                </cfcase>
                <cfcase value="Wednesday">
                    <cfset style = "color:yellow;">
                </cfcase>
                <cfcase value="Thursday">
                    <cfset style = "color:black;font-weight: bold;">
                </cfcase>
                <cfcase value="Friday">
                    <cfset style = "color:blue;">
                </cfcase>
                <cfcase value="Saturday">
                    <cfset style = "color:red; font-weight:bold;">
                </cfcase>
            </cfswitch>
            <cfoutput>
                <div style="#style#">
                    #displayDate# - #displayDay#
                </div>
            </cfoutput>
        </cfloop>
    </body>
</html>





