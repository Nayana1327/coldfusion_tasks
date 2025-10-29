<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Task on Image & Thumbnail</title>
        <link rel="stylesheet" href="../assets/style.css">
    </head>
    <body>
        <cfquery name="getImages" datasource="CFTestDS">
            SELECT * FROM images  WHERE id = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Full Size Image</th>
                <th>Thumbnail</th>
            </tr>
            <cfoutput query="getImages">
                <tr>
                    <td align="center">#currentrow#</td>
                    <td>#name#</td>
                    <td>#description#</td>
                    <td><img src="uploads/#image_path#" alt="#name#"></td>
                    <td><img class="thumbnail" src="uploads/#thumbnail_path#" alt="#name#"></td>
                </tr>
            </cfoutput>
        </table>
        <a href="image_list.cfm" class="back-btn">⬅️ Back to Image List</a>
    </body>
</html>

