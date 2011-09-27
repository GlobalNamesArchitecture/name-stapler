$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'name-stapler'
require 'ostruct'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end

class NameStapler
  class Spec
    Config = OpenStruct.new(
      :test_html => open(File.join(File.dirname(__FILE__), 'support', 'test.html')).read,
      :test_names => JSON.parse(open(File.join(File.dirname(__FILE__), 'support', 'test_names.json')).read, :symbolize_names => true)
    )
  end
end
