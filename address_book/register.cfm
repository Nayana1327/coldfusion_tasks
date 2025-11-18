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
        <div class="navbar">
            <div class="brand">
                <img src="assets/images/logo.png" alt="Logo" class="logo">
                <span class="title">ADDRESS BOOK</span>
            </div>
            <div class="nav-links">
                <a href="register.cfm"><i class="fa fa-user" aria-hidden="true"></i> Sign Up</a>
                <a href="index.cfm"><i class="fa fa-sign-out" aria-hidden="true"></i> Login</a>
            </div>
        </div>
        <div class="login-container">
            <div class="login-box">
                <div class="login-left">
                    <img src="assets/images/logo.png" alt="logo">
                </div>
                <div class="login-right">
                    <span class="login-title">SIGN UP</span>
                    <form action="" method="post" id="registerForm">
                        <cfoutput>
                            <cfset csrfToken = CSRFGenerateToken()>
                            <input type="hidden" id="csrf_token" value="#csrfToken#">
                        </cfoutput>
                        <input type="text" name="name" id="name" placeholder="Full Name" required><br>
                        <input type="text" name="email" id="email" placeholder="Email ID" required><br>
                        <input type="text" name="username" id="username" placeholder="Username" required><br>
                        <input type="password" name="password" id="password" placeholder="Password" required><br>
                        <input type="password" name="password" id="confirm_password" placeholder="Confirm Password" required><br>
                        <input type="submit" name="register" class="login-button" value="REGISTER">
                    </form>
                    <div id="response"></div>    
                </div>
            </div>
        </div>
    </body>
</html>