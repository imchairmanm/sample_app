#  # Be sure to restart your server when you modify this file.
#  
#  # Your secret key is used for verifying the integrity of signed cookies.
#  # If you change this key, all old signed cookies will become invalid!
#  
#  # Make sure the secret is at least 30 characters and all random,
#  # no regular words or you'll be exposed to dictionary attacks.
#  # You can use `rake secret` to generate a secure secret key.
#  
#  # Make sure your secret_key_base is kept private
#  # if you're sharing your code publicly.
#  SampleApp::Application.config.secret_key_base = 'd2c89f485747a4b5835f4af36e1fc7e69f76b9104ca25fcba5513f51d03c488891150d8bcbde6146f5d4faa91b13de65805d2dda3a6ef3d92075d6d6e1a85d56'


require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
