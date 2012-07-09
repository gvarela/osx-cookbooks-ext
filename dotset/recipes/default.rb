include_recipe "homebrew"

package "git"
package "ack"
package "ctags"
package "discount"
package "macvim"
package "node"
package "hub"

npm_package "coffee-script"
npm_package "jshint"
npm_package "jsonlint"

home_dir = "/Users/#{node[:homebrew][:user]}"
dotset_dir = "#{home_dir}/dotset"

execute "git clone https://github.com/modeset/dotset.git" do
  not_if { File.exist?("dotset")}
  user node[:homebrew][:user]
  cwd home_dir
end

execute "./dotset install" do
  user node[:homebrew][:user]
  cwd dotset_dir
end

execute "cp extras/bashrc_local.example #{home_dir}/.bashrc_local" do
  user node[:homebrew][:user]
  cwd dotset_dir
end

execute "cp extras/vimrc_local.example #{home_dir}/.vimrc_local" do
  user node[:homebrew][:user]
  cwd dotset_dir
end
