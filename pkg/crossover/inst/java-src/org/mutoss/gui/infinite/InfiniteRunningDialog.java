package org.mutoss.gui.infinite;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JProgressBar;

import org.mutoss.gui.CrossoverGUI;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class InfiniteRunningDialog extends JDialog implements ActionListener {

	PlotPanel pp = new PlotPanel();
	String command;
	String models;
	InfiteSearchSwingWorker isw;
	JProgressBar jpb;
	CrossoverGUI gui;
	JButton stop = new JButton("Stop search");
	
	public InfiniteRunningDialog(CrossoverGUI gui, String command, String models) {
		super(gui, "Search progress");
		this.command = command;
		this.models = models;
		this.gui = gui;
		isw = new InfiteSearchSwingWorker(this);
		
		String cols = "5dlu, fill:pref:grow, 5dlu, pref, 5dlu";
        String rows = "5dlu, fill:200dlu:grow, 5dlu, pref, 5dlu, pref, 5dlu";
        
        FormLayout layout = new FormLayout(cols, rows);
        getContentPane().setLayout(layout);
        CellConstraints cc = new CellConstraints();
		
        int row = 2;
        
        getContentPane().add(pp, cc.xy(2, row));
        
        row += 2;
        
        jpb = new JProgressBar();
        jpb.setIndeterminate(true);
        
        stop.addActionListener(this);
        
        getContentPane().add(jpb, cc.xy(2, row));
        getContentPane().add(stop, cc.xy(4, row));
        
        isw = new InfiteSearchSwingWorker(this);
        isw.execute();
        
        pack();
        this.setLocationRelativeTo(gui);
        setVisible(true);
	}
	
	public void append(SearchProgress s) {
		pp.appendSearchProgress(s);		
	}

	public String getCommand() {		
		return command;
	}

	public void actionPerformed(ActionEvent e) {
		isw.cancel();
		pp.cancel = true;
		pp.repaint();
	}
	
	
	
}
