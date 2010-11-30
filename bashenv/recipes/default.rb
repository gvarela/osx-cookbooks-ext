package "bash_completion"

%w(profile rvmrc prompt).each do |dotfile|
  template "/Users/#{node[:homebrew][:user]}/.#{dotfile}" do
    source dotfile

    owner node[:homebrew][:user]
    group "staff"
  end
end
