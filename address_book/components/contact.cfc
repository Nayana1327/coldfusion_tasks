<cfcomponent output="false">

    <cffunction name="createContact" access="remote" returntype="struct" returnformat="json">
        <cfargument name="title" type="string" required="true">
        <cfargument name="first_name" type="string" required="true">
        <cfargument name="last_name" type="string" required="true">
        <cfargument name="gender" type="string" required="true">
        <cfargument name="dob" required="true">
        <cfargument name="address" type="string" required="true">
        <cfargument name="street" type="string" required="true">
        <cfargument name="city" type="string" required="true">
        <cfargument name="state" type="string" required="true">
        <cfargument name="zip" type="string" required="true">
        <cfargument name="phone" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="photo" type="string" required="false">

        <cfset var result = { "success" = false, "message" = "" }>

        <cfif NOT structKeyExists(session, "userID") OR session.userID EQ "">
            <cfset result.message = "User not logged in.">
            <cfreturn result>
        </cfif>

        <cfset title      = trim(encodeForHTML(arguments.title))>
        <cfset first_name = trim(encodeForHTML(arguments.first_name))>
        <cfset last_name  = trim(encodeForHTML(arguments.last_name))>
        <cfset gender     = trim(encodeForHTML(arguments.gender))>
        <cfset dobValue   = trim(arguments.dob)>
        <cfset address    = trim(encodeForHTML(arguments.address))>
        <cfset street     = trim(encodeForHTML(arguments.street))>
        <cfset city       = trim(encodeForHTML(arguments.city))>
        <cfset state      = trim(encodeForHTML(arguments.state))>
        <cfset zip        = trim(encodeForHTML(arguments.zip))>
        <cfset phone      = trim(encodeForHTML(arguments.phone))>
        <cfset emailAddr     = trim(encodeForHTML(arguments.email))>

        <cfif title EQ "" OR title EQ "-">
            <cfset result.message = "Please select a title.">
            <cfreturn result>
        </cfif>

        <cfif first_name EQ "">
            <cfset result.message = "First name is required.">
            <cfreturn result>
        </cfif>

        <cfif last_name EQ "">
            <cfset result.message = "Last name is required.">
            <cfreturn result>
        </cfif>

        <cfif gender EQ "" OR gender EQ "-">
            <cfset result.message = "Please select a gender.">
            <cfreturn result>
        </cfif>

        <cfif NOT isDate(dobValue)>
            <cfset result.message = "Invalid date of birth.">
            <cfreturn result>
        </cfif>

        <cfif address EQ "" OR street EQ "" OR city EQ "" OR state EQ "">
            <cfset result.message = "Address, street, city & state required.">
            <cfreturn result>
        </cfif>

        <cfif NOT reFind("^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$", zip)>
            <cfset result.message = "Invalid ZIP code.">
            <cfreturn result>
        </cfif>

        <cfif NOT reFind("^[6-9][0-9]{9}$", phone)>
            <cfset result.message = "Invalid phone number.">
            <cfreturn result>
        </cfif>

        <!--- <cfif NOT isValid("email", emailAddr)>
            <cfset result.message = "Invalid email address.">
            <cfreturn result>
        </cfif> --->

        <cfset photoPath = "">

        <cfif structKeyExists(form, "photo") AND len(form.photo)>
            <cfset uploadDir = expandPath("../assets/uploads/")>
            <cfif NOT directoryExists(uploadDir)>
                <cfdirectory action="create" directory="#uploadDir#">
            </cfif>
            <cffile 
                action="upload"
                fileField="photo"
                destination="#uploadDir#"
                nameConflict="makeUnique"
                accept="image/jpeg,image/png,image/gif"
                result="uploadResult">

            <cfset photoPath = "#uploadResult.serverFile#">
        </cfif>

        <cftry>

            <cfset contact = entityNew("Contact")>

            <cfset contact.setTitle(title)>
            <cfset contact.setFirst_name(first_name)>
            <cfset contact.setLast_name(last_name)>
            <cfset contact.setGender(gender)>
            <cfset contact.setDob(createODBCDate(dobValue))>
            <cfset contact.setAddress(address)>
            <cfset contact.setStreet(street)>
            <cfset contact.setCity(city)>
            <cfset contact.setState(state)>
            <cfset contact.setZip(zip)>
            <cfset contact.setPhone(phone)>
            <cfset contact.setEmail(emailAddr)>

            <cfif photoPath NEQ "">
                <cfset contact.setPhoto(photoPath)>
            </cfif>

            <cfset userObj = entityLoadByPK("User", session.userID)>
            <cfset contact.setUser(userObj)>

            <cfset entitySave(contact)>
            <cfset ormFlush()>

            <cfset result.success = true>
            <cfset result.message = "Contact saved successfully.">
            <cfreturn result>

            <cfcatch>
                <cfset result.success = false>
                <cflog type="error" text="Error saving contact: #cfcatch.message#">
                <cfset result.message = "Error saving contact: #cfcatch.message#">
                <cfreturn result>
            </cfcatch>

        </cftry>
    </cffunction>

    <cffunction name="listContacts" access="remote" returntype="struct" returnformat="json">
        <cfset var result = { success = false, data = [] }>

        <cfif NOT structKeyExists(session, "userID") OR session.userID EQ "">
            <cfset result.message = "User not logged in.">
            <cfreturn result>
        </cfif>

        <cftry>
            <cfset userObj = entityLoadByPK("User", session.userID)>
            <cfset contacts = entityLoad("Contact", { user = userObj }, "id DESC")>

            <cfset var contactList = []>

            <cfloop array="#contacts#" index="c">
                <cfset arrayAppend(contactList, {
                    id         = c.getID(),
                    title      = c.getTitle(),
                    first_name = c.getFirst_name(),
                    last_name  = c.getLast_name(),
                    gender     = c.getGender(),
                    dob        = c.getDob(),
                    address    = c.getAddress(),
                    street     = c.getStreet(),
                    city       = c.getCity(),
                    state      = c.getState(),
                    zip        = c.getZip(),
                    phone      = c.getPhone(),
                    email      = c.getEmail(),
                    photo      = c.getPhoto()
                })>
            </cfloop>

            <cfset result.success = true>
            <cfset result.data = contactList>
            <cfreturn result>

            <cfcatch>
                <cfset result.success = false>
                <cflog type="error" text="Error on listing contact: #cfcatch.message#">
                <cfset result.message = "Error on listing: #cfcatch.message#">
                <cfreturn result>
            </cfcatch>
        </cftry>
    </cffunction>

</cfcomponent>
