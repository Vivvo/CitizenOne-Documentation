.. _config-settings:
Configuration Settings
#######################

You can configure your instance of the Vivvo Trust Platform to suit your experience by changing any of the settings below:

**Active Skin**: Applies the defined skin to all applications 

**Allowed Account Attempts**: The number of failed attempts allowed on an account before a lockout will occur.

**Allowed IP Attempts**: The number of failed attempts allowed for a specific IP address before a lockout will occur.

**Business Provider**: Selects which provider's service cards will be displayed for businesses.

**Canada Post Address Complete API Key**: Enter an API key if you would like to use Canada Post Address Complete

**Citizen Provider**: Selects which provider's service cards will be displayed for citizens.

**Domain Restricted Registration**: Set an email domain that users must belong to in order to register.

**Eeze Client ID**: Client id for enabling authentication with the Eeze app

**Eeze Websocket Base URL**: Websocket url for authentication challenges with Eeze

**Email Masking Enabled**: Determines whether emails should contain the message contents, or prompt the user to login to Vivvo Trust Platform to view the contents.

**Email Notifications Enabled**: Determines whether users may set up their email to recieve notifications

**Enable Password Blacklist**: If set to true, this will enable checking passwords against the haveibeenpwned password database and prevent users from registering with breached passwords.

**Toggle High Velocity Business Registration**: Toggles high velocity business registration

**High Velocity Registration**: Allows users to quickly create accounts and choose to be a Trusted User.

**Identity Inactivity Months**: The number of months that an identity has not logged in before it is marked archived

**Login Layout**: Describes how the login layout is displayed.

**reCAPTCHA Secret Key**: The secret key authorizes communication between your application backend and the reCAPTCHA server to verify the user's response.

**reCAPTCHA Site Key**: The site key is used to invoke reCAPTCHA service on your site or mobile application.

**Session Hard Timeout**: Sessions are set to a hard expire for this value of time after the session is initialized. Value entered is interpreted as a Golang 'time.Duration' value. Valid duration strings are a number (whole or decimal) followed by a unit suffix ('ns', 'us' (or 'µs'), 'ms', 's', 'm', 'h'). Examples: '300ms', '1.5h', '2h45m'.

**Session Idle Timeout**: If no actions are performed for this value of time, the session will be expired. Every action that the user performs will reset this timer. Value entered is interpreted as a Golang 'time.Duration' value. Valid duration strings are a number (whole or decimal) followed by a unit suffix ('ns', 'us' (or 'µs'), 'ms', 's', 'm', 'h'). Examples: '300ms', '1.5h', '2h45m'.

**Sliding Window**: The amount of time in which an account can be locked out for too many failed authentication attempts (see allowedAccountAttempts).

**SMS Notifications Enabled**: Determines whether users may set up their phone to recieve notifications

**Toggle Addresses**: Toggle the ability to show address functionality.

**Toggle Business Connect**: Toggle the ability to show Business Connect functionality.

**Toggle Business Wizard**: Toggles whether or not the modal wizard is displayed after successfully registering a business and proceeding to the dashboard for the first time.

**Toggle Languages**: Enabled the ability to toggle between different languages.

**Toggle Login**: Toggle the ability for users to login through the Vivvo Trust platform.

**Toggle My Account**: Toggle the ability to show My Account in portal application.

**Toggle Notifications**: Toggle the ability to show notification functionality.

**Toggle Registration**: Toggle the ability for users to register new accounts with the Vivvo Trust platform.

**Trusted User Provider**: An identity provider that can be used for the trusted user flow.


