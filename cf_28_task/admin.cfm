<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CMS - Admin & User</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <cfif NOT structKeyExists(session, "username")>
            <cflocation url="login.cfm">
        </cfif>
        <cfset pageAction = createObject("component", "service")>
        <cfif structKeyExists(form, "submit")>
            <cfif structKeyExists(form, "action")>
                <cfif form.action EQ "add">
                    <cfset pageAction.addPage(page_name=form.page_name, page_desc=form.page_desc)>
                <cfelseif form.action EQ "edit">
                    <cfset pageAction.editPage(id=form.id, page_name=form.page_name, page_desc=form.page_desc)>
                <cfelseif form.action EQ "delete">
                    <cfset pageAction.deletePage(id=form.id)>
                </cfif>
            </cfif>
        </cfif>

        <cfset pages = pageAction.getPages()>

        <cfoutput>
        <h1>Welcome, #session.username#! (CMS)</h1>

        <form method="post" action="" class="formClass">
            <input type="hidden" name="action" value="add">
            <label>Page Name:</label> <input class="inputClass" type="text" name="page_name" required><br>
            <label>Description:</label> <input class="inputClass" type="text" name="page_desc" required><br>
            <input type="submit" name="submit" value="Add Page">
        </form> <br><br><br>

       <cfif pages.recordCount EQ 0>
            <p>No Details to show.</p>
        <cfelse>
            <table border="1" cellpadding="6" cellspacing="0">
                <tr>
                    <th>No.</th>
                    <th>Page Name</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>

                <cfloop query="pages">
                    <tr>
                        <td>#currentrow#</td>
                        <td>#page_name#</td>
                        <td>#page_desc#</td>
                        <td>
                            <form method="post" style="display:inline;">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="#id#">
                                <input type="text" name="page_name" value="#page_name#">
                                <input type="text" name="page_desc" value="#page_desc#">
                                <input type="submit" name="submit" value="Update">
                            </form>

                            <form method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="#id#">
                                <input type="submit" name="submit" value="Delete" onclick="return confirm('Are you sure to delete this page?');">
                            </form>
                        </td>
                    </tr>
                </cfloop>
            </table>
        </cfif>
        <br><br>
        <a class="aClass" href="logout.cfm">Logout</a>
        </cfoutput>
    </body>
</html>