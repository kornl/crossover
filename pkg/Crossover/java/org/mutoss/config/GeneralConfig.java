package org.mutoss.config;

import java.io.File;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;
import java.util.Vector;

public class GeneralConfig extends SpecificConfig {

	/**
	 * Constructor - use Configuration.getInstance().getGeneralConfig() to access it.
	 * @param conf GeneralConfig object
	 */
    GeneralConfig(Configuration conf) {
        super(conf);        
    }

    public final static String DISABLE = "disable";

    public void setTempDir(String tempDir) {
        setProperty("tempdir", tempDir);
    }

    public String getTempDir() {
        String tmpDir = getProperty("tempdir", "");
        if (tmpDir.trim().equals("")) {
            tmpDir = System.getProperty("java.io.tmpdir");
        }
        return tmpDir;
    }

    public void setFontSize(int i) {
        setIntProperty("font.size", i);
    }

    public int getFontSize() {
        return getIntProperty("font.size", "12");
    }

    public void setGridSize(int grid) {
		setProperty("grid", ""+Math.max(grid, 1));		
	}
    
    public int getGridSize() {
    	int grid = Integer.parseInt(getProperty("grid", "50"));
		return Math.max(1, grid);		
	}

    public void setDigits(int digit) {
		setProperty("Digits", ""+digit);		
		setFormat();
	}
    
    public int getDigits() {
		return Integer.parseInt(getProperty("Digits", "4"));		
	}
    
    DecimalFormat format = null;
    
	public DecimalFormat getDecFormat() {
		if (format==null) {
			setFormat();
		} 
		return format;
	}
    
    private void setFormat() {
    	String s = "#.";
		for (int i=0; i < getDigits(); i++) {
			s = s + "#";
		}
		format = new DecimalFormat(s);		
	}

	public int getDigitsInTables() {
		return Integer.parseInt(getProperty("digits.in.tables", "6"));	
	}
	
	public boolean checkOnline() {
		return Boolean.parseBoolean(getProperty("checkOnline", "true"));
	}
	
	public void setCheckOnline(boolean checkOnline) {
		setProperty("checkOnline", ""+checkOnline);
	}	
	
	public boolean haveReadGPL() {
		return Boolean.parseBoolean(getProperty("haveReadGPL", "false"));
	}
	
	public void setHaveReadGPL(boolean checkOnline) {
		setProperty("haveReadGPL", ""+checkOnline);
	}
	
	public boolean tellAboutCheckOnline() {
		return Boolean.parseBoolean(getProperty("tellAboutCheckOnline", "false"));
	}
	
	public void setTellAboutCheckOnline(boolean checkOnline) {
		setProperty("tellAboutCheckOnline", ""+checkOnline);
	}
	
	public boolean reminderNewVersion() {
		return Boolean.parseBoolean(getProperty("reminderNewVersion", "true"));
	}
	
	public void setReminderNewVersion(boolean reminderNewVersion) {
		setProperty("reminderNewVersion", ""+reminderNewVersion);
	}
	
	public void setVersionNumber(String version) {
		setProperty("gMCPversion", version);
	}

	public String getVersionNumber() {
		return getProperty("gMCPversion", "<= 0.6.0");
	}
	
	public void setRVersionNumber(String version) {
		setProperty("Rversion", version);
	}

	public String getRVersionNumber() {
		return getProperty("Rversion", "unknown");
	}

	public void setRandomID() {
		setProperty("randomID", ""+Math.abs((new Random()).nextInt()));
	}

	public String getRandomID() {
		if (getProperty("randomID", "NOT_SET_YET").equals("NOT_SET_YET")) {
			setRandomID();
		}
		return getProperty("randomID");
	}
	
	public List<String> getLatestGraphs() {
		Vector<String> graphs = new Vector<String>(); 
		for (int i=0; i<4; i++) {
			String graph = getProperty("saved_graph_"+i, "NOT_SAVED_YET");
			if (graph.startsWith("R Object") || new File(graph).exists()) {
				graphs.add(graph);
			}
		}
		return graphs;
	}
	
	public void addGraph(String graph) {
		int i=1;
		for (; i<4; i++) {
			if (graph.equals(getProperty("saved_graph_"+(i-1), "NOT_SAVED_YET"))) break; 
		}
		for (i--; i>0; i--) {
			String g = getProperty("saved_graph_"+(i-1), "NOT_SAVED_YET");
			setProperty("saved_graph_"+i, g);			
		}
		setProperty("saved_graph_"+0, graph);		
	}

	public int getNumberOfStarts() {
		return Integer.parseInt(getProperty("NumberOfStarts", "0"));
	}

	public void setNumberOfStarts(int i) {
		setProperty("NumberOfStarts", ""+i);
	}

	public double getAccuracy() {
		return Double.parseDouble(getProperty("fractionAccuracy", "0.000001"));		
	}

	public void setExperimental(boolean b) {
		setProperty("experimentalFeatures", ""+b);
	}
	
	public boolean experimentalFeatures() {
		return Boolean.parseBoolean(getProperty("experimentalFeatures", "true"));
	}

	public void setVerbose(boolean b) {
		setProperty("verbose", ""+b);
	}
	
	public boolean verbose() {
		return Boolean.parseBoolean(getProperty("verbose", "true"));
	}
	
	public void setVariable(String variable, double value) {
		setProperty("Variable_"+variable, ""+value);		
	}
    
    public double getVariable(String variable) {
		return Double.parseDouble(getProperty("Variable_"+variable, "0.5"));		
	}

	public boolean simplify() {
		return Boolean.parseBoolean(getProperty("simplify", "false"));
	}

	/**
	 * Not used in the moment. (Number of Digits to assure)
	 * @return
	 */
	public int getDigits2() {
		return Integer.parseInt(getProperty("digits2", "6"));		
	}

	public void setSimplify(boolean b) {
		setProperty("simplify", ""+b);		
	}

	public void setDigits2(int digits2) {
		setProperty("digits2", ""+digits2);
	}

	public Integer getNumberOfSimulations() {
		return Integer.parseInt(getProperty("numberOfSimulations", "10000"));
	}

	public String getTypeOfRandom() {
		return getProperty("typeOfRandom", "quasirandom");
	}
	
	public void setNumberOfSimulations(int nr) {
		setProperty("numberOfSimulations", ""+nr);
	}
	
	public void setTypeOfRandom(String type) {
		setProperty("typeOfRandom", ""+type);
	}

	public boolean focusEqualsEdit() {
		return Boolean.parseBoolean(getProperty("focusEqualsEdit", "true"));
	}
	
	public void setFocusEqualsEdit(boolean b) {
		setProperty("focusEqualsEdit", ""+b);		
	}

	public boolean askWhenGraphIsNotSaved() {
		return Boolean.parseBoolean(getProperty("askWhenGraphIsNotSaved", "false"));
	}

	public void setAskForSaveDir(boolean b) {
		setProperty("askForSaveDir", ""+b);		
	}
	
	public boolean askForSaveDir() {
		return Boolean.parseBoolean(getProperty("askForSaveDir", "true"));
	}

	public void setSaveDir(String saveDir) {
        setProperty("savedir", saveDir);
    }

    public String getSaveDir() {    	
        String saveDir = getProperty("savedir", "NOT_SET");
        if (!new File(saveDir).exists()) return "NOT_SET";
        return saveDir;
    }
    
    /**
     * For example use
     * <pre> 
     * Sys.setenv(FAILSAFE="true")
 	 * </pre>
 	 * to activate failsafe mode.
     * @return
     */
    public Boolean failSafeMode() {
    	String failsafe = System.getenv("FAILSAFE");
    	if (failsafe==null) return false;
    	return Boolean.parseBoolean(failsafe);
    }
	
}
