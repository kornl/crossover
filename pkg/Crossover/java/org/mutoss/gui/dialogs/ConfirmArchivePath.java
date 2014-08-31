package org.mutoss.gui.dialogs;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JTextField;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class ConfirmArchivePath extends JDialog implements ActionListener {
	
	JButton save = new JButton("Ok");
	JButton dontsave = new JButton("Do not save designs");
	JTextField path = new JTextField();
	JButton selectPath = new JButton("Select Path");
	
	private static final Log logger = LogFactory.getLog(ConfirmArchivePath.class);
	
	public ConfirmArchivePath(JFrame p) {		
		super(p, "Confirm directory to save designs", true);	
		setUp();
		
	}
	
	public void actionPerformed(ActionEvent e) {
		if (e.getSource()==save) {
			
		} else if (e.getSource()==dontsave) {
			
		} else if (e.getSource()==selectPath) {
			JFileChooser fc;
			File p = new File (path.getText());
			if (p.exists() && p.isDirectory() ) {
				fc = new JFileChooser(p);
			} else {
				fc = new JFileChooser();
			}
			fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);    
			int returnVal = fc.showOpenDialog(this);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				File f = fc.getSelectedFile();
				path.setText(f.getAbsolutePath());
			}	
			return;
		}
		dispose();
	}
	
	private void setUp() {
		String cols = "5dlu, fill:pref:grow, 5dlu, pref, 5dlu, pref, 5dlu";
        String rows = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu";
        
        FormLayout layout = new FormLayout(cols, rows);
        getContentPane().setLayout(layout);
        CellConstraints cc = new CellConstraints();
		
		//getContentPane().add(jsp, cc.xyw(2, 2, 3));
		
		save.addActionListener(this);
		getContentPane().add(path, cc.xyw(2, 2, 2));
		path.setText(System.getProperty("user.home"));
		
		selectPath.addActionListener(this);
		getContentPane().add(selectPath, cc.xy(6, 2));       
			
		save.addActionListener(this);
		getContentPane().add(save, cc.xy(4, 6));
		
		dontsave.addActionListener(this);
		getContentPane().add(dontsave, cc.xy(6, 6));
		
		pack();
		setSize(800,600);
		setLocationRelativeTo(this.getParent());
		
		setVisible(true);
	}

}
