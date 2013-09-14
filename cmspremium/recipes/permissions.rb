node[:deploy].each do |app_name, deploy|

  # create production .htaccess file
  template "#{deploy[:deploy_to]}/current/.htaccess" do
    source "htaccess.erb"
    mode 0644
    group deploy[:group]
    owner "apache"
    
    variables(
      :env =>    (node[:metasearch][:env] rescue nil)
    )

   only_if do
     File.directory?("#{deploy[:deploy_to]}/current")
   end
  end
  
  # create proper folders if not exist
  directory "#{deploy[:deploy_to]}/current/core/cache" do
    group deploy[:group]
    owner "apache"
    mode 00755
    action :create
    only_if do
      File.directory?("#{deploy[:deploy_to]}/current")
    end
  end
  
  directory "#{deploy[:deploy_to]}/current/core/cache/zend" do
    group deploy[:group]
    owner "apache"
    mode 00755
    action :create
    only_if do
      File.directory?("#{deploy[:deploy_to]}/current")
    end
  end

  # run composer installer without dev dependencies
  script "install_composer" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    curl -sS https://getcomposer.org/installer | php
    php composer.phar install --no-dev
    EOH
  end

end