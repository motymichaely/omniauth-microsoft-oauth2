require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class MicrosoftOauth2 < OmniAuth::Strategies::OAuth2
      AuthUrl = ENV["MICROSOFT_AUTH_URL"] || "https://login.live.com"

      option :name, 'microsoft_oauth2'

      option :client_options, {
        site:          AuthUrl,
        authorize_url: "#{AuthUrl}/oauth20_authorize.srf",
        token_url:     "#{AuthUrl}/oauth20_token.srf"
      }

      uid do
        access_token.params["user_id"]
      end

      info do
        { name: "Microsoft user" } # only mandatory field
      end

      extra do
        {}
      end

      # override method in OmniAuth::Strategies::OAuth2 to error
      # when we don't have a client_id or secret:
      def request_phase
        if missing_client_id?
          fail!(:missing_client_id)
        elsif missing_client_secret?
          fail!(:missing_client_secret)
        else
          super
        end
      end

      def missing_client_id?
        [nil, ""].include?(options.client_id)
      end

      def missing_client_secret?
        [nil, ""].include?(options.client_secret)
      end
    end
  end
end
