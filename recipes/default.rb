#
# Cookbook Name:: hello_webpage_chef
# Recipe:: default
#

case node['platform']
when 'windows'
  # Enable the IIS role.
  dsc_script 'Web-Server' do
    code <<-EOH
    WindowsFeature InstallWebServer
    {
      Name = "Web-Server"
      Ensure = "Present"
    }
    EOH
  end

  # Install ASP.NET 4.5.
  dsc_script 'Web-Asp-Net45' do
    code <<-EOH
    WindowsFeature InstallDotNet45
    {
      Name = "Web-Asp-Net45"
      Ensure = "Present"
    }
    EOH
  end

  # create and start a new site that maps to
  # the physical location C:\inetpub\wwwroot\testfu
  # first the physical location must exist
  directory "#{node['iis']['docroot']}/testfu" do
    action :create
    # rights :full_control, 'Everyone'
    recursive true
  end

# now create and start the site (note this will use the default application pool which must exist)
#  iis_site 'Testfu Site' do
#    protocol :http
#    port 80
#    path "#{node['iis']['docroot']}/testfu"
#    action [:add, :start]
#  end
else
  case node['platform']
  when 'ubuntu'
    include_recipe 'apt'
  end
  include_recipe 'apache2::default'

  web_app 'my_app' do
    template 'web_app.conf.erb'
    server_name node['my_app']['name']
  end

  template '/var/www/html/index.html' do
    source 'index.html.erb'
    owner 'root'
    group 'root'
    mode '0755'
  end
end
