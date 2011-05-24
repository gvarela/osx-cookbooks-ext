include_recipe "homebrew"
include_recipe "git"
include_recipe "ruby"

gem_package 'homesick'

node[:homesick][:repos].each do |repo|
  bash "homesick clone #{repo}" do
    castle_name = /\/([^\/]*?)(\.git)?\Z/ ~= repo; $1
    code <<-EOS
      homesick clone #{repo}
      homesick symlink #{castle_name}
    EOS
    not_if "test -d /Users/#{node[:homebrew][:user]}/.homesick/repos/#{castle_name}", :user => node[:homebrew][:user]
  end
end
