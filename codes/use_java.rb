# encoding: utf-8

require 'benchmark'

require 'java'

import 'Fib'

java_string = java.lang.String.new 'java_string'
puts "java_string's class = #{java_string.class} || #{java_string.getClass} || #{java_string.get_class}"
java_string << 'oops!' rescue puts $!

puts

Benchmark.bmbm do |bm|
  bm.report { puts Fib.apply(35) }
end

puts Fib.fun(10) { |n| n * 2 }
