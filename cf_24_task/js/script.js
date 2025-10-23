$(document).ready(function () {
    $("#checkBtn").change(function () {
        const email = $("#email").val().trim();
        const msg = $("#msg");

        if (!this.checked) {
            msg.html("");
            $("#submitBtn").prop("disabled", true);
            return;
        }

        if (email === "") {
            msg.html("<span class='error'>Please enter an Email ID first.</span>");
            $(this).prop("checked", false);
            return;
        }

        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailPattern.test(email)) {
            msg.html("<span class='error'>Invalid email format. Please check again.</span>");
            $(this).prop("checked", false);
            return;
        }

        $.ajax({
            url: "subscriber.cfc?method=checkEmail",
            type: "POST",
            dataType: "json",
            data: { email: email },
            success: function (response) {
                console.log("Response:", response);
                if (response.exists) {
                    msg.html("<span class='error'>Mail ID is already there.</span>");
                    $("#submitBtn").prop("disabled", true);
                } else {
                    msg.html("<span class='success'>Email is available!</span>");
                    $("#submitBtn").prop("disabled", false);
                }
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", error);
                msg.html("<span class='error'>Error checking email.</span>");
            },
        });
    });

    $("#subscriberForm").submit(function (e) {
        e.preventDefault();

        const email = $("#email").val().trim();
        const firstName = $("#firstName").val().trim();

        $.ajax({
            url: "subscriber.cfc?method=insertSubscriber",
            type: "POST",
            dataType: "json",
            data: { email: email, firstName: firstName },
            success: function (response) {
                if (response.success) {
                    msg.html("<span class='success'>Subscriber added successfully!</span>");
                    $("#subscriberForm")[0].reset();
                    $("#submitBtn").prop("disabled", true);
                } else {
                    msg.html("<span class='error'>Error: " + response.message + "</span>");
                }
            },
            error: function () {
                msg.html("<span class='error'>Error submitting form.</span>");
            },
        });
    });

});
