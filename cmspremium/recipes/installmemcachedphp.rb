package "php-pear" do
    action :install
end

package "php-pecl-memcache" do
    options("-y")
    action :install
end

include_recipe 'apache2::service'
