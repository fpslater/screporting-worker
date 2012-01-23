# Load the rails application
require File.expand_path('../application', __FILE__)

# Turn off SSL verfication for Koala gem
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# Initialize the rails application
ScreportingRails::Application.initialize!

# This is needed when running in JBoss
#ActionController::AbstractRequest.relative_url_root = "/screporting-worker"
ENV['RAILS_RELATIVE_URL_ROOT'] = nil




