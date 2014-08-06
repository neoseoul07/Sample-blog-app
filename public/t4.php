<?php
$test_add_contacts = true;
$test_edit_contacts = false;
$test_delete_contacts = false;
$test_get_contacts = false;
$test_get_contact_groups = false;
$test_add_group = false;
$test_get_groups = false;
$test_delete_groups = false;
$test_add_contacts_to_group = true;
$test_delete_contacts_from_group = false;
$test_add_user_defined_fields = false;
$test_edit_user_defined_fields = false;
$test_delete_user_defined_fields = false;
$test_get_broadcasts_request = false;
$test_get_broadcasts_stats = false;
$test_upload_media = false;
$test_queue_mail = true;
$test_get_CRM_activities = false;
$test_add_CRM_activities = false;
$test_edit_CRM_activities = false;
$test_delete_CRM_activities = true;

$API_UserName = urlencode("abash@zoomcar.in");
$API_Password = urlencode("zoom123");

$API_XML = urlencode("<GetAuthTokenRequest>\n</GetAuthTokenRequest>\n");

// NVPRequest for submitting to server
$nvpreq = "email=$API_UserName&password=$API_Password&xml=$API_XML";

echo "Request was $nvpreq\n\n";

$httpResponse = Send_CE_XML_Request($nvpreq);

echo "Response was $httpResponse\n\n";

$my_reader = new XMLReader();
$my_reader->xml($httpResponse);

$xml_result = "";
$xml_token = "";
$xml_errorcode = "";
$xml_errormsg = "";

while ($my_reader->read())
{
switch ($my_reader->nodeType)
{
case XMLReader::ELEMENT:
if ($my_reader->name == "Result")
{
$my_reader->read();
$xml_result = $my_reader->value;
}
else if ($my_reader->name == "Token")
{
$my_reader->read();
$xml_token = $my_reader->value;
}
else if ($my_reader->name == "ErrorCode")
{
$my_reader->read();
$xml_errorcode = $my_reader->value;
}
else if ($my_reader->name == "ErrorText")
{
$my_reader->read();
$xml_errormsg = $my_reader->value;
}

break;
}
}

if ($xml_result == "Error")
{
print "Error - error code was $xml_errorcode, error message was $xml_errormsg\n";
}
else if ($xml_result == "Success")
{
$API_Token = urlencode($xml_token);
if ($test_add_contacts)
{
$API_XML_String = "<AddContactsRequest>\n";
$API_XML_String .= "<Contacts>\n";
$API_XML_String .= "<Contact>\n";
$API_XML_String .= "<Firstname>Jeffeey</Firstname>\n";
$API_XML_String .= "<Lastname>Johnon</Lastname>\n";
$API_XML_String .= "<Title>CEO</Title>\n";
$API_XML_String .= "<Company>Acme Widgets, LLC</Company>\n";
$API_XML_String .= "<Address1>101 First Street</Address1>\n";
$API_XML_String .= "<Address2>Suite 234</Address2>\n";
$API_XML_String .= "<City>Naperville</City>\n";
$API_XML_String .= "<State>IL</State>\n";
$API_XML_String .= "<Zip>60565</Zip>\n";
$API_XML_String .= "<Phone>630-305-9999</Phone>\n";
$API_XML_String .= "<Mobile>708-555-6565</Mobile>\n";
$API_XML_String .= "<Fax>630-305-9988</Fax>\n";
$API_XML_String .= "<Website>www.acmewidgetsllc.com</Website>\n";
$API_XML_String .= "<Email>jjohnson@acmewidgetsllc.com</Email>\n";
$API_XML_String .= "<Groups>\n";
$API_XML_String .= "<Group>TestTeam Leopards</Group>\n";
$API_XML_String .= "<Group>My Test Group</Group>\n";
$API_XML_String .= "</Groups>\n";
$API_XML_String .= "<UserDefinedFields>\n";
$API_XML_String .= "<UserDefinedField fieldname=\"TestCustomField\">My field value</UserDefinedField>\n";
$API_XML_String .= "<UserDefinedField fieldname=\"TestUserDefinedSelect1\">Hello</UserDefinedField>\n";
$API_XML_String .= "</UserDefinedFields>\n";
$API_XML_String .= "</Contact>\n";
$API_XML_String .= "</Contacts>\n";

$API_XML_String .= "</AddContactsRequest>\n";

echo "XML Was $API_XML_String\n";

$API_XML = urlencode($API_XML_String);

// NVPRequest for submitting to server
$nvpreq = "email=$API_UserName&auth_token=$API_Token&xml=$API_XML";


echo "Request was $nvpreq\n\n";

$httpResponse = Send_CE_XML_Request($nvpreq);

echo "Response was $httpResponse\n\n";
}

if ($test_add_contacts_to_group)
{
$API_XML_String = "<AddContactsToGroupRequest group_id=\"2\">\n";
$API_XML_String .= "<Contacts>\n";
$API_XML_String .= "<Contact contact_id=\"3\" />\n";
$API_XML_String .= "</Contacts>\n";
$API_XML_String .= "</AddContactsToGroupRequest>\n";

echo "XML Was $API_XML_String
\n";

$API_XML = urlencode($API_XML_String);

// NVPRequest for submitting to server
$nvpreq = "email=$API_UserName&auth_token=$API_Token&xml=$API_XML";

echo "Request was $nvpreq\n\n";

$httpResponse = Send_CE_XML_Request($nvpreq); // getting response from server

echo "Response was $httpResponse\n\n";
}
}

function Send_CE_XML_Request($request)
{
$test_url = "https://api.stgi.net/xml.pl";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $test_url);
curl_setopt($ch, CURLOPT_VERBOSE, 1);

// turning off the server and peer verification(TrustManager Concept).
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $request);

return curl_exec($ch);
}

?>
