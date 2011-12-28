if node[:platform] =~ /mac_os_x/
  include_recipe 'homebrew'

  package 'sphinx' do
    action :install
  end
end

if node[:platform] =~ /ubuntu/
  package 'sphinxsearch' do
    action :install
  end
end