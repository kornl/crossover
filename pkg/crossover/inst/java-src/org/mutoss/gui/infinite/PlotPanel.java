package org.mutoss.gui.infinite;

import java.util.List;
import java.util.Vector;

import javax.swing.JPanel;

public class PlotPanel extends JPanel {
	
	List<SearchProgress> spl = new Vector<SearchProgress>();
	
	public PlotPanel() {		
	}
	
	public void appendSearchProgress(SearchProgress sp) {
		spl.add(sp);
	}
	
	
	
}
