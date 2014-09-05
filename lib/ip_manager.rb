require 'json'

class IpManager

  def initialize
  end

  def add(item)
    json = JSON.parse(item)
    if json.empty?
      return
    end
    ip = json['ip'].strip
    file = File.open("data/ip_info/#{ip}_info.json", 'w')
    file.puts(item)
    file.close
  end

  def get_list_of_known_ips

  end

  def get(ip)

  end

end
