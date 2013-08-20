package org.mutoss.gui.infinite;

import java.awt.Color;
import java.awt.Graphics;
import java.util.List;
import java.util.Vector;

import javax.swing.JPanel;

public class PlotPanel extends JPanel {
	
	List<SearchProgress> spl = new Vector<SearchProgress>();
	int pHeight = 200;
	
	public PlotPanel() {		
	}
	
	public void appendSearchProgress(SearchProgress sp) {
		spl.add(sp);
		repaint();
	}
	
	protected void paintComponent(Graphics g) {
		g.setColor(Color.BLUE);
		for (int i = 0; i <spl.size(); i++) {
			SearchProgress sp = spl.get(i);
			g.drawArc(i, (int)(200-sp.maxEff*50), 2, 2, 0, 360);
		}
	}
	
}
