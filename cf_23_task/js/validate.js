$(function() {
    $("#datePickerTarget").datepicker({
        dateFormat: 'dd/mm/yy',
        onSelect: function(dateText) {
            const parts = dateText.split('/');
            $('#startDay').val(parts[0]);
            $('#startMonth').val(parts[1]);
            $('#startYear').val(parts[2]);
            $(this).datepicker('hide');
        }
    });

    $('#calendarTrigger').on('click', function() {
        $('#datePickerTarget').datepicker('show');
    });
});


function validateForm() {
    let valid = true;
    let messages = [];

    if ($('#position').val() === '') {
        valid = false;
        messages.push("Please select a position.");
    }

    if (!$('input[name="relocate"]:checked').val()) {
        valid = false;
        messages.push("Please indicate if you are willing to relocate.");
    }

    let day = $('#startDay').val().trim();
    let month = $('#startMonth').val().trim();
    let year = $('#startYear').val().trim();
    if (day === '' || month === '' || year === '') {
        valid = false;
        messages.push("Please complete the start date.");
    } else if (isNaN(day) || isNaN(month) || isNaN(year)) {
        valid = false;
        messages.push("Start date must contain numbers only.");
    }

    if ($('#firstName').val().trim() === '' || $('#lastName').val().trim() === '') {
        valid = false;
        messages.push("Please enter your full name.");
    }

    let email = $('#email').val().trim();
    let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === '' || !emailRegex.test(email)) {
        valid = false;
        messages.push("Please enter a valid email address.");
    }

    if (
        $('#phonePart1').val().trim().length !== 3 ||
        $('#phonePart2').val().trim().length !== 3 ||
        $('#phonePart3').val().trim().length !== 4
    ) {
        valid = false;
        messages.push("Please enter a valid phone number (###-###-####).");
    }

    let resume = $('#resume').val();
    if (resume && !resume.match(/\.(pdf|doc|docx)$/i)) {
        valid = false;
        messages.push("Resume must be a PDF, DOC, or DOCX file.");
    }

    if (!valid) {
        alert(messages.join('\n'));
    }

    return valid;
}
