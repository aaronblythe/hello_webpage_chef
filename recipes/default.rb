#
# Cookbook Name:: hello_webpage_chef
# Recipe:: default
#

include_recipe 'apache2::default'

web_app "my_app" do
  template 'web_app.conf.erb'
  server_name node['my_app']['name']
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  owner 'root'
  group 'root'
  mode '0755'
end
