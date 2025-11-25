$(document).ready(function () {
  $("#registerForm").on("submit", function (e) {
    e.preventDefault();
    $("#response").html("");

    const name = $("#name").val().trim();
    const email = $("#email").val().trim();
    const username = $("#username").val().trim();
    const password = $("#password").val();
    const confirm_password = $("#confirm_password").val();

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const pwdRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$/;

    if (name.length < 2)
      return showError("Full name must be at least 2 characters.");
    if (!emailRegex.test(email)) return showError("Invalid email format.");
    if (username.length < 4)
      return showError("Username must be at least 4 characters.");
    if (!pwdRegex.test(password))
      return showError(
        "Password must be 8+ chars and include letters & numbers."
      );
    if (password !== confirm_password)
      return showError("Passwords do not match.");

    $.ajax({
      url: "components/user.cfc?method=registerUser",
      type: "POST",
      dataType: "json",
      data: {
        name: name,
        email: email,
        username: username,
        password: password,
        confirm_password: confirm_password,
        csrf_token: $("#csrf_token").val(),
      },
      success: function (res) {
        if (res.success) {
          $("#response").html('<p class="success">' + res.message + "</p>");
          $("#registerForm")[0].reset();
        } else {
          $("#response").html('<p class="error">' + res.message + "</p>");
        }
      },
      error: function () {
        showError("Server error. Please try again later.");
      },
    });

    function showError(msg) {
      $("#response").html('<div class="response-box">' + msg + "</div>");
    }
  });

  $("#loginForm").on("submit", function (e) {
    e.preventDefault();
    $("#response").html("");

    const username = $("#username").val().trim();
    const password = $("#password").val();

    if (username.length < 4)
      return showError("Username must be at least 4 characters.");
    if (password.length < 8)
      return showError("Password must be at least 8 characters.");

    $.ajax({
      url: "components/user.cfc?method=loginUser",
      type: "POST",
      dataType: "json",
      data: {
        username: username,
        password: password,
        csrf_token: $("#csrf_token").val(),
      },
      success: function (res) {
        if (res.success) {
          $("#response").html('<p class="success">' + res.message + "</p>");
          window.location.href = "userProfile.cfm";
        } else {
          showError(res.message);
        }
      },
      error: function () {
        showError("Server error. Please try again later.");
      },
    });

    function showError(msg) {
      $("#response").html('<div class="response-box">' + msg + "</div>");
    }
  });

  $("#createContactForm").on("submit", function (e) {
    e.preventDefault();
    $("#response").html("");

    const title = $("#title").val().trim();
    const first_name = $("#first_name").val().trim();
    const last_name = $("#last_name").val().trim();
    const gender = $("#gender").val().trim();
    const dob = $("#dob").val().trim();
    const address = $("#address").val().trim();
    const street = $("#street").val().trim();
    const city = $("#city").val().trim();
    const state = $("#state").val().trim();
    const zip = $("#zip").val().trim();
    const phone = $("#phone").val().trim();
    const contact_email = $("#email").val().trim();

    if (title === "-") return showError("Please select a title.");
    if (!first_name) return showError("First name is required.");
    if (!last_name) return showError("Last name is required.");
    if (gender === "-") return showError("Please select a gender.");
    if (!dob) return showError("Date of birth is required.");
    if (!address) return showError("Address is required.");
    if (!street) return showError("Street is required.");
    if (!city) return showError("City is required.");
    if (!state) return showError("State is required.");
    if (!zip) return showError("ZIP code is required.");
    if (!/^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$/.test(zip)) return showError("Enter a valid ZIP code.");
    if (!phone) return showError("Phone number is required.");
    if (!/^[6-9][0-9]{9}$/.test(phone))
      return showError("Enter a valid phone number.");
    if (!contact_email) return showError("Email is required.");
    if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(contact_email))
      return showError("Enter a valid email address.");

    const fd = new FormData(this);
    $.ajax({
      url: "components/contact.cfc?method=createContact",
      method: "POST",
      data: fd,
      contentType: false,
      processData: false,
      success: function (res) {
        if (res.success) {
          $("#response").html(
            "<p class='success'>Contact Saved Successfully!</p>"
          );
          $("#createContactForm")[0].reset();
        } else {
          $("#response").html("<p class='error'>" + res.message + "</p>");
        }
      },
    });

    function showError(msg) {
      $("#response").html('<div class="response-box error">' + msg + "</div>");
    }
  });
});

document.addEventListener("click", function (e) {
  if (e.target.matches("[data-open]")) {
    const id = e.target.getAttribute("data-open");
    document.getElementById(id).classList.add("show");
  }

  if (e.target.matches("[data-close]")) {
    const id = e.target.getAttribute("data-close");
    document.getElementById(id).classList.remove("show");
  }
});
