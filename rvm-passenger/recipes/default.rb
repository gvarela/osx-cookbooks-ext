include_recipe "rvm"

unless node[:rvm][:rubies].include?("ree")
  node[:rvm][:rubies] << "ree"
end

bash "install Passenger in RVM" do
  user node[:rvm][:user]
  code <<-EOH
  export rvm_path=#{node[:rvm][:prefix]}rvm
  source "#{node[:rvm][:prefix]}rvm/scripts/rvm"
  gem install passenger
  EOH
  not_if "gem list passenger | grep passenger", :user => node[:rvm][:user]
end

