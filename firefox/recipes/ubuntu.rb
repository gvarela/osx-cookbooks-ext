%w(xorg xvfb x11vnc firefox).each do |pkg|
  package pkg do
    action :install
  end
end