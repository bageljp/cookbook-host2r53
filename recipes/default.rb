#
# Cookbook Name:: host2r53
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

template "/etc/init.d/host2r53_#{node['host2r53']['domain']}" do
  owner "root"
  group "root"
  mode 00755
  source "host2r53.erb"
end

service "host2r53_#{node['host2r53']['domain']}" do
  supports :status => true, :restart => true, :reload => false
  action [ :enable, :start ]
end
