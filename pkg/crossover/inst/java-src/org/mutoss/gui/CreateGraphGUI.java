package org.mutoss.gui;

import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.Rectangle;
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

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JSpinner;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.ListModel;
import javax.swing.SpinnerNumberModel;
import javax.swing.border.TitledBorder;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import org.af.commons.Localizer;
import org.af.commons.tools.OSTools;
import org.af.commons.widgets.validate.IntegerTextField;
import org.af.commons.widgets.validate.RealTextField;
import org.af.jhlir.call.RDataFrame;
import org.mutoss.config.Configuration;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class CreateGraphGUI extends JFrame implements WindowListener, ActionListener, ChangeListener, ListSelectionListener {
	
	Configuration conf = Configuration.getInstance();
	
	/**
	 * Constructor - you will not need to change things here
	 */
	public CreateGraphGUI() {		
		super("CROSS-OVER DESIGN SEARCH TOOL Version 0.1");
		//setIconImage((new ImageIcon(getClass().getResource("/org/mutoss/gui/graph/images/rjavaicon64.png"))).getImage());
		
		/* This Errorhandling should be uncommented for testing versions that should report errors:
		 if (!LoggingSystem.alreadyInitiated()) {
			LoggingSystem.init(
					"/org/mutoss/gui/commons-logging.properties",
					true,
					false,
					new ApplicationLog());
			ErrorHandler.init("rohmeyer@small-projects.de", "http://www.algorithm-forge.com/report/bugreport.php", true, true, ErrorDialogSGTK.class);
		}*/
		
		Locale.setDefault(Locale.ENGLISH);
		RControl.getRControl(true);
		
		RControl.getR().evalVoid(".st <- crossover:::buildSummaryTable()");
		RControl.getR().evalVoid("crossover:::loadAllDatasets()"); 
		
		makeContent();
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

	public String[] designs = new String[] {"anderson", "andersonPreece", "archdeacon", "atkinson3t", "atkinson4t", 
			"atkinson5t", "balaam3t", "balaam4t", "balaam5t", "balaam6t", 
			"bateJones5t", "bateJones8t", "berenblut3t", "berenblut4t", "berenblut5t", 
			"blaisdellRaghavarao6t", "blaisdellRaghavarao8t", "blaisdellRaghavarao9t", 
			"davisHall6ta", "davisHall6tb", "davisHall6tc", "davisHall7ta", 
			"davisHall7tb", "davisHall7tc", "davisHall8ta", "davisHall8tb", 
			"davisHall8tc", "davisHall9ta", "davisHall9tb", "davisHall9tc"};

	DesignSelectionPanel designPanel;
	
	private void makeContent() {
		JTabbedPane tabbedPane = new JTabbedPane();

		designPanel = new DesignSelectionPanel();
		tabbedPane.addTab("Catalogue", designPanel);
		tabbedPane.addTab("Algorithm Search", new JPanel());
		tabbedPane.addTab("Input own design", new JPanel());
		
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
	
	public JPanel getInterface() {
		JPanel panel = new JPanel();
		String cols = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, fill:pref:grow";
        String rows = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu";
        
        panel.setLayout(new FormLayout(cols, rows));
        CellConstraints cc = new CellConstraints();
		
		int row = 2;
		
		spinnerT = new JSpinner(new SpinnerNumberModel(8, 2, 100, 1));    	
    	spinnerT.addChangeListener(this);
    	
    	panel.add(new JLabel("Number of treatments:"), cc.xyw(2, row, 3));
        panel.add(spinnerT, cc.xy(6, row));
		
        row+=2;
		
    	spinnerP = new JSpinner(new SpinnerNumberModel(5, 1, 100, 1));    	
    	spinnerP.addChangeListener(this);
    	
    	panel.add(new JLabel("Number of periods:"), cc.xyw(2, row, 3));
        panel.add(spinnerP, cc.xy(6, row));		
		
        row+=2;
		
    	spinnerS1 = new JSpinner(new SpinnerNumberModel(7, 1, 100, 1));    	
    	spinnerS1.addChangeListener(this);
		
    	spinnerS2 = new JSpinner(new SpinnerNumberModel(10, 1, 100, 1));    	
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
		RControl.getR().eval("q(save=\"no\")");
	}
	public void windowActivated(WindowEvent e) {}
	public void windowClosed(WindowEvent e) {}
	public void windowDeactivated(WindowEvent e) {}
	public void windowDeiconified(WindowEvent e) {}
	public void windowIconified(WindowEvent e) {}
	public void windowOpened(WindowEvent e) {}
	

	public void stateChanged(ChangeEvent e) {
		int t = Integer.parseInt(spinnerT.getModel().getValue().toString());
		int p = Integer.parseInt(spinnerP.getModel().getValue().toString());
		int s1 = Integer.parseInt(spinnerS1.getModel().getValue().toString());
		int s2 = Integer.parseInt(spinnerS2.getModel().getValue().toString());
		RControl.getR().eval(".df <- .st[.st$s>="+s1+"&.st$s<="+s2+"&.st$t=="+t+"&.st$p=="+p+""+",]");
		int n = RControl.getR().eval("dim(.df)[1]").asRInteger().getData()[0];
		if (n>0) {
			int[] s = RControl.getR().eval(".df$s").asRInteger().getData();
			String[] dataset = RControl.getR().eval(".df$dataset").asRChar().getData();
			String[] title = RControl.getR().eval(".df$title").asRChar().getData();
			String[] reference = RControl.getR().eval(".df$reference").asRChar().getData();
			String[] signature = RControl.getR().eval(".df$signature").asRChar().getData();
			List<Design> list = new Vector<Design>();
			for (int i=0; i<n; i++) {
				String result = RControl.getR().eval("paste(capture.output(dput("+dataset[i]+")), collapse=\"\")").asRChar().getData()[0];
				Design design = new Design(title[i], reference[i], signature[i], t, s[i], p, result);
				list.add(design);
			}
			designPanel.setDesigns(list);
		}
	}

	/**
	 * Method to call from R
	 */
	public static void startGUI() {
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				new CreateGraphGUI();
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
		new CreateGraphGUI();
	}

	public void valueChanged(ListSelectionEvent e) {
		// TODO Auto-generated method stub
		
	}

}
