# OmniAuth Givey

This is the OmniAuth strategy for authenticating to Givey.

## Basic Usage

    use OmniAuth::Builder do
      provider :givey, ENV['GIVEY_CLIENT_ID'], ENV['GIVEY_CLIENT_SECRET']
    end

## License

OmniAuth Givey is released under the MIT license.
