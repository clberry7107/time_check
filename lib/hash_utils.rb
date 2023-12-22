module HASH
  def self.from_string(hString)
    hash_obj = {}
    if nested_data?(hString)

    else
      hash_obj = self.straight_hash(hString)
    end

    return hash_obj
  end

  private

  def self.nested_data?(data)
    sdata = data.to_s
    sdata.match(/\{.*\{/).class == MatchData ? true : false
  end

  def self.straight_hash(data)
    
    sdata = data.to_s
    sdata.gsub!(/[\{\}]/, '')
    sdata.gsub!(/\"/, "")
    hash = {}
    sdata.split(', ').each {|entry|
      sentry = entry.split('=>')
      hash[sentry[0].to_sym] = sentry[1]
    }
    
    return hash
  end
end