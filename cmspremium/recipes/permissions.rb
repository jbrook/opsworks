directory "#{deploy[:deploy_to]}/current/core/cache" do
    group deploy[:group]
    owner "apache"
    mode 00755
    action :create
end