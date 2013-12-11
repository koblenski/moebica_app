# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SampleApp::Application.initialize!

# Make a shortcut for the find method on models
class <<ActiveRecord::Base
  alias_method :[], :find
end
