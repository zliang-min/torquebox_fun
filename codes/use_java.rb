# encoding: utf-8

# 1st step
require 'java'

# a few little helpers
def example(name)
  puts "Example: %s" % name
  puts '-' * 30
  yield
  puts
end

def try
  yield
rescue
  puts $!
end

puts RUBY_DESCRIPTION

# == Examples Start Here == #

example "Use java's String instead of the Ruby one" do
  java_string = java.lang.String.new 'java_string'
  puts "java_string's class = #{java_string.class} || #{java_string.getClass} || #{java_string.get_class}"
  try { java_string << 'oops!' }
end

example "#each on java.util.Enumeration" do
  java.net.NetworkInterface.networkInterfaces.each { |i| puts "Interface: #{i}" }
end

example "reopen java classes" do
  try { java.lang.System.println "defined pringln in java.lang.System!" }

  class << java.lang.System
    def println(text)
      out.println text
    end
  end

  java.lang.System.println "defined println in java.lang.System!"
end

example "use java interfaces" do
  class Alphabet
    include java.util.Enumeration

    def has_more_elements
      @current_char != 'z'
    end

    def next_element
      @current_char = @current_char && @current_char.succ || 'a'
    end
  end

  puts Alphabet.new.map(&:to_s).inspect
end

example "alternative names for java methods" do
  module Example
    include_package "java.util"

    c = Calendar.instance

    puts "getTime == get_time ? #{c.getTime == c.get_time}"
    puts "getTime == time ? #{c.getTime == c.time}"
    puts "isWeekDateSupported == week_date_supported? ? #{c.isWeekDateSupported == c.week_date_supported}"

    # set methods
    c.setFirstDayOfWeek Calendar::SUNDAY
    c.first_day_of_week = Calendar::MONDAY
  end
end

example "Use a java class from class file" do
  import 'Fib'
  puts Fib.fun(35) { |n| Fib.apply n }
end
