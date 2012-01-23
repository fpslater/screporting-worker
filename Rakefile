#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

ScreportingRails::Application.load_tasks

task :default => [:copydeps]

  task :setup do
    puts "Perform setup here"
  end

  task :createwar do
    puts "Getting JAR deps"
    Rake::Task["copydeps"].execute
    Rake::Task["war"].execute
  end

  task :bar do
    puts "bar Perform setup here"
  end
  
  task :copydeps do
    sh %{mvn package}
  end