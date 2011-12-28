if node[:platform] =~ /mac_os_x/
  include_recipe 'homebrew'

  package 'mongodb' do
    version '1.8.1'
    action :install
  end

  if node[:mongodb][:launchd]
    launch_service "io.mongodb.mongodb-server"
  end
end

if node[:platform] =~ /ubuntu/
  # Add the 10Gen key for apt
  execute "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10" do
    not_if "apt-key list | grep 'Richard Kreuter'"
    notifies :run, resources("execute[apt-get update]"), :immediately
  end

  # Add the 10Gen apt repo 
  template "/etc/apt/sources.list.d/10gen.list" do
    owner "root"
    mode "0644"
    source "10gen.list.erb"
    notifies :run, resources("execute[apt-get update]"), :immediately
  end

  # Install MongoDB
  package 'mongodb-stable' do
    action :install
  end
end