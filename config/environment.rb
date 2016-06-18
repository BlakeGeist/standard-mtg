# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

require 'rubygems'

require 'mtg_sdk'

require 'yaml'

require 'json'

# Initialize the Rails application.
Rails.application.initialize!
