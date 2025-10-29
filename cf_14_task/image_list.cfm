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
            SELECT * FROM images ORDER BY id DESC
        </cfquery>
        <table>
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>Thumbnail</th>
            </tr>
            <cfoutput query="getImages">
                <tr>
                    <td align="center">#currentrow#</td>
                    <td><a href="image_details.cfm?id=#id#">#name#</a></td>
                    <td><img src="uploads/#thumbnail_path#" alt="#name#"></td>
                </tr>
            </cfoutput>
        </table>
        <a href="index.cfm" class="back-btn">⬅️ Back to Upload</a>
    </body>
</html>
