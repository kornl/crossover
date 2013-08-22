package org.mutoss.gui.archive;

import java.io.File;
import java.util.List;
import java.util.Vector;

import org.mutoss.gui.Design;

public class GeneratedAndEnteredDesignArchive {
	
	List<Design> designs = new Vector<Design>();
	File file = null;
	
	public GeneratedAndEnteredDesignArchive() {
		
	}
	
	public void addDesign(Design design) {
		designs.add(design);
	}
	
	public void setFile(File file) {
		this.file = file;
	}
	
	public void save() {
		for (Design design : designs) {
			
		}
	}
	
}
