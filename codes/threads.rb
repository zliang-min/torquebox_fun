# encoding: utf-8

require 'thread'

puts "Running #{RUBY_ENGINE} - #{RUBY_VERSION}"

(1..5).map { |n|
  Thread.new(n) { |i|
    30.times { |x|
      print "[Thread #{i}] -> No.#{x}\n"
    }
  }
}.each { |thread| thread.join }
