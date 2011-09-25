require 'rake'
require 'rspec/core/rake_task'
require 'socket'
require 'timeout'

namespace :spec do
  RSpec::Core::RakeTask.new 'acceptance' do |t|
    t.pattern = "./spec/acceptance/**/*_spec.rb"
    t.rspec_opts = ['--colour']
  end

  RSpec::Core::RakeTask.new 'helpers' do |t|
    t.pattern = "./spec/helpers/**/*_spec.rb"
    t.rspec_opts = ['--colour']
  end
end

task :helpers do
  Rake::Task['spec:helpers'].execute
end

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
task :spec do
  ['helpers', 'acceptance'].each do |task|
    Rake::Task[task].execute
  end
end

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