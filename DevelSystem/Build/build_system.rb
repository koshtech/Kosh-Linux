#!/usr/bin/ruby

require 'yaml'
require 'md5'
require 'Scripts/kosh_linux'

KOSH_LINUX_ROOT = FileUtils.pwd() unless defined?(KOSH_LINUX_ROOT)
PROFILES = "#{KOSH_LINUX_ROOT}/Profiles"
WORK = "#{KOSH_LINUX_ROOT}/Work"
PACKAGES = "#{KOSH_LINUX_ROOT}/Depot/Recipes"
SOURCES = "#{KOSH_LINUX_ROOT}/Depot/Sources"
TOOLS = "#{WORK}/tools"
LOGS = "#{WORK}/logs"

[WORK, SOURCES, TOOLS, LOGS].each do |folder|
  puts "Creating #{folder}"
  FileUtils.mkdir_p(folder)
end

def print_echo(msg='')
  puts msg
end

linux = KoshLinux.new

if linux.config.ok?
  puts 'running...'
  # linux.packager.fetch_files
  linux.packager.build_all
end

