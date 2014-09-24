package org.mutoss.gui.archive;

import java.io.File;
import java.util.List;
import java.util.Vector;

import javax.swing.JFrame;

import org.mutoss.config.Configuration;
import org.mutoss.gui.Design;
import org.mutoss.gui.dialogs.ConfirmArchivePath;

public class DesignArchiveControl {
	DesignArchive searchResults;
	DesignArchive defaultEntered;
	public final static String SEARCH = "search";
	public final static String ENTERED = "entered";
	
	public boolean designsChanged = false;
	
	List<DesignArchive> archiveLibrary = new Vector<DesignArchive>();
	
	//TODO Let user choose File
	String searchResultsFile = null; 
	String defaultEnteredFile = null;
	
	public DesignArchiveControl() {
		String savedir = Configuration.getInstance().getGeneralConfig().getSaveDir();	
		if (!savedir.equals("NOT_SET")) {
			searchResultsFile = savedir+"/"+"searchResults.RData";
			defaultEnteredFile = savedir+"/"+"enteredDesigns.RData";
		}
		searchResults = new DesignArchive(searchResultsFile);
		defaultEntered = new DesignArchive(defaultEnteredFile);
	}	
	
	public void save(JFrame frame) {		
		String savedir = Configuration.getInstance().getGeneralConfig().getSaveDir();
		if (savedir.equals("NOT_SET") || Configuration.getInstance().getGeneralConfig().askForSaveDir()) {
			new ConfirmArchivePath(frame);
			Configuration.getInstance().getGeneralConfig().setAskForSaveDir(false);
		} 
		savedir = Configuration.getInstance().getGeneralConfig().getSaveDir();	
		if (!savedir.equals("NOT_SET")) {
			try {
				searchResults.file = new File(savedir+"/"+"searchResults.RData");
				defaultEntered.file = new File(savedir+"/"+"enteredDesigns.RData");
				
				searchResults.save();		
				defaultEntered.save();
				for (DesignArchive da : archiveLibrary) {
					da.save();
				}
				designsChanged = false;
			} catch (SaveException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void addSearchResult(Design design) {
		searchResults.addDesign(design);
		designsChanged = true;
	}

	public void addEnteredDesign(Design design) {
		defaultEntered.addDesign(design);
		designsChanged = true;
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
