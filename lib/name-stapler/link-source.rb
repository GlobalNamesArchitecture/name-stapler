class NameStapler
  class LinkSource

    def initialize
      @urls = {}
    end
    
    def api_url_exact(name)
      raise "not implemented"
    end

    def api_url_canonical(name)
      raise "not implemented"
    end

    def get_urls(data, urls_num = 1)
      raise "not implemented"
    end

    def find(name)
      return @urls[name] if @urls[name]
      urls = find_exact(name)
      if urls.size == 0
        urls = find_canonical(name)
      end
      @urls[name] = urls
      urls
    end
    
    def find_exact(name)
      res = RestClient.get(api_url_exact(name))
      get_urls(res)
    end

    def find_canonical(name)
      res = RestClient.get(api_url_canonical(name))
      get_urls(res)
    end

  end
  
  class LinkGni < LinkSource
    def initialize
      super
      @url_base = "http://gni.globalnames.org/name_strings"
    end
      
    def api_url_exact(name)
      "#{@url_base}.json?search_term=exact:#{URI.encode(name)}"
    end
    
    def api_url_canonical(name)
      "#{@url_base}.json?search_term=can:#{URI.encode(name)}"
    end

    def get_urls(data, urls_num = 1)
      res = JSON.parse(data, :symbolize_names => true)
      res = res[:name_strings]
      res.is_a?(Array) ? res[0..(urls_num - 1)].map { |r| "%s/%s" % [@url_base, r[:uuid_hex]] } : [] 
    end
  end
end
