require 'java'
require '/usr/local/src/download/swt-3.7/swt.jar'

import org.eclipse.swt.SWT

module YellowShoes
  class Shoes
    include_package 'org.eclipse.swt.widgets'

    class << self
      def app
        display = Display.new
        shell = Shell.new display
        label = Label.new shell, SWT::CENTER
        label.text = "SWT - #{SWT.platform} . #{SWT.version}"
        label.bounds = shell.client_area
        shell.open
        display.sleep if !display.read_and_dispatch while !shell.disposed?
        display.dispose
      end

      def background()
      end

      def para(text)
      end
    end
  end

  Shoes.app if $0 == __FILE__
end

