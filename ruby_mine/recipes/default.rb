include_recipe 'git'

application "RubyMine 3.0" do
  source "http://download.jetbrains.com/ruby/RubyMine-3.0.dmg"
end

bash "setup factory preferences" do
  user node[:homebrew][:user]
  code <<-EOH
mkdir -p /Users/#{node[:homebrew][:user]}/Library/Preferences/RubyMine30
cd /Users/#{node[:homebrew][:user]}/Library/Preferences/RubyMine30
git init
git remote add origin git://github.com/factorylabs/ruby-mine-settings.git
git fetch
git branch master origin/master
git reset --hard
  EOH
  not_if "test -f /Users/#{node[:homebrew][:user]}/Library/Preferences/RubyMine30/colors/LessVibrantInk.xml", :user => node[:homebrew][:user]
end
