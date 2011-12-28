if node[:platform] =~ /mac_os_x/
  include_recipe "homebrew"
  package "freeimage"
end

if node[:platform] =~ /ubuntu/
  package 'libfreeimage3'
  package 'libfreeimage-dev'
end