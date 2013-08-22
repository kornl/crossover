package org.mutoss.gui;

import java.util.List;
import java.util.Vector;

import org.jdesktop.swingworker.SwingWorker;

public class FillTableWorker extends SwingWorker<Void, Void> {
	
	CrossoverGUI gui;
	List<Design> list = new Vector<Design>();
	
	public FillTableWorker(CrossoverGUI gui) {
		this.gui = gui;
	}
	
	protected Void doInBackground() throws Exception {
		int s1 = Integer.parseInt(gui.spinnerS1.getModel().getValue().toString());
		int s2 = Integer.parseInt(gui.spinnerS2.getModel().getValue().toString());
		int t = Integer.parseInt(gui.spinnerT.getModel().getValue().toString());
		int p = Integer.parseInt(gui.spinnerP.getModel().getValue().toString());
		if (gui.designPanel.jcbPackageArchive.isSelected()) {
			RControl.getR().eval(".df <- .st[.st$s>="+s1+"&.st$s<="+s2+"&.st$t=="+t+"&.st$p=="+p+""+",]");
			int n = RControl.getR().eval("dim(.df)[1]").asRInteger().getData()[0];		
			if (n>0) {
				int[] s = RControl.getR().eval(".df$s").asRInteger().getData();
				String[] dataset = RControl.getR().eval(".df$dataset").asRChar().getData();
				String[] title = RControl.getR().eval(".df$title").asRChar().getData();
				String[] reference = RControl.getR().eval(".df$reference").asRChar().getData();
				String[] signature = RControl.getR().eval(".df$signature").asRChar().getData();
				int[] tList = RControl.getR().eval(".df$t").asRInteger().getData();
				int[] pList = RControl.getR().eval(".df$p").asRInteger().getData();
				for (int i=0; i<n; i++) {
					String result = RControl.getR().eval("paste(capture.output(dput("+dataset[i]+")), collapse=\"\")").asRChar().getData()[0];
					Design design = new Design(title[i], dataset[i], reference[i], signature[i], tList[i], s[i], pList[i], result);
					list.add(design);
				}			
			}
		}
		if (gui.designPanel.jcbCrossdes.isSelected()) {
			list.addAll(CrossDes.getDesigns(t, p, s1, s2));
		}		
		return null;
	}  
	
	protected void done() {
		gui.designPanel.setDesigns(list);
		gui.designPanel.jta.clear();
		gui.glassPane.stop();
	}
}
