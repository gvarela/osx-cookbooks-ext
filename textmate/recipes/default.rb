include_recipe 'git'

application "TextMate" do
  source "http://download.macromates.com/TextMate_1.5.10.zip"
end

bash "setup factory preferences" do
  user node[:homebrew][:user]
  code <<-EOH
mkdir -p /Users/#{node[:homebrew][:user]}/Library/Application\ Support/TextMate/Bundles
mkdir -p /Users/#{node[:homebrew][:user]}/Library/Application\ Support/TextMate/Pristine\ Copy
mkdir -p /Users/#{node[:homebrew][:user]}/Library/Application\ Support/TextMate/Pristine\ Copy/Bundles
mkdir -p /Users/#{node[:homebrew][:user]}/Library/Application\ Support/TextMate/Themes
mkdir -p /Users/#{node[:homebrew][:user]}/Library/Application\ Support/TextMate/Themes/WebPreview

cd /Users/#{node[:homebrew][:user]}/Library/Application\ Support/TextMate/
git init
git remote add origin git://github.com:mkitt/matefiles.git
git fetch
git branch master origin/master
git reset --hard
git submodule init
git submodule update
  EOH
  not_if "test -f /Users/#{node[:homebrew][:user]}/Library/Application\ Support/TextMate/Themes/colorblind.tmTheme", :user => node[:homebrew][:user]
end
