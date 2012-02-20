package org.mutoss.gui;

import java.awt.Font;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;

import org.mutoss.config.Configuration;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class DesignInputPanel extends JPanel implements KeyListener, ActionListener {
	
	JTextField jtTitle = new JTextField();
	JTextField jtReference = new JTextField();
	JButton ok = new JButton("Ready");
	JButton loadFile = new JButton("Load File");
	JTextArea jta;
	JLabel label = new JLabel();
	
	public DesignInputPanel() {
		String cols = "5dlu, fill:min:grow, 5dlu, fill:min:grow, 5dlu,";
        String rows = "5dlu, pref, 5dlu, fill:pref:grow, 5dlu, pref, 5dlu";
        
        FormLayout layout = new FormLayout(cols, rows);
        layout.setColumnGroups(new int[][]{ {2, 4} });

        setLayout(layout);
        CellConstraints cc = new CellConstraints();
		
		int row = 2;
    	
    	add(new JLabel("Please enter your design here:"), cc.xy(2, row));
        add(new JLabel(""), cc.xy(4, row));
		
        row+=2;
        
		jta = new JTextArea("");
		jta.setBorder(LineBorder.createBlackLineBorder());
		jta.setFont(new Font("Monospaced", Font.PLAIN, 12));
		jta.setLineWrap(false);		
		jta.setMargin(new Insets(4,4,4,4));
		jta.addKeyListener(this);
		
		add(new JScrollPane(jta), cc.xy(2, row));
		add(new JScrollPane(getRightSidePanel()), cc.xy(4, row));
		
		row+=2;
		
		loadFile.addActionListener(this);
		add(loadFile, cc.xy(2, row));
	}
	
	public JPanel getRightSidePanel() {
		JPanel panel = new JPanel();
		String cols = "5dlu, pref, 5dlu, fill:min:grow, 5dlu";
        String rows = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu";
        
        panel.setLayout(new FormLayout(cols, rows));
        CellConstraints cc = new CellConstraints();
		
		int row = 2;
    	
		panel.add(new JLabel("Title"), cc.xy(2, row));
		panel.add(jtTitle, cc.xy(4, row));
		
        row+=2;
        
        panel.add(new JLabel("Reference"), cc.xy(2, row));
		panel.add(jtReference, cc.xy(4, row));
		
        row+=2;
        
        panel.add(label, cc.xyw(2, row, 3));
        
        return panel;
	}
	
	public void addActionListener(ActionListener al) {
		ok.addActionListener(al);
	}
	
	public Design getDesign() {
		return null;
	}

	public void keyPressed(KeyEvent e) {}

	public void keyReleased(KeyEvent e) {
		try {
			String input = jta.getText();
			RControl.getR().evalVoid(".con <- textConnection(\""+input+"\")");
			RControl.getR().eval(".newDesign <- as.matrix(read.table(.con, header = FALSE))");
			int[] dim = RControl.getR().eval("dim(.newDesign)").asRInteger().getData(); 
			int t = RControl.getR().eval("length(levels(as.factor(.newDesign)))").asRInteger().getData()[0];	
			label.setText("p = "+dim[0]+", s = "+dim[1]+", t = "+t);
		} catch (Exception error) {
			label.setText("Design is not valid, please correct it.");
		}
	}

	public void keyTyped(KeyEvent e) {	}

	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == loadFile) {
			JFileChooser fc = new JFileChooser(Configuration.getInstance().getClassProperty(this.getClass(), "DesignDirectory"));		
			fc.setFileSelectionMode(JFileChooser.FILES_ONLY);			

	        int returnVal = fc.showOpenDialog(this);
	        if (returnVal == JFileChooser.APPROVE_OPTION) {
	        	File f = fc.getSelectedFile();
	        	Configuration.getInstance().setClassProperty(this.getClass(), "DesignDirectory", f.getParent());
	        	// load f
	        }
		}
		
	}
	
}
