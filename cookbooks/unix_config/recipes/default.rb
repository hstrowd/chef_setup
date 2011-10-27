#
# Cookbook Name:: unix_config
# Recipe:: default
#
# Author:: Harrison Strowd <hstrowd@enovafinancial.com>
# Copyright 2011, Enova Financial
#
# All rights reserved - Do Not Redistribute
#
# Sets up my unix configuration, including:
# 
# * load path
# * aliases
#

# Install common packages I use
package('htop')
package('screen')
package('ssh')

# Pull down bash_config git repo
package('git')
user_home_path = File.expand_path('~')
git "#{user_home_path}/linux_config" do
  repository "git://github.com/hstrowd/linux_config.git"
  reference "master"
  action :sync
end

# Setup .bashrc_local
local_bashrc = <<EOF
# ~/linux_config/bash_config/.bashrc_local: executed by .bashrc

# include all dev commands
. ~/linux_config/bash_config/.bashrc_cnu_dev
. ~/linux_config/bash_config/.bashrc_rails_dev
. ~/linux_config/bash_config/.bashrc_sarrison_dev
. ~/linux_config/bash_config/.bashrc_git

# Alias emacs to the standalone emacs app.
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
EOF

execute "echo '#{local_bashrc}' > #{user_home_path}/linux_config/bash_config/.bashrc_local"

# Symlink into the home dir
%w{bashrc htoprc p4config screenrc vimrc}.each do |config_file|
  execute "ln -s #{user_home_path}/linux_config/.#{config_file} #{user_home_path}/.#{config_file}"
end
