<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employment Application</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="js/validate.js"></script>
</head>
<body>
    <div class="form-container">
        <header class="form-header">
            <img src="images/wufoo.png" alt="Wufoo by SurveyMonkey Logo" class="wufoo-logo">
        </header>

        <form action="submitForm.cfm" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">

            <h1>Employment Application</h1>
            <p class="company-name">Infinity Box Inc.</p>
            <hr>

            <div class="form-group highlight">
                <label for="position">Which position are you applying for? <span class="required">*</span></label>
                <select id="position" name="position">
                    <option value="">- Select -</option>
                    <option value="Interface Designer">Interface Designer</option>
                    <option value="Software Engineer">Software Engineer</option>
                    <option value="Office Administrator">Office Administrator</option>
                    <option value="Office Manager">Office Manager</option>
                </select>
            </div>

            <div class="form-group">
                <label>Are you willing to relocate? <span class="required">*</span></label>
                <div class="radio-group">
                    <input type="radio" id="relocateYes" name="relocate" value="Yes">Yes
                    <input type="radio" id="relocateNo" name="relocate" value="No"> No 
                </div>
            </div>

            <div class="form-group date-field">
                <label>When can you start? <span class="required">*</span></label>
                <div class="date-group">
                    <input type="text" id="startDay" name="startDay" placeholder="DD" maxlength="2">
                    <span>/</span>
                    <input type="text" id="startMonth" name="startMonth" placeholder="MM" maxlength="2">
                    <span>/</span>
                    <input type="text" id="startYear" name="startYear" placeholder="YYYY" maxlength="4">
                    <input type="text" id="datePickerTarget" style="display:none;">
                    <button type="button" class="calendar-icon" id="calendarTrigger">📅</button>
                </div>
            </div>

            <div class="form-group">
                <label for="portfolio">Portfolio Web Site</label>
                <input type="text" id="portfolio" name="portfolio" value="http://" class="full-width">
            </div>

            <div class="form-group">
                <label for="resume">Attach a Copy of Your Resume</label>
                <div class="file-upload-wrapper">
                    <input type="file" id="resume" name="resume">
                </div>
                <p class="file-info">Word or PDF Documents Only</p>
            </div>

            <div class="form-group">
                <label>Salary Requirements</label>
                <div class="salary-group">
                    <span>$</span>
                    <div class="input-and-label">
                        <input type="number" id="salaryDollars" name="salaryDollars" class="salary-input dollars" min="0"> 
                        <span class="currency-label">Dollars</span>
                    </div>
                    <span>.</span>
                    <div class="input-and-label">
                        <input type="number" id="salaryCents" name="salaryCents" class="salary-input cents" min="0">
                        <span class="currency-label">Cents</span>
                    </div>
                </div>
            </div>

            <hr>
            <h2>Your Contact Information</h2>

            <div class="form-group">
                <label for="fullName">Name <span class="required">*</span></label>
                <div class="name-group">
                    <div class="input-and-label">
                        <input type="text" id="firstName" name="firstName">
                        <span class="currency-label">First</span>
                    </div>
                    <div class="input-and-label">
                        <input type="text" id="lastName" name="lastName">
                        <span class="currency-label">Last</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email Address <span class="required">*</span></label>
                <input type="text" id="email" name="email" class="full-width">
            </div>

            <div class="form-group">
                <label for="phone">Phone <span class="required">*</span></label>
                <div class="phone-group">
                    <div class="input-and-label">
                        <input type="text" id="phonePart1" name="phonePart1" maxlength="3">
                        <span class="currency-label">###</span>
                    </div>
                    <div class="input-and-label">
                        <input type="text" id="phonePart2" name="phonePart2" maxlength="3"> 
                        <span class="currency-label">###</span>
                    </div>
                    <div class="input-and-label">
                        <input type="text" id="phonePart3" name="phonePart3" maxlength="4">
                        <span class="currency-label">####</span>
                    </div>
                </div>
            </div>
                <input type="submit" name="submit" value="Submit" class="submit-button">
        </form>
    </div>
</body>
</html>