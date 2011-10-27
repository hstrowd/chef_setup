#
# Cookbook Name:: emacs
# Recipe:: default
#
# Author:: Harrison Strowd <hstrowd@enovafinancial.com>
# Copyright 2011, Enova Financial
#
# All rights reserved - Do Not Redistribute
#
# Installs and configures Emacs
#

# Install Emacs
package('emacs')

# Pull down emacs configuration git repo
package('git')
git "#{node[:user_home_path]}/.emacs.d" do
  repository "git://github.com/hstrowd/.emacs.git"
  reference "master"
  user  "cnuapp"
  group "cnuapp"
  action :sync
end
