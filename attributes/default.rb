#
# Cookbook Name:: test_apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

default['my_app']['name'] = 'hello_app'
default['apache']['docroot_dir'] = '/var/www/html'
