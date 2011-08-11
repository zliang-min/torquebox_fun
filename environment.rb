# encoding: utf-8

require 'rbconfig'

# ENV['TORQUEBOX_HOME'] = '/usr/local/src/download/torquebox'
ENV['TORQUEBOX_HOME'] = '/tmp/torquebox'

ENV['JRUBY_HOME'] = File.dirname Config::CONFIG['libdir']

# ENV['JBOSS_HOME'] = ENV['TORQUEBOX_HOME'] + '/jboss'
ENV['JBOSS_HOME'] ||= '/usr/local/apps/jboss'
# ENV['JBOSS_CONF'] = 'web'
