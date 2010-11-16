include_recipe "rvm-passenger"

bash "install Apache Passenger Module" do
  user  node[:rvm][:user]
  code <<-EOH
  export rvm_path=#{node[:rvm][:prefix]}rvm
  source "#{node[:rvm][:prefix]}rvm/scripts/rvm"
  rvm use ree
  passenger-install-apache2-module -a
  EOH
  # not_if seems to run in sh which rvm doesn't like. So, just test for the next step.
  not_if "test -f /etc/apache2/other/passenger.conf", :user => node[:rvm][:user]
end

bash "configure Apache for Passenger" do
  code <<-EOH
  export rvm_path=#{node[:rvm][:prefix]}rvm
  source "#{node[:rvm][:prefix]}rvm/scripts/rvm"
  passenger-install-apache2-module --snippet > /etc/apache2/other/passenger.conf
  EOH
  not_if "test -f /etc/apache2/other/passenger.conf", :user => node[:rvm][:user]
end

