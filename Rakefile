# coding: utf-8
task default: %w[run]

task :init do
  sh "bundle install"
end

task :run do
  sh "cat test/test_input.md | bundle exec bin/markdown-table-formatter"
end

task :test do
  sh "bundle exec ruby test/test.rb"
end