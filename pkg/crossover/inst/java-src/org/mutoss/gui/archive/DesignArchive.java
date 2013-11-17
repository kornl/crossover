package org.mutoss.gui.archive;

import java.io.File;
import java.util.List;
import java.util.Vector;

import org.mutoss.gui.Design;
import org.mutoss.gui.RControl;

public class DesignArchive {
	
	List<Design> designs = new Vector<Design>();
	File file = null;
	String description = "";

	public DesignArchive(String file) {
		this(new File(file));
	}

	public DesignArchive(File file) {
		this.file = file;
		if (!file.exists()) {
			//TODO Warn
			return;
		}		
		String[] loadedDesigns = RControl.getR().eval("load(\""+file.getAbsolutePath().replaceAll("\\\\", "\\\\\\\\")+"\")").asRChar().getData();
		for (String s : loadedDesigns) {
			addDesign(new Design("Search Result", s));
		}
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void addDesign(Design design) {
		designs.add(design);
	}
	
	public void setFile(File file) {
		this.file = file;
	}
	
	public void save() throws SaveException {
		if (file==null) throw new SaveException("File is null!");
		String cmd = "save(";
		for (Design design : designs) {
			cmd = cmd + design.saveDesign2R() + ",";				
		}
		cmd = cmd+" file=\""+file.getAbsolutePath().replaceAll("\\\\", "\\\\\\\\")+"\")";
		RControl.getR().eval(cmd);
	}
	
}
