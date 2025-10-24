<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Task on Query Insertion</title>
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <cfscript>
            myQuery = QueryNew("ID, Name, Email", "integer, varchar, varchar");
            QueryAddRow(myQuery, 3); 
                
            QuerySetCell(myQuery, "ID", 1, 1);
            QuerySetCell(myQuery, "Name", "Alice", 1);
            QuerySetCell(myQuery, "Email", "alice@example.com", 1);

            QuerySetCell(myQuery, "ID", 2, 2);
            QuerySetCell(myQuery, "Name", "Bob", 2);
            QuerySetCell(myQuery, "Email", "bob@example.com", 2);

            QuerySetCell(myQuery, "ID", 3, 3);
            QuerySetCell(myQuery, "Name", "Charlie", 3);
            QuerySetCell(myQuery, "Email", "charlie@example.com", 3);

            writeDump(myQuery);
        </cfscript>
    </body>
</html>
