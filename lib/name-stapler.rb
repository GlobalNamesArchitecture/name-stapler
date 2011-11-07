require "rest_client"
require "uri"
require "json"

Dir["#{File.dirname(__FILE__)}/name-stapler/**/*.rb"].each {|f| require f}

raise "name-stapler needs Ruby >= 1.9.1" if RAILS_VERSION < "1.9.1"

class NameStapler
  def initialize(link_source)
    @link_source = link_source
  end

  def add_urls(names_data)
    names_data[:names].each do |name|
      sci_name = name[:scientificName].gsub(/\[([^\]]*)]/, '\1')
      name[:urls] = @link_source.find(sci_name)
    end
    names_data
  end

  def make_links(text, names_data)
  end
end
