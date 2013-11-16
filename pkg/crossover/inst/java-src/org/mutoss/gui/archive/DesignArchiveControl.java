package org.mutoss.gui.archive;

import java.util.List;
import java.util.Vector;

import org.mutoss.gui.Design;
import org.mutoss.gui.RControl;

public class DesignArchiveControl {
	DesignArchive searchResults;
	DesignArchive defaultEntered;
	List<DesignArchive> archiveLibrary = new Vector<DesignArchive>();
	
	//TODO Let user choose File
	String searchResultsFile = System.getProperty("user.home")+"/"+"searchResults.RData";
	String defaultEnteredFile = System.getProperty("user.home")+"/"+"enteredDesigns.RData";
	
	public DesignArchiveControl() {
		searchResults = new DesignArchive(searchResultsFile);
		defaultEntered = new DesignArchive(defaultEnteredFile);
	}	
	
	public void save() {
		try {
			searchResults.save();		
			defaultEntered.save();
			for (DesignArchive da : archiveLibrary) {
				da.save();
			}
		} catch (SaveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void addSearchResult(Design design) {
		searchResults.addDesign(design);
	}
	
}
