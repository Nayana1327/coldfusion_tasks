$(document).ready(function(){
  $("#registerForm").on("submit", function(e){
    e.preventDefault();
    $("#response").html("");

    const name  = $("#name").val().trim();
    const email = $("#email").val().trim();
    const username  = $("#username").val().trim();
    const password  = $("#password").val();
    const confirm_password = $("#confirm_password").val();

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const pwdRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$/;

    if(name.length < 2) return showError("Full name must be at least 2 characters.");
    if(!emailRegex.test(email)) return showError("Invalid email format.");
    if(username.length < 4) return showError("Username must be at least 4 characters.");
    if(!pwdRegex.test(password)) return showError("Password must be 8+ chars and include letters & numbers.");
    if(password !== confirm_password) return showError("Passwords do not match.");

    $.ajax({
      url: "components/user.cfc?method=registerUser",
      type: "POST",
      dataType: "json",
      data: {
        name: name,
        email: email,
        username: username,
        password: password,
        confirm_password: confirm_password
      },
      success: function(res){
        if(res.success){
          $("#response").html('<p class="success">'+res.message+'</p>');
          $("#registerForm")[0].reset();
        } else {
          $("#response").html('<p class="error">'+res.message+'</p>');
        }
      },
      error: function(){
        showError("Server error. Please try again later.");
      }
    });

    function showError(msg){
      $("#response").html('<p class="error">'+msg+'</p>');
    }
  });

});