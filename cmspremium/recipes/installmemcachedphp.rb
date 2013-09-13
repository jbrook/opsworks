package "php5-memcache" do
    action :install
end

include_recipe 'apache2::service'
