Trust Providers
==============================

The TrustProvider will handle basic parameter validation (required, type), call out to your business logic
functions (e.g.: Onboarding.OnboardingFunc, Rule.RuleFunc) and handle all the response bodies and status
codes based on what your business logic functions return. This is the quickest and easiest way to implement
the consistent API that the Citizen One platform expects to integrate with when talking to a Trust Provider.

The port that the http server runs on can be configured by setting an environment variable: TRUST_PROVIDER_PORT.
If this variable is not set, we will default to port 3000.

The onboarding endpoint will be:
    /api/register
The rules endpoints will follow this pattern:
    /api/{Rule.Name}/{token}
 
 
Create a new TrustProvider. Based on the onboarding, rules and account objects you pass in this will bootstrap an http server with onboarding and rules endpoints exposed.
