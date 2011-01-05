include_recipe "homebrew"

node[:basic_brew][:formulae].each do |formula|
 package formula
end
