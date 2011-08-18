# encoding: utf-8

require 'java'

module YellowShoes
  class Shoes
    include_package 'javax.swing'

    def create_and_show_gui
      frame = JFrame.new "Xiao Bao Bei is a pig"
      frame.default_close_operation = JFrame::EXIT_ON_CLOSE
      frame.content_pane.add JLabel.new("小宝贝")
      frame.pack
      frame.visible = true
    end

    def initialize
      SwingUtilities.invokeLater {
        create_and_show_gui
      }
    end
  end
end

YellowShoes::Shoes.new

__END__
import javax.swing.*;        

public class HelloWorldSwing {
  /**
  * Create the GUI and show it.  For thread safety,
  * this method should be invoked from the
  * event-dispatching thread.
    */
    private static void createAndShowGUI() {
    //Create and set up the window.
    JFrame frame = new JFrame("HelloWorldSwing");
  frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

  //Add the ubiquitous "Hello World" label.
    JLabel label = new JLabel("Hello World");
  frame.getContentPane().add(label);

  //Display the window.
    frame.pack();
  frame.setVisible(true);
  }

  public static void main(String[] args) {
    //Schedule a job for the event-dispatching thread:
    //creating and showing this application's GUI.
    javax.swing.SwingUtilities.invokeLater(new Runnable() {
    public void run() {
    createAndShowGUI();
  }
  });
  }
}
