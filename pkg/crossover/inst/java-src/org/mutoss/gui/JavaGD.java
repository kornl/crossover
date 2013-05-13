package org.mutoss.gui;
import java.awt.Component;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.List;
import java.util.Vector;

import javax.swing.JFrame;

import org.rosuda.JRI.Rengine;
import org.rosuda.javaGD.GDInterface;
import org.rosuda.javaGD.JGDBufferedPanel;

public class JavaGD extends GDInterface implements WindowListener {

    JFrame f;
    
    public static List<JavaGD> devices = new Vector<JavaGD>();
   
    public static int inset = 70;
   
    public void gdOpen(double w, double h) {
        /*if (f!=null) gdClose();
        f = new JFrame("gsbDesign Plot");
        f.addWindowListener(this);*/      
        c = new JGDBufferedPanel(w, h);
        devices.add(this);
        /*f.getContentPane().add((Component) c);
        f.pack();
		// Place window in the middle of the screen with inset pixels space on the left and top.

		f.setBounds(inset, inset, (int)w, (int)h);
        
        f.setVisible(true);*/
    }
    
    public Component getPanel() {
    	return (Component) c;
    }
   
    public void gdClose() {
        super.gdClose();
        /*if (f!=null) {
            c=null;
            f.removeAll();
            f.dispose();
            f=null;
        }*/
    }

    public static void main(String[] args) {
        Rengine engine = new Rengine(new String[] {"--vanilla"}, true, null);      
        engine.eval(".setenv <- if (exists(\"Sys.setenv\")) Sys.setenv else Sys.putenv");
        engine.eval(".setenv(\"JAVAGD_CLASS_NAME\"=\"org.gsbgui.gui.JavaGD\")");
        engine.eval("library(JavaGD)");
        engine.eval("JavaGD()");
        engine.eval("plot(rnorm(100))");       
    }
   
    /** listener response to "Close" - effectively invokes <code>dev.off()</code> on the device */
    public void windowClosing(WindowEvent e) {
        if (c!=null) executeDevOff();
    }
    public void windowClosed(WindowEvent e) {}
    public void windowOpened(WindowEvent e) {}
    public void windowIconified(WindowEvent e) {}
    public void windowDeiconified(WindowEvent e) {}
    public void windowActivated(WindowEvent e) {}
    public void windowDeactivated(WindowEvent e) {}
}