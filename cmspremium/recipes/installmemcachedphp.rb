package "php-pear" do
    action :install
end

package "php-pecl-memcache" do
    action :install
end

include_recipe 'apache2::service'
