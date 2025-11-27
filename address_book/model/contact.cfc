<cfcomponent persistent="true" table="contacts" output="false">

    <cfproperty name="id" column="id" fieldtype="id" generator="identity" setter="false">
    <cfproperty name="title" type="string" length="16" required="true" notnull="true">
    <cfproperty name="first_name" type="string" length="100" required="true" notnull="true">
    <cfproperty name="last_name" type="string" length="100" required="true" notnull="true">
    <cfproperty name="gender" type="string" length="16" required="true" notnull="true">
    <cfproperty name="dob" type="date">
    <cfproperty name="photo" type="string" length="260">
    <cfproperty name="address" type="string" length="200" required="true" notnull="true">
    <cfproperty name="street" type="string" length="200" required="true" notnull="true">
    <cfproperty name="city" type="string" length="100" required="true" notnull="true">
    <cfproperty name="state" type="string" length="100" required="true" notnull="true">
    <cfproperty name="zip" type="string" length="20" required="true" notnull="true">
    <cfproperty name="phone" type="string" length="50" required="true" notnull="true" validation="regex" pattern="^\+?[0-9\s\-\(\)]+$" message="Invalid phone format.">
    <cfproperty name="email" type="string" length="200" required="true" notnull="true" validation="email" message="Invalid email address.">
    <cfproperty name="modified_at" ormtype="timestamp">
    <cfproperty name="user" fieldtype="many-to-one" cfc="User" fkcolumn="user_id" notnull="true">
    
</cfcomponent> 