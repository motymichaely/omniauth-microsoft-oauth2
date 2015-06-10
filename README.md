# OmniAuth Microsoft Oauth2

[OmniAuth](https://github.com/intridea/omniauth) strategy for authenticating Microsoft users via OAuth2.

Mount this with your Rack application (be it Rails or Sinatra) to simplify the [OAuth flow with Microsoft](https://msdn.microsoft.com/en-us/library/bing-ads-user-authentication-oauth-guide.aspx).

This is intended for apps already using OmniAuth, for apps that authenticate against more than one service (eg: Google and GitHub), or apps that have specific needs on session management.

## Configuration

OmniAuth works as a Rack middleware. Mount this Heroku adapter with:

```ruby
use OmniAuth::Builder do
  provider :microsoft_oauth2, ENV['MICROSOFT_CLIENT_ID'], ENV['MICROSOFT_CLIENT_SECRET'],
    { 
      name: "bingads",
      scope: "bingads.manage"
    }
end
```

Obtain a `MICROSOFT_CLIENT_ID` and `MICROSOFT_CLIENT_SECRET` by registering your application and get the corresponding client ID and client secret through [Microsoft Account Developer Center](https://account.live.com/developers/applications).

Your client should be set to receive callbacks on `/auth/bingads/callback`.

## A note on security

**Make sure your cookie session is encrypted before storing sensitive information on it, like access tokens**. [encrypted_cookie](https://github.com/cvonkleist/encrypted_cookie) is a popular gem to do that in Ruby.

Both Rails and Sinatra take a cookie secret, but that is only used to protect against tampering; any information stored on standard cookie sessions can easily be read from the client side, which can be further exploited to leak credentials off your app.
