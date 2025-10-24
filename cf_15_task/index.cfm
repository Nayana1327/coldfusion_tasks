<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Task on cfInvoke, cfObject, CreateObject functions</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <p class="pClass">
            <cfinvoke component="component" method="multiply" returnVariable="resultCFInvoke1">
                    <cfinvokeargument name="a" value="1">
                    <cfinvokeargument name="b" value="2">
            </cfinvoke>
            <cfinvoke component="component" method="multiply" returnVariable="resultCFInvoke2">
                <cfinvokeargument name="a" value="1">
                <cfinvokeargument name="b" value="2">
                <cfinvokeargument name="c" value="3">
            </cfinvoke>
            <cfinvoke component="component" method="multiply" returnVariable="resultCFInvoke3">
                <cfinvokeargument name="a" value="1">
                <cfinvokeargument name="b" value="2">
                <cfinvokeargument name="c" value="3">
                <cfinvokeargument name="d" value="4">
            </cfinvoke>

            <cfobject component="component" name="myComponent">
                <cfset resultCFObject1 = myComponent.multiply(a=1, b=2)>
                <cfset resultCFObject2 = myComponent.multiply(a=1, b=2, c=3)>
                <cfset resultCFObject3 = myComponent.multiply(a=1, b=2, c=3, d=4)>
            
            <cfscript>
                myComponentObject = createObject("component", "component");
                resultCFCreateObject1 = myComponentObject.multiply(a=1, b=2);
                resultCFCreateObject2 = myComponentObject.multiply(a=1, b=2, c=3);
                resultCFCreateObject3 = myComponentObject.multiply(a=1, b=2, c=3, d=4);
            </cfscript>

            <cfoutput>
                CF Invoke Tag: Multiply Result (1,2) - #resultCFInvoke1#<br>
                CF Invoke Tag: Multiply Result (1,2,3) - #resultCFInvoke2#<br>
                CF Invoke Tag: Multiply Result (1,2,3,4) - #resultCFInvoke3#<br>
                CF Object Tag: Multiply Result (1,2) - #resultCFObject1#<br>
                CF Object Tag: Multiply Result (1,2,3) - #resultCFObject2#<br>
                CF Object Tag: Multiply Result (1,2,3,4) - #resultCFObject3#<br>
                CF Create Object Function: Multiply Result: #resultCFCreateObject1#<br>
                CF Create Object Function: Multiply Result: #resultCFCreateObject2#<br>
                CF Create Object Function: Multiply Result: #resultCFCreateObject3#<br>
            </cfoutput>
        </p>
    </body>
</html>
