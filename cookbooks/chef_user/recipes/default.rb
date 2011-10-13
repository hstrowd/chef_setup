#
# Cookbook Name:: chef_user
# Recipe:: default
#
# Author:: Harrison Strowd <hstrowd@enovafinancial.com>
# Copyright 2011, Enova Financial
#
# All rights reserved - Do Not Redistribute
#
# Creates a chef user with a well defined ssh key
#

# Setup a chef user to pull from my git repos
user "chef" do
  home "/home/chef"
  shell "/bin/bash"
  password "my_chef"
  action :create
end

group "chef" do 
  members ['chef']
  action :create
end

#package('ssh')
#directory "/home/chef/.ssh" do
#  owner "chef"
#  group "chef"
#  mode 0755
#  action :create
#  recursive true
#end
#
#file "/home/chef/.ssh/config" do
#    main_key = "IdentityFile /chef/id_rsa"
#    content "#{main_key}"
#    mode "0644"
#    owner "chef"
#    group "chef"
#end
#
#file "/home/chef/.ssh/known_hosts" do
#    content "|1|9AUDLqwDpVR6p7bBR6hIrEfOoD0=|4j/fWTBqorCCaY0zQh8Vn2SXlUc= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3no3wEJr+JU7txWRc4QJKAdHnWPNrWuqVm6qNmQCazB5FEhuMqQeppVYOv/XSbVQewFU5d7Zw7vr1mZSeld4wg8TVU0I1JPs+7HKFF7N/VoLDMRdzykiTOb+x7il/Xyj567Z8vpIpPjEyFY58oSIBAtPY2flJCtBPk2MkmIFfi1u8dWua1U6mL91vC2hz4qPFEYMFRjgd8jHxiLqXxGVkfg2KYmVbEIyKNnPruUm9t+XZYH76qnzrF96PL2gSs6cBIUubDLyG5P6ExFNeOAvD6g0JRXGCQtinM4IylzQ0S5tR5rs/QDng1B8gU0PoOkm25pM3XN6hoXerplexOBjBQ==\n|1|CoEQJ/Bc8rMJ0bPjkQ3MH5vgjzI=|9eLxdLTN22XSZhVqsbxip+fZInc= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3no3wEJr+JU7txWRc4QJKAdHnWPNrWuqVm6qNmQCazB5FEhuMqQeppVYOv/XSbVQewFU5d7Zw7vr1mZSeld4wg8TVU0I1JPs+7HKFF7N/VoLDMRdzykiTOb+x7il/Xyj567Z8vpIpPjEyFY58oSIBAtPY2flJCtBPk2MkmIFfi1u8dWua1U6mL91vC2hz4qPFEYMFRjgd8jHxiLqXxGVkfg2KYmVbEIyKNnPruUm9t+XZYH76qnzrF96PL2gSs6cBIUubDLyG5P6ExFNeOAvD6g0JRXGCQtinM4IylzQ0S5tR5rs/QDng1B8gU0PoOkm25pM3XN6hoXerplexOBjBQ==\n"
#    mode "0644"
#    owner "chef"
#    group "chef"
#end
