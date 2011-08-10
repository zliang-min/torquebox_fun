# encoding: utf-8

module Fib
  class << self
    def recursive(n)
      validate n

      if n < 2 then n
      else
        recursive(n - 2) + recursive(n - 1)
      end
    end

    def loop(n)
      validate n

      if n < 2 then n
      else
        (2 .. n).inject([0, 1]) do |tmp, _|
          n_2, n_1 = tmp
          (tmp << (n_2 + n_1)).shift
          tmp
        end.last
      end
    end

    private

    def validate(n)
      raise ArgumentError, "n must be a possitive integer" unless n.is_a?(Integer) && n >= 0
    end
  end
end

if $0 == __FILE__
  require 'benchmark'

  puts "using #{RUBY_ENGINE}-#{RUBY_VERSION}"

  Benchmark.bmbm do |bm|
    n = ARGV[0] && ARGV[0].to_i || 35
    bm.report("recu(#{n})") { puts Fib.recursive n }
    bm.report("loop(#{n})") { puts Fib.loop n }
  end
end
