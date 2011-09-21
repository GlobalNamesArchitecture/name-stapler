class NameStapler
  class LinkSource
    
    def api_url_exact(name)
      raise "not implemented"
    end

    def api_url_canonical(name)
      raise "not implemented"
    end

    def rubify(data)
      raise "not implemented"
    end

    def find(name)
      res = find_exact(name)
      if res.size == 0
        res = find_canonical(name)
      end
      res[0]
    end
    
    def find_exact(name)
      require 'ruby-debug'; debugger
      res = RestClient.get(api_url_exact(name))
      rubify(res)
    end

    def find_canonical(name)
      res = RestClient.get(api_url_canonical(name))
      rubify(res)
    end

  end
  
  class LinkGni < LinkSource
    def initialize
      @api_url_template_canonical = "http://gni.globalnames.org/name_strings.json?search_term=can:"
    end
      
    def api_url_exact(name)
      "http://gni.globalnames.org/name_strings.json?search_term=exact:#{URI.encode(name)}"
    end
    
    def api_url_canonical(name)
      "http://gni.globalnames.org/name_strings.json?search_term=can:#{URI.encode(name)}"
    end

    def rubify(data)
      data
    end
  end
end
