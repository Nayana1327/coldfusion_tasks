<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Address Book</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="assets/js/script.js"></script>
    </head>
    <body>
        <cfif NOT structKeyExists(session, "username")>
            <cflocation url="index.cfm">
        </cfif>
        <div class="navbar">
            <div class="brand">
                <img src="assets/images/logo.png" alt="Logo" class="logo">
                <span class="title">ADDRESS BOOK</span>
            </div>
            <div class="nav-links">
                <a href="index.cfm"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
            </div>
        </div>
        <div class="user-container">
            <div class="top-bar">
                <div class="top-icons">
                    <i class="fa-solid fa-file-pdf" style="color:red;"></i>
                    <i class="fa-solid fa-file-excel" style="color:green;"></i>
                    <i class="fa-solid fa-print" style="color:grey;"></i>
                </div>
            </div>
            <div class="center-row">
                <div class="user-box">
                    <img src="assets/images/user.png" class="user-img">
                    <div class="username">
                        <cfoutput>#encodeForHTML(session.username)#</cfoutput>
                    </div>
                    <button class="create-btn">CREATE CONTACT</button>
                </div>
                <div class="contact-box" id="contactList">
                </div>
            </div>
        </div>
    </body>
</html>