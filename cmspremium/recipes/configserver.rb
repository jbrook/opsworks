include_recipe "apache2::service"

# install necessary packages: memcached, apc, geoip-devel
packages = [
  'php-pecl-memcached',
  'php-pecl-apc'
]

packages.each do |pkg|
  package pkg do
    action :install
  end
end

# configure custom apc.ini
etc_dir = "/etc/php.d"
conf_apc    = "apc.ini"

template "#{etc_dir}/#{conf_apc}" do

  owner 'root'
  group 'root'
  mode     '0755'
  source   'apc.ini.erb'

  variables(
    :enabled        => (node["hebs-server"]["apc"]["enabled"]  rescue '1'),
    :shm_size       => (node["hebs-server"]["apc"]["shm_size"] rescue '128M'),
    :gc_ttl         => (node["hebs-server"]["apc"]["gc_ttl"]   rescue '900')
  )

end