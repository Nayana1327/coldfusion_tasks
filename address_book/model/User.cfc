<cfcomponent persistent="true" table="address_book" output="false">

    <cfproperty name="id" column="id" fieldtype="id" generator="identity" setter="false">
    <cfproperty name="full_name" type="string" length="100" required="true" notnull="true">
    <cfproperty name="email" type="string" length="150" required="true" notnull="true" validation="email" message="Invalid email address.">
    <cfproperty name="username" type="string" length="100" required="true" notnull="true">
    <cfproperty name="password_hash" type="string" length="255" required="true" notnull="true">
    <cfproperty name="contacts" fieldtype="one-to-many" cfc="Contact" fkcolumn="user_id">

</cfcomponent>
