include_recipe "home_brew"

node[:basic_brew][:formulae].each do |formula|
 package formula
end
