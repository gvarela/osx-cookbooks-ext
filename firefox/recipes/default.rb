if node[:platform] =~ /mac_os_x/
  application 'Firefox' do
    source 'http://mirror.7he.at/pub/mozilla/firefox/releases/13.0.1/mac/en-US/Firefox%2013.0.1.dmg'
  end
end

if node[:platform] =~ /ubuntu/
  %w(xorg xvfb x11vnc firefox).each do |pkg|
    package pkg do
      action :install
    end
  end
end
