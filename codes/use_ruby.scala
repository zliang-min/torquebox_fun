import org.jruby.embed.ScriptingContainer

val context = new ScriptingContainer
val h = context runScriptlet "{'jruby' => 'awesome', 'java' => 'sucks', 'scala' => 'rocks'}"

println(h.getClass())

val keys = h.getClass().getMethod("keys").invoke(h)
println(keys.getClass().getMethod("size").invoke(keys))

val script = """
class FunWithJRuby
  def self.double(n)
    n * 2
  end
end

FunWithJRuby.double 100
"""

println(context.parse(script).run())
