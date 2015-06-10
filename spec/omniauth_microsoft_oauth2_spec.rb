require 'spec_helper'
require 'omniauth/strategies/microsoft_oauth2'

describe OmniAuth::Strategies::MicrosoftOauth2 do
  subject do
    OmniAuth::Strategies::MicrosoftOauth2.new(nil, @options || {})
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'has correct site' do
      expect(subject.client.site).to eq('https://login.live.com')
    end

    it 'has correct authorize url' do
      expect(subject.client.options[:authorize_url]).to eq('https://login.live.com/oauth20_authorize.srf')
    end

    it 'has correct token url' do
      expect(subject.client.options[:token_url]).to eq('https://login.live.com/oauth20_token.srf')
    end

    it 'runs the setup block if passed one' do
      counter = ''
      @options = { :setup => Proc.new { |env| counter = 'ok' } }
      subject.setup_phase
      expect(counter).to eq("ok")
    end
  end

  describe '#callback_path' do
    it "has the correct callback path" do
      expect(subject.callback_path).to eq('/auth/microsoft_oauth2/callback')
    end
  end
end