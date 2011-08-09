# encoding: utf-8

class EchoSocket < TorqueBox::WebSockets::Processor
  def on_message(message)
    message
  end
end
