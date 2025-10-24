<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscribers Form</title>
    <link rel="stylesheet" href="css/style.css">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/script.js"></script>
</head>
<body>
    <form id="subscriberForm" class="formClass">
        <label>Email ID</label>
        <input type="text" id="email" name="email" class="inputClass">
        <input type="checkbox" id="checkBtn" name="checkBtn"> <label>Check Email</label>
        <br><br>
        <label>First Name</label>
        <input type="text" id="firstName" name="firstName" class="inputClass" required>
        <br><br>
        <input type="submit" name="submit" id="submitBtn" value="Submit" disabled>
    </form>
    <div class="message" id="msg"></div>
</body>
</html>