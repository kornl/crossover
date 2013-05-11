package org.mutoss.gui;

import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.File;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Locale;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JSpinner;
import javax.swing.JTabbedPane;
import javax.swing.SpinnerNumberModel;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import org.af.commons.errorhandling.ErrorHandler;
import org.af.commons.logging.ApplicationLog;
import org.af.commons.logging.LoggingSystem;
import org.af.commons.tools.OSTools;
import org.af.commons.widgets.InfiniteProgressPanel;
import org.af.commons.widgets.InfiniteProgressPanel.AbortListener;
import org.jdesktop.swingworker.SwingWorker;
import org.mutoss.config.Configuration;
import org.mutoss.gui.dialogs.ErrorDialogSGTK;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class CrossoverGUI extends JFrame implements WindowListener, ActionListener, ChangeListener, ListSelectionListener, AbortListener {
	 static { // Static initializer block to set the Locale
		 Locale.setDefault(Locale.ENGLISH);
		 JComponent.setDefaultLocale(Locale.ENGLISH);			 
	 };
	 
	Configuration conf = Configuration.getInstance();
	public InfiniteProgressPanel glassPane;
	
	public static final String[] models = new String[] {
			"Standard additive model",
			"Second-order carry-over effects",
			"Full set of interactions",
			"Self-adjacency model",
			"Placebo model",
			"No carry-over into self model",
			"Treatment decay model",
			"Proportionality model",
			//"No carry-over effects"
	};
	
	/**
	 * Constructor - you will not need to change things here
	 */
	public CrossoverGUI() {		
		super("CROSS-OVER DESIGN SEARCH TOOL");
		//setIconImage((new ImageIcon(getClass().getResource("/org/mutoss/gui/graph/images/rjavaicon64.png"))).getImage());
		
		// This Errorhandling should be uncommented for testing versions that should report errors:
		if (!LoggingSystem.alreadyInitiated()) {
			LoggingSystem.init(
					"/org/mutoss/gui/commons-logging-verbose.properties",
					true,
					false,
					new ApplicationLog());
			ErrorHandler.init("rohmeyer@small-projects.de", "http://www.algorithm-forge.com/report/bugreport.php", true, true, ErrorDialogSGTK.class);
		} 
		
		RControl.getRControl(true);
		
		/* Get and save R and gMCP version numbers */
		try {		
			Configuration.getInstance().getGeneralConfig().setRVersionNumber(RControl.getR().eval("paste(R.version$major,R.version$minor,sep=\".\")").asRChar().getData()[0]);
			Configuration.getInstance().getGeneralConfig().setVersionNumber(RControl.getR().eval("crossover:::crossoverVersion()").asRChar().getData()[0]);
			this.setTitle("CROSS-OVER DESIGN SEARCH TOOL "+Configuration.getInstance().getGeneralConfig().getVersionNumber());
		} catch (Exception e) {
			// This is no vital information and will fail for e.g. R 2.8.0, so no error handling here...
		}
		
		setIconImage((new ImageIcon(getClass().getResource("/org/mutoss/gui/rjavaicon64.png"))).getImage());
		
		RControl.getR().evalVoid(".st <- crossover:::buildSummaryTable()");
		RControl.getR().evalVoid("crossover:::loadAllDatasets()"); 

		glassPane = new InfiniteProgressPanel(this, "Calculating");
	    setGlassPane(glassPane);
	    glassPane.addAbortListener(this);
		
		makeContent();
		setJMenuBar(new MenuBarCrossover(this));
		pack();

		 // Place the frame in the middle of the screen with a border of inset = 50 pixel.
		int inset = 50;
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		setBounds(inset, inset,
				screenSize.width  - inset*2,
				screenSize.height - inset*2);

		addWindowListener(this);
		
		//loadDefaults();
		
		setVisible(true);
	}

	/** Two methods to set and save the default values */
	private String getValue(String key, String def) { return conf.getProperty(key, def); }
	private void setValue(String key, String value) { conf.setProperty(key, value); }

	DesignSelectionPanel designPanel;
	DesignInputPanel designInputPanel;
	AlgorithmPanel algorithmPanel;
	
	private void makeContent() {
		JTabbedPane tabbedPane = new JTabbedPane();

		designPanel = new DesignSelectionPanel();
		designInputPanel = new DesignInputPanel();
		designInputPanel.addActionListener(this);
		algorithmPanel = new AlgorithmPanel();
		tabbedPane.addTab("Catalogue", designPanel);
		tabbedPane.addTab("Algorithm Search", algorithmPanel);
		tabbedPane.addTab("Input own design", designInputPanel);
		
		GridBagConstraints c = new GridBagConstraints();
		c.fill = GridBagConstraints.BOTH;
		c.gridx=0; c.gridy=0; c.gridwidth = 1; c.gridheight = 1; c.ipadx=5; c.ipady=5; c.weightx=1; c.weighty=0;
		
		getContentPane().setLayout(new GridBagLayout());		
		
		getContentPane().add(getInterface(), c);
		c.gridy++;		 
		c.weighty=1;
		getContentPane().add(tabbedPane, c);	
		
		stateChanged(null);
	}
	
	JSpinner spinnerT;
	JSpinner spinnerP;
	JSpinner spinnerS1;
	JSpinner spinnerS2;
	
	final int maxSp = Integer.MAX_VALUE;
	
	public JPanel getInterface() {
		JPanel panel = new JPanel();
		String cols = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, fill:pref:grow";
        String rows = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu";
        
        panel.setLayout(new FormLayout(cols, rows));
        CellConstraints cc = new CellConstraints();
		
		int row = 2;
		
		spinnerT = new JSpinner(new SpinnerNumberModel(4, 2, maxSp, 1));    	
    	spinnerT.addChangeListener(this);
    	
    	panel.add(new JLabel("Number of treatments:"), cc.xyw(2, row, 3));
        panel.add(spinnerT, cc.xy(6, row));
		
        row+=2;
		
    	spinnerP = new JSpinner(new SpinnerNumberModel(4, 2, maxSp, 1));    	
    	spinnerP.addChangeListener(this);
    	
    	panel.add(new JLabel("Number of periods:"), cc.xyw(2, row, 3));
        panel.add(spinnerP, cc.xy(6, row));		
		
        row+=2;
		
    	spinnerS1 = new JSpinner(new SpinnerNumberModel(4, 2, maxSp, 1));    	
    	spinnerS1.addChangeListener(this);
		
    	spinnerS2 = new JSpinner(new SpinnerNumberModel(8, 2, maxSp, 1));    	
    	spinnerS2.addChangeListener(this);
    	
    	panel.add(new JLabel("Number of sequences:"), cc.xy(2, row));
    	panel.add(new JLabel("Min:"), cc.xy(4, row));
        panel.add(spinnerS1, cc.xy(6, row));
        panel.add(new JLabel("Max:"), cc.xy(8, row));
        panel.add(spinnerS2, cc.xy(10, row));
        
		return panel;
	}
	
	/**
	 * This function handles events from buttons, check boxes and combo boxes. 
	 */
	public void actionPerformed(ActionEvent e) {
	
	}
	
	/**
	 * This function builds the OC.bin/OC.ct function call.
	 * @param e
	 */
	private void callOCFunction(ActionEvent e) {
		String s = "";
		try {
					
		} catch (Exception exc) {
			JOptionPane.showMessageDialog(this, "An error ocurred with the following command:\n"+s+"\n\nError message:\n"+exc.getMessage(), "Error in calculation", JOptionPane.ERROR_MESSAGE);			
		}
	}

	/**
	 * Shows a file from a package
	 * @param s String like 
	 */
	public void showFile(String s) {
		File f = new File(RControl.getR().eval("system.file(\""+s+"\", package=\"crossover\")").asRChar().getData()[0]);
		if (!f.exists()) {
			throw new RuntimeException("This is strange. The file \""+s+"\" could not be found.");
		} else {
			try {	
				Method main = Class.forName("java.awt.Desktop").getDeclaredMethod("getDesktop");
				Object obj = main.invoke(new Object[0]);
				Method second = obj.getClass().getDeclaredMethod("open", new Class[] { File.class }); 
				second.invoke(obj, f);
			} catch (Exception exc) {			
				try {
					if (OSTools.isWindows()) {
						Process p;							
						p = Runtime.getRuntime().exec("rundll32 " +
								"url.dll,FileProtocolHandler " + f.getAbsolutePath());
						p.waitFor();
					} else {
						JOptionPane.showMessageDialog(this, "Please open and read the following file:\n"+f.getAbsolutePath(), "Could not find appropriate viewer", JOptionPane.WARNING_MESSAGE);
					}
				} catch (Exception e1) {					
					e1.printStackTrace();
					JOptionPane.showMessageDialog(this, "Please open and read the following file:\n"+f.getAbsolutePath(), "Could not find appropriate viewer", JOptionPane.WARNING_MESSAGE);
				}

			}
		}
	}

	/**
	 * WindowListener methods - the first one closes the R console if  
	 */
	public void windowClosing(WindowEvent e) {
		if (RControl.getR().eval("exists(\".isBundle\")").asRLogical().getData()[0]) {
			RControl.getR().eval("q(save=\"no\")");
		} else {
			System.exit(0);
		}
	}
	public void windowActivated(WindowEvent e) {}
	public void windowClosed(WindowEvent e) {}
	public void windowDeactivated(WindowEvent e) {}
	public void windowDeiconified(WindowEvent e) {}
	public void windowIconified(WindowEvent e) {}
	public void windowOpened(WindowEvent e) {}
	

	public void stateChanged(ChangeEvent e) {
		glassPane.start();
		//startTesting();		
		SwingWorker<Void, Void> worker = new SwingWorker<Void, Void>() {
			@Override
			protected Void doInBackground() throws Exception {
				int t = Integer.parseInt(spinnerT.getModel().getValue().toString());
				int p = Integer.parseInt(spinnerP.getModel().getValue().toString());
				int s1 = Integer.parseInt(spinnerS1.getModel().getValue().toString());
				int s2 = Integer.parseInt(spinnerS2.getModel().getValue().toString());
				//if (t==1 || p==1) return;
				RControl.getR().eval(".df <- .st[.st$s>="+s1+"&.st$s<="+s2+"&.st$t=="+t+"&.st$p=="+p+""+",]");
				//RControl.getR().eval(".df <- .st");
				int n = RControl.getR().eval("dim(.df)[1]").asRInteger().getData()[0];		
				List<Design> list = new Vector<Design>();
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
						Design design = new Design(title[i], reference[i], signature[i], tList[i], s[i], pList[i], result);
						list.add(design);
					}			
				}
				list.addAll(CrossDes.getDesigns(t, p, s1, s2));
				designPanel.setDesigns(list);
				glassPane.stop();				
				return null;
			}  
		};
		worker.execute();		
		
	}

	/**
	 * Method to call from R
	 */
	public static void startGUI() {
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				new CrossoverGUI();
			}
		});		
	}	
	
	/**
	 * Just for me for the development
	 * @param args
	 */
	public static void main(String[] args) {
		RControl.getR().eval(".setenv <- if (exists(\"Sys.setenv\")) Sys.setenv else Sys.putenv");
		RControl.getR().eval(".setenv(\"JAVAGD_CLASS_NAME\"=\"org/mutoss/gui/JavaGD\")");
		new CrossoverGUI();
	}

	public void valueChanged(ListSelectionEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void abort() {
		// TODO Auto-generated method stub
		
	}

}
