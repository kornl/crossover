package org.mutoss.gui.archive;

import java.util.Collection;
import java.util.List;
import java.util.Vector;

import org.mutoss.gui.Design;

public class DesignArchiveControl {
	DesignArchive searchResults;
	DesignArchive defaultEntered;
	public final static String SEARCH = "search";
	public final static String ENTERED = "entered";
	
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

	public void addEnteredDesign(Design design) {
		defaultEntered.addDesign(design);		
	}

	public List<Design> getDesigns(int t, int p, int s1, int s2, String string) {
		DesignArchive da = null;
		List<Design> result = new Vector<Design>();
		if (string.equals(SEARCH)) {
			da = searchResults;
		} else if (string.equals(ENTERED)) {
			da = defaultEntered;
		}
		for (Design d : da.designs) {
			if (d.t == t && d.p == p && d.s >= s1 && d.s <= s2) {
				result.add(d);
			}
		}
		return result;
	}
	
}
