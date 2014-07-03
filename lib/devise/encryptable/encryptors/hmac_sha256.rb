require 'openssl'
require 'base64'

module Devise
  module Encryptable
    module Encryptors
      class HmacSha256 < Base
        def self.digest(password, stretches, salt, pepper)
          str = [password].flatten.compact.join
          Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), 'secret-key', str)).strip()
        end
      end
    end
  end
end