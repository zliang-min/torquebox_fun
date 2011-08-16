import org.jruby.embed.ScriptingContainer

val context = new ScriptingContainer
val h = context runScriptlet "{'jruby' => 'awesome', 'java' => 'sucks', 'scala' => 'rocks'}"

println(h.getClass())

val keys = h.getClass().getMethod("keys").invoke(h)
println(keys.getClass().getMethod("size").invoke(keys))

val script = """
require 'date'

class Person
  attr_accessor :name, :birthday, :energy

  def initialize(attributes = nil)
    attributes.each { |k, v| send "#{k}=", v } if attributes
    self.energy ||= 0
  end

  def say_hi
    "Hello, my name is #{name}"
  end

  def age
    Date.today.year - birthday.year
  end

  def hungry?
    energy < 50
  end

  def dead?
    energe <= 10
  end

  def work
    energy -= 60 unless dead?
  end

  def eat
    energy += 30 unless dead?
  end
end
"""

val receiver = context.parse(script).run()
val attrs = new java.util.HashMap[String, String](1, 1)
attrs.put("name", "Gimi")
val gimi = context.callMethod(context.get(receiver, "Person"), "new", attrs)
println(context.callMethod(gimi, "say_hi"))
