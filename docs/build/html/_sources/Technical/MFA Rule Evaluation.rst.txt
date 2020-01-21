MFA Rule Evaluation
================

Unlike typical rules and trust providers, evaluation and onboarding is handled completely within CitizenOne.

The MFA Rule may be applied to any policy and will require the user's session to be authenticated with a :ref:`Multi-Factor Authentication <multi-factor-authentication>` method.

Evaluation Steps
~~~~~~~~~~

When evaluating this rule it checks the user's JWT and authenticators. The claim providers offered to the user will be filtered depending on the following cases:

Session is MFA:
  Rule Passed

Session is not MFA:
  User has an ACTIVE MFA:
    Prompt user to complete MFA challenge
  User has a PENDING SMS:
    Send SMS code and prompt user to verify
  User has no MFA:
    Offer user to create TOTP or SMS

TOTP
~~~~~~~

The TOTP flow is the simplest, requiring two internal trust providers. These are `Add an Authenticator App` and `Challenge TOTP`.

Add an Authenticator App
#########

This will be offered to the user if they have no PENDING or ACTIVE MFA strategies. This trust provider uses the onboarding form: `create-totp-auth-method`. The form contains a QR Code component with a dataURL of ``https://authentication-service/api/v1/authentication/users/$identityId/mfa/createTOTP``. This creates a pending TOTP upon form load which the user can complete and enter their 6-digit code on the form. Side-effect: this claim provider attempts to activate the 2fa method.

Challenge TOTP Trust Provider
#########

This will be offered to users with an ACTIVE TOTP authenticator. It simply prompts for their 6-digit verification code.

SMS
~~~~~~~~~~~

This requires 3 internal trust providers, these being `Setup SMS Verification`, `Verify SMS Authentication Method`, and `Challenge SMS Authenticator`.

Setup SMS Verification
#########

This trust provider uses the onboarding form `create-sms-auth-method` and simply asks the user for their phoneNumber and creates a PENDING SMS authenticator. Note this has a special case of NOT sending out a text message.

Verify SMS Authentication Method
#########

This provider will be offered to the user if they have a PENDING SMS method. Using ClaimProviderDto.onboardingContext, it passes ``identityId`` and ``mfaId`` to the frontend which is injected into the nocode form which finally POSTs to ``https://authentication-service/api/v1/authentication/users/$identityId/mfa/$mfaId/resendSMS`` to generate and text a fresh 6-digit verification to the user onload. It has a single input for the 6-digit verification code. Side-effect: this claim provider attempts to activate the 2fa method.

Challenge SMS Authenticator
###########

This claim provider uses form `challenge-sms-auth-method` which onload texts the user a 6-digit code using the strategy defined in Verify SMS Authentication Method. It contains a single input for the 6-digit verification code.