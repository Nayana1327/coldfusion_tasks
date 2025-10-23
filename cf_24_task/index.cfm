<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscribers Form</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form id="subscriberForm" class="formClass">
        <label>Email ID</label>
        <div class="email-check">
            <input type="text" id="email" name="email">
            <input type="checkbox" id="checkBtn" name="checkBtn">
        </div>
        <label>First Name</label>
        <input type="text" id="firstName" name="firstName" required>
        <input type="submit" name="submit" id="submitBtn" value="Submit" disabled>
    </form>
    <div class="message" id="msg"></div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>