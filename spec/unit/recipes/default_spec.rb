#
# Cookbook Name:: hello_webpage_chef
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'hello_webpage_chef::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      stub_command('/usr/sbin/apache2 -t').and_return(true)
      expect { chef_run }.to_not raise_error
    end
  end
end
