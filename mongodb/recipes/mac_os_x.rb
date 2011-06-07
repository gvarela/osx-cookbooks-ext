include_recipe 'homebrew'

package 'mongodb' do
  version '1.8.1'
  action :install
end

if node[:mongodb][:launchd]
  launch_service "io.mongodb.mongodb-server"
end
