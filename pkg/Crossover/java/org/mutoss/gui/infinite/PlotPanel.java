package org.mutoss.gui.infinite;

import java.awt.Color;
import java.awt.Graphics;
import java.util.List;
import java.util.Vector;

import javax.swing.JPanel;

public class PlotPanel extends JPanel {
	
	List<SearchProgress> spl = new Vector<SearchProgress>();
	int pHeight = 200;
	public boolean cancel;
	
	public PlotPanel() {		
	}
	
	public void appendSearchProgress(SearchProgress sp) {
		spl.add(sp);
		repaint();
	}
	
	protected void paintComponent(Graphics g) {		
		if (cancel) {
			g.setColor(Color.RED);
			g.drawString("Stopping search - please wait.", 10, 10);
		} else {
			g.setColor(Color.BLUE);
			if (spl.size()>0) {
				SearchProgress sp = spl.get(spl.size()-1);
				//for (int i = 0; i <spl.size(); i++) {
				//	SearchProgress sp = spl.get(i);
				for (int i = 0; i <sp.maxEff.length; i++) {
					g.drawArc(i, (int)(200-sp.maxEff[i]*50), 2, 2, 0, 360);
				}
			}
		}
	}
	
}
