# Serverspec examples can be found at
# http://serverspec.org/resource_types.html

# service is not working with SysVinit
#describe service('apache2') do
#  it { should be_installed }
#  it { should be_running }
#end

describe command('apache2 -v') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/Server version: Apache\/2.4/) }
end

describe apache_conf do
  its('Listen') { should eq ["*:80"]}
  its('AllowOverride') { should contain 'None' }
end

describe host('example.com', port: 80, proto: 'tcp') do
  it { should be_resolvable }
end

describe ssh_config do
  its('Host') { should eq '*' }
  its('Tunnel') { should eq nil }
  its('SendEnv') { should eq 'LANG LC_*' }
  its('HashKnownHosts') { should eq 'yes' }
end

describe file('/etc/apache2/') do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by 'root' }
end

describe file('/var/www/html/') do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by 'root' }
end

describe file('/etc/apache2/sites-enabled/my_app.conf') do
  it { should be_symlink }
end

describe file('/etc/apache2/sites-available/my_app.conf') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
end

describe file('/var/www/html/index.html') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  its(:content) { should match(/Kansas City/) }
end
