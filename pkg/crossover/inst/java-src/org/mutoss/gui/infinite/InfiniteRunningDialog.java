package org.mutoss.gui.infinite;

import javax.swing.JDialog;
import javax.swing.JProgressBar;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class InfiniteRunningDialog extends JDialog {

	PlotPanel pp = new PlotPanel();
	String command;
	InfiteSearchSwingWorker isw;
	JProgressBar jpb;
	
	public InfiniteRunningDialog(String command) {
		this.command = command;
		isw = new InfiteSearchSwingWorker(this);
		
		String cols = "5dlu, fill:pref:grow, 5dlu, pref, 5dlu";
        String rows = "5dlu, fill:200dlu:grow, 5dlu, pref, 5dlu, pref, 5dlu";
        
        FormLayout layout = new FormLayout(cols, rows);
        getContentPane().setLayout(layout);
        CellConstraints cc = new CellConstraints();
		
        jpb = new JProgressBar();
        jpb.setIndeterminate(true);
        
	}
	
	public void append(SearchProgress s) {
		pp.appendSearchProgress(s);		
	}

	public String getCommand() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
