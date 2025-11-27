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
                    <button data-open="createContactModal" class="create-btn">CREATE CONTACT</button>
                </div>
                <div class="contact-box">
                    <div class="contact-header">
                        <div class="h-img"></div>
                        <div class="h-name">Name</div>
                        <div class="h-email">Email ID</div>
                        <div class="h-phone">Phone Number</div>
                        <div class="h-actions"></div>
                    </div>
                    <div id="contactList"></div>
                </div>
            </div>
        </div>
        <div id="createContactModal" class="modal-overlay" aria-hidden="true">
            <form id="createContactForm" enctype="multipart/form-data" class="modal-card" role="dialog" aria-modal="true">
                <button class="modal-close" data-close="createContactModal">&times;</button>
                <div class="modal-left">
                    <div class="modal-header">
                        <h2>CREATE CONTACT</h2>
                    </div>
                    <div class="modal-content">
                        <h3 class="section-title">Personal Contact</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Title *</label>
                                <select name="title" id="title" required>
                                    <option>-</option>
                                    <option>Mr.</option>
                                    <option>Ms.</option>
                                    <option>Mrs.</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>First Name *</label>
                                <input type="text" name="first_name" id="first_name" placeholder="Your First Name" required>
                            </div>
                            <div class="form-group">
                                <label>Last Name *</label>
                                <input type="text" name="last_name" id="last_name" placeholder="Your Last Name" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Gender *</label>
                                <select name="gender" id="gender" required>
                                    <option>-</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Date Of Birth *</label>
                                <input type="date" name="dob" id="dob" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Upload Photo</label>
                                <input type="file" name="photo" id="photo">
                            </div>
                        </div>
                        <h3 class="section-title">Contact Details</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Address *</label>
                                <input type="text" name="address" id="address" placeholder="Your Address" required>
                            </div>
                            <div class="form-group">
                                <label>Street *</label>
                                <input type="text" name="street" id="street" placeholder="Your Street Name" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>City *</label>
                                <input type="text" name="city" id="city" placeholder="Your City" required>
                            </div>
                            <div class="form-group">
                                <label>State *</label>
                                <input type="text" name="state" id="state" placeholder="Your State" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>ZIP *</label>
                                <input type="text" name="zip" id="zip" placeholder="ZIP" required>
                            </div>
                            <div class="form-group">
                                <label>Phone *</label>
                                <input type="text" name="phone" id="phone" placeholder="Phone" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Email *</label>
                                <input type="email" name="email" id="email" placeholder="Email" required>
                            </div>
                        </div>
                        <div id="response"></div>
                        <div class="form-actions">
                            <button type="button" class="btn-secondary" data-close="createContactModal">Cancel</button>
                            <button type="submit" class="btn-primary" id="saveContactBtn">Save Contact</button>
                        </div>
                    </div>
                </div>
                <div class="modal-right">
                    <div class="avatar-box">
                        <img src="assets/images/user.png" alt="avatar">
                    </div>
                </div>
            </form>
        </div>
        <div id="viewContactModal" class="modal-overlay" aria-hidden="true">
            <div class="modal-left">
                <div class="modal-header">
                    <h2>CONTACT DETAILS</h2>
                </div>
                <div class="modal-content">
                    <table class="details-table">
                        <tr><td class="label">Name</td><td>:</td><td id="vc_name"></td></tr>
                        <tr><td class="label">Gender</td><td>:</td><td id="vc_gender"></td></tr>
                        <tr><td class="label">Date of Birth</td><td>:</td><td id="vc_dob"></td></tr>
                        <tr><td class="label">Address</td><td>:</td><td id="vc_address"></td></tr>
                        <tr><td class="label">Pincode</td><td>:</td><td id="vc_zip"></td></tr>
                        <tr><td class="label">Email ID</td><td>:</td><td id="vc_email"></td></tr>
                        <tr><td class="label">Phone</td><td>:</td><td id="vc_phone"></td></tr>
                    </table>
                    <div class="form-actions">
                        <button class="modal-close" onclick="closeViewModal()">CLOSE</button>
                    </div>
                </div>
                <div class="modal-right">
                    <div class="avatar-box">
                        <img id="vc_photo" class="modal-photo">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>