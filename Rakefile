require 'rake'
require 'rspec/core/rake_task'
require 'socket'
require 'timeout'

task :default => :spec

namespace :spec do
  RSpec::Core::RakeTask.new 'acceptance' do |t|
    t.pattern = "./spec/acceptance/**/*_spec.rb"
    t.rspec_opts = ['--colour', '--format Fuubar']
  end

  RSpec::Core::RakeTask.new 'unit' do |t|
    t.pattern = "./spec/unit/**/*_spec.rb"
    t.rspec_opts = ['--colour', '--format Fuubar']
  end
end

task :unit => 'spec:unit'

task :acceptance do
  pid = Process.spawn 'rackup'

  trap("INT") {
    Process.kill(9, pid) rescue Errno::ESRCH
    exit 0
  }
  
  until is_port_open?('localhost', '9292') do
    puts "Waiting for server to start listening..."
    sleep 1
  end
  
  Rake::Task['spec:acceptance'].execute
  
  Process.kill 9, pid
end

desc 'Run all specs'
task :spec => [:unit, :acceptance]

private

def is_port_open?(ip, port)
  begin
    Timeout::timeout(1) do
      begin
        s = TCPSocket.new(ip, port)
        s.close
        return true
      rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
        return false
      end
    end
  rescue Timeout::Error
  end

  return false
end