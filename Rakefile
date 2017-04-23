require 'rspec/core/rake_task'
require 'cookstyle'
require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen'
require 'kitchen/rake_tasks'

# Style tests. cookstyle (rubocop) and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = { fail_tags: ['any'] }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

# Integration tests. Kitchen.ci
namespace :integration do
  begin
    desc 'Run kitchen integration tests'
    Kitchen::RakeTasks.new
  rescue LoadError, StandardError => e
    puts ">>> Gem load error: #{e}, omitting #{task.name}" unless ENV['CI']
  end
end

# Rspec and ChefSpec
desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:spec)

# Default
task default: %w(style spec)
