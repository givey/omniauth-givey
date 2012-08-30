require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Givey < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site          => 'https://api.givey.com',
        :authorize_url => 'http://www.givey.com/authorize',
        :token_url     => 'https://api.givey.com/oauth/token'
      }
      #option :client_options, {
      #  :site          => 'http://givey-api.dev',
      #  :authorize_url => 'http://givey2.dev/authorize',
      #  :token_url     => 'http://givey-api.dev/oauth/token'
      #}

      uid { raw_info['id'] }

      info do
        name      = [raw_info['first_name'].to_s, raw_info['last_name'].to_s].compact.join(" ")
        givey_tag = raw_info['givey_tag'][/[^\/]+$/]
        {
          'name'      => name.empty? ? username : name,
          'nickname'  => givey_tag,
          'image_url' => raw_info['avatar_url'],
          'email'     => raw_info['email']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= begin
          user    = MultiJson.decode(access_token.get('/v1/me').body)
          user
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'givey', 'Givey'
