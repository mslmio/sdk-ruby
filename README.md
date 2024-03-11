# Mslm Ruby SDK

The official Ruby SDK for Mslm APIs.

## Requirements

## Authentication

Mslm's APIs require an API key. If you don't have one, please read
[Authentication](https://mslm.io/docs/api/authentication) to understand how to
get an API key before continuing.

## Installation

To install the gem, add the following line to your application's Gemfile:

    $ gem install 'mslm'

Install the gem and add to the application's Gemfile by executing:

    $ bundle nstall

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install mslm

## Usage

To use the Single Email Verification and otp gem require it in your Ruby code:

require 'mslm'

## Additional Resources

See the official [API Reference Documentation](https://mslm.io/docs/api) for
details on each API's actual interface, which is implemented by this SDK.

## Development

Then, create an instance of the Mslm::EmailVerification::SingleVerifyEmail.new class and use its single_verify method to verify a single email address:

c = Mslm.init("YOUR_API_KEY")

verifier = Mslm::EmailVerification::SingleVerifyEmail.new

response = verifier.single_verify("email@example.com")

client_test.test_single_verify

With this modification, users can provide their API key either during initialization or after instantiation using the set_api_key method. This gives them the flexibility to use their MSL cloud API key for unlimited hits.

Sending and Verifying OTPs

# Instantiate the Otp

otp = Mslm::Otp::Otp_send_verify.new

# Sending OTP

otp_send_req = {
"phone" => "+921123454456",
"tmpl_sms" => "Your verification code is {112233}",
"token_len" => 4, # Hown much length is required
"expire_seconds" => 300,
}

# Verifying OTP

otp_send_resp = otp.send_otp(otp_send_req)

otp_verify_req = {
"phone" => "+921123454456",
"token" => "Recieved Token",
"consume" => true,
}

otp_verify_resp = otp.verify(otp_verify_req)

client = EmailVerification::Client.new

Feel free to incorporate these methods into your Ruby applications for email verification and OTP functionalities.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for more information.

## Security

See [Security Issue
Notifications](CONTRIBUTING.md#security-issue-notifications) for more
information.

## License

This project is licensed under the [MIT License](LICENSE).

## About Mslm

At Mslm, we're all about making things better. Where others see norm, we see
opportunity.

We build world-class solutions to the toughest problems. Excellence is a core
value that defines our approach from top to bottom.

We're all about creating positive value for ourselves, our partners and our
societies.

We do it by focusing on quality and the long-term, while intelligently
maneuvering the complex realities of day-to-day business.

Our partners share our perspective, and we jointly produce truly world-class
solutions to the toughest problems.

[![image](https://avatars.githubusercontent.com/u/50307970?s=200&v=4)](https://mslm.io/)
