# OmniAuth Givey

This is the OmniAuth strategy for authenticating to Givey. To use it,
you'll need to sign up for an OAuth2 Application ID and Secret on the
[Givey Applications Page](http://givey.com/partner/applications/registerForm).

## Basic Usage

    use OmniAuth::Builder do
      provider :givey, ENV['GIVEY_CLIENT_ID'], ENV['GIVEY_CLIENT_SECRET']
    end

## License

OmniAuth Givey is released under the MIT license.
