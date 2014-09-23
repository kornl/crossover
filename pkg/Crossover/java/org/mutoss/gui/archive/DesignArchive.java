package org.mutoss.gui.archive;

import java.io.File;
import java.util.List;
import java.util.Vector;

import javax.swing.JOptionPane;

import org.mutoss.config.Configuration;
import org.mutoss.gui.Design;
import org.mutoss.gui.RControl;

/**
 * The class DesignArchive has 
 * <ul>
 * <li>a list of designs,</li>
 * <li>a general description of the archive and</li>
 * <li>it contains and a specific file it should save these designs on request (methods save).</li> 
 * @author kornel
 */
public class DesignArchive {
	
	List<Design> designs = new Vector<Design>();
	File file = null;
	String description = "";

	public DesignArchive(String file) {
		this(file==null?null:new File(file));
	}

	public DesignArchive(File file) {
		this.file = file;
		if (file == null || !file.exists()) {
			//TODO Warn
			return;
		}		
		if (Configuration.getInstance().getGeneralConfig().failSafeMode()) {
			int answer = JOptionPane.showConfirmDialog(null, "Should the file\n"+file.getAbsolutePath()+"\nbe loaded?", "Load result files", JOptionPane.YES_NO_OPTION);
			if (answer == JOptionPane.NO_OPTION) return;
		}
		String[] loadedDesigns = RControl.getR().eval("load(\""+file.getAbsolutePath().replaceAll("\\\\", "\\\\\\\\")+"\")").asRChar().getData();
		for (String s : loadedDesigns) {
			String title = "Unknown";
			String reference = null;
			String rName = "design";
			try {
				rName = RControl.getR().eval("attr("+s+",\"rName\")").asRChar().getData()[0];
				if (rName==null) title = "design";
				title = RControl.getR().eval("attr("+s+",\"title\")").asRChar().getData()[0];
				if (title==null) title = "Unkown";
				reference = RControl.getR().eval("attr("+s+",\"reference\")").asRChar().getData()[0];				
			} catch(Exception e) {
				//TODO Do we want to do something? We have defaults...
			}
			RControl.getR().eval(rName+" <- "+s);
			addDesign(new Design(title, rName, reference));
		}
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	void addDesign(Design design) {
		designs.add(design);
	}
	
	public void setFile(File file) {
		this.file = file;
	}
	
	public void save() throws SaveException {
		if (file==null) throw new SaveException("File is null!");
		String cmd = "save(";
		for (Design design : designs) {
			cmd = cmd + design.saveDesign2R(false) + ",";				
		}
		cmd = cmd+" file=\""+file.getAbsolutePath().replaceAll("\\\\", "\\\\\\\\")+"\")";
		RControl.getR().eval(cmd);
	}
	
}
