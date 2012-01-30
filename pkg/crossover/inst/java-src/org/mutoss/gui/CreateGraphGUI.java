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
import java.util.Locale;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import org.af.commons.Localizer;
import org.af.commons.tools.OSTools;
import org.af.commons.widgets.validate.IntegerTextField;
import org.af.commons.widgets.validate.RealTextField;
import org.mutoss.config.Configuration;

public class CreateGraphGUI extends JFrame implements WindowListener, ActionListener, ChangeListener {
	
	Configuration conf = Configuration.getInstance();
	
	/**
	 * Constructor - you will not need to change things here
	 */
	public CreateGraphGUI() {		
		super("QTD (Quantitative Trial Design) GUI Version 1.1");
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
		Localizer.getInstance().addResourceBundle("org.mutoss.gui.ResourceBundle");		
		
		makeContent();
		pack();

		Dimension dim = getToolkit().getScreenSize();
		Rectangle bounds = getBounds();
		setLocation((dim.width - bounds.width) / 2, (dim.height - bounds.height) / 2);

		addWindowListener(this);
		
		loadDefaults();
		
		setVisible(true);
	}
	
	/** Two methods to set and save the default values */
	private String getValue(String key, String def) { return conf.getProperty(key, def); }
	private void setValue(String key, String value) { conf.setProperty(key, value); }
	
	private void makeContent() {
		JTabbedPane tabbedPane = new JTabbedPane();

		JPanel topPanel = getTopPanel();
		
		JPanel panelcont = getContPanel();
		tabbedPane.addTab("Continuous endpoint", panelcont);

		JPanel panelbinary = getBinPanel();
		tabbedPane.addTab("Binary endpoint", panelbinary);
		
		GridBagConstraints c = new GridBagConstraints();
		c.fill = GridBagConstraints.BOTH;
		c.gridx=0; c.gridy=0; c.gridwidth = 1; c.gridheight = 1; c.ipadx=5; c.ipady=5; c.weightx=1; c.weighty=0;
		
		getContentPane().setLayout(new GridBagLayout());		
		
		getContentPane().add(topPanel, c);
		c.gridy++;		 
		c.weighty=1;
		getContentPane().add(tabbedPane, c);	
		
		c.gridy++;		 
		c.weighty=0;
		getContentPane().add(getButtonPane(), c);	
	}
	
	private JPanel getButtonPane() {
		GridBagConstraints c = new GridBagConstraints();
		c.fill = GridBagConstraints.HORIZONTAL;
		c.gridx=0; c.gridy=0; c.gridwidth = 1; c.gridheight = 1; c.ipadx=5; c.ipady=5; c.weightx=2; c.weighty=1;
		
		JPanel panel = new JPanel(new GridBagLayout());
		
		panel.add(jbManual, c);
		jbManual.addActionListener(this);
		c.gridx++;
		panel.add(jbClear, c);
		jbClear.addActionListener(this);
		c.gridx++;
		panel.add(jbExit, c);
		jbExit.addActionListener(this);
		
		return panel;
	}

	JButton jbExit = new JButton("Exit");
	JButton jbManual = new JButton("Manual");
	JButton jbClear = new JButton("Clear");
	JButton binGO = new JButton("Produce Output");
	
	IntegerTextField[][] binSampleSize = new IntegerTextField[6][2];
	JCheckBox[] binUseThis = new JCheckBox[6];
	JComboBox fieldSeparator = new JComboBox( new String[] {";", ","}); 
	JComboBox binInc = new JComboBox( new String[] {"No", "Yes"}); 
	RealTextField binTD = new RealTextField("TD", -100, 100, true, true);
	RealTextField binMAD = new RealTextField("MAD", -100, 100, true, true);
	RealTextField binUB = new RealTextField("UB", 0, 100, false, false);
	RealTextField binLB = new RealTextField("LB", 0, 100, false, false);
	RealTextField binCR = new RealTextField("CR", 0, 100, true, true);
	RealTextField binRange1 = new RealTextField("range1", 0, 100, true, false);
	RealTextField binRange2 = new RealTextField("range2", 0, 100, false, true);
	JLabel madLabel = new JLabel("Minimum Acceptable Difference: MAD ( MAD ≤ TD) in %:");
	
	JButton CTGO = new JButton("Produce Output");
	IntegerTextField[][] CTsampleSize = new IntegerTextField[6][2];
	JCheckBox[] CTuseThis = new JCheckBox[6];
	RealTextField CTTD = new RealTextField("TD");
	RealTextField CTMAD = new RealTextField("MAD");
	RealTextField CTUB = new RealTextField("UB", 0, 100, false, false);
	RealTextField CTLB = new RealTextField("LB", 0, 100, false, false);
	RealTextField CTSD = new RealTextField("SD");
	RealTextField CTrange1 = new RealTextField("range1");
	RealTextField CTrange2 = new RealTextField("range2");
	JCheckBox savePlot = new JCheckBox("Plot");
	JCheckBox saveData = new JCheckBox("Data");
	JTextField projectName = new JTextField("New Project");
	JRadioButton cat3 = new JRadioButton("3");
	JRadioButton cat6 = new JRadioButton("6");
	JButton jbOutputPath = new JButton("Output path:");
	JTextField outputPath = new JTextField(System.getProperty("user.home"), 30);
	
	private void loadDefaults() {
		binTD.setText(getValue("binTD", "100"));
		binMAD.setText(getValue("binMAD", "0"));
		binUB.setText(getValue("binUB", "90"));
		binLB.setText(getValue("binLB", "20"));
		binCR.setText(getValue("binCR", "100"));
		binRange1.setText(getValue("binRange1", "0"));
		binRange2.setText(getValue("binRange2", "100"));
		
		CTTD.setText(getValue("CTTD", "100"));
		CTMAD.setText(getValue("CTMAD", "0"));
		CTUB.setText(getValue("CTUB", "90"));
		CTLB.setText(getValue("CTLB", "20"));
		CTSD.setText(getValue("CTCR", "200"));
		CTrange1.setText(getValue("CTrange1", "0"));
		CTrange2.setText(getValue("CTrange2", "200"));
		
		savePlot.setSelected(Boolean.parseBoolean(getValue("savePlot", "false")));
		saveData.setSelected(Boolean.parseBoolean(getValue("saveData", "false")));
		cat6.setSelected(Boolean.parseBoolean(getValue("cat6", "false")));
		fieldSeparator.setSelectedIndex(getValue("fieldSeparator", ";").equals(";")?0:1);
		
		binInc.setSelectedItem(getValue("binInc", "No"));		
		
		String path = getValue("outputPath", "");
		if (path.length()==0 || !(new File(path).exists())) {
			path = System.getProperty("user.home");
			File nvPath = new File("H:\\DATA");
			if (nvPath.exists() && nvPath.isDirectory()) {
				path = nvPath.getAbsolutePath();				
			}	
		}
		outputPath.setText(path);		
		
		for (int i=0; i<6; i++) {
			if (i>0) { 
				binUseThis[i].setSelected(Boolean.parseBoolean(getValue("binUseThis"+i, "false")));
				CTuseThis[i].setSelected(Boolean.parseBoolean(getValue("CTuseThis"+i, "false")));
			}
			for (int j=0; j<2; j++) {
				binSampleSize[i][j].setText(getValue("binSampleSize"+i+j, ""+(50+i*10+j*10)));
				CTsampleSize[i][j].setText(getValue("CTsampleSize"+i+j, ""+(50+i*10+j*10)));								
			}
		}
	}
	
	private void saveDefaults() {
		setValue("binTD", binTD.getText());
		setValue("binMAD", binMAD.getText());
		setValue("binUB", binUB.getText());
		setValue("binLB", binLB.getText());
		setValue("binCR", binCR.getText());
		setValue("binRange1", binRange1.getText());
		setValue("binRange2", binRange2.getText());
		
		setValue("CTTD", CTTD.getText());
		setValue("CTMAD", CTMAD.getText());
		setValue("CTUB", CTUB.getText());
		setValue("CTLB", CTLB.getText());
		setValue("CTSD", CTSD.getText());
		setValue("CTrange1", CTrange1.getText());
		setValue("CTrange2", CTrange2.getText());
		
		setValue("outputPath", outputPath.getText());
		
		setValue("binInc", binInc.getSelectedItem().toString());
		
		setValue("savePlot", ""+savePlot.isSelected());
		setValue("saveData", ""+saveData.isSelected());
		setValue("cat6", ""+cat6.isSelected());
		setValue("fieldSeparator", fieldSeparator.getSelectedItem().toString());
		
		for (int i=0; i<6; i++) {
			if (i>0) { 
				setValue("binUseThis"+i, ""+binUseThis[i].isSelected());
				setValue("CTuseThis"+i, ""+CTuseThis[i].isSelected());
			}
			for (int j=0; j<2; j++) {
				setValue("binSampleSize"+i+j, binSampleSize[i][j].getText());
				setValue("CTsampleSize"+i+j, CTsampleSize[i][j].getText());				
			}
		}
		conf.flush();
	}
	
	private JPanel getBinPanel() {
		JPanel panel2 = new JPanel(new GridBagLayout());

		GridBagConstraints c2 = new GridBagConstraints();
		c2.fill = GridBagConstraints.HORIZONTAL;
		c2.gridx=0; c2.gridy=0; c2.gridwidth = 1; c2.gridheight = 1; c2.ipadx=5; c2.ipady=5; c2.weightx=2; c2.weighty=1;
				
		GridBagConstraints c = new GridBagConstraints();
		c.fill = GridBagConstraints.HORIZONTAL;
		c.gridx=0; c.gridy=0; c.gridwidth = 1; c.gridheight = 1; c.ipadx=5; c.ipady=5; c.weightx=2; c.weighty=1;
		
		JPanel panel = new JPanel(new GridBagLayout());
		
		panel.add(new JLabel("Target difference in %:"), c);
		c.gridx++;c.weightx=1;
		binTD.setText("100");c.gridwidth=2;
		panel.add(binTD, c);c.gridwidth=1;
		c.gridx=0;c.weightx=2; c.gridy++;
		
		panel.add(new JLabel("Increasing response benefits the subject?"), c);
		c.gridx++;c.weightx=1;
		binInc.setSelectedIndex(0);c.gridwidth=2;
		binInc.addActionListener(this);
		panel.add(binInc, c);c.gridwidth=1;	
		c.gridx++;c.gridx++;c.weightx=2; c.gridy++;	c.gridx=0;	
		
		panel.add(madLabel, c);
		c.gridx++;c.weightx=1;
		binMAD.setText("0");c.gridwidth=2;
		panel.add(binMAD, c);c.gridwidth=1;	
		c.gridx++;c.gridx++;c.weightx=2;		 
		
		TitledBorder title = BorderFactory.createTitledBorder("Specified in the TPP based on the competitive landscape.");
		panel.setBorder(title);		
		panel2.add(panel, c2); c2.gridy++;		
		
		panel = new JPanel(new GridBagLayout());
		c.gridx=0; c.gridy=0;
		
		panel.add(new JLabel("Expected Drug Response (range) in %:"), c);
		c.gridx++;c.weightx=1;
		binRange1.setText("0");
		panel.add(binRange1, c);
		c.gridx++;
		binRange2.setText("100");
		panel.add(binRange2, c);		
		c.gridx++;c.weightx=2;
		c.gridx=0; c.gridy++;
		
		panel.add(new JLabel("Expected Comparator Response in %:"), c);
		c.gridx++;c.weightx=1;
		binCR.setText("100");c.gridwidth=2;
		panel.add(binCR, c);c.gridwidth=1;
		c.gridx++;c.gridx++;c.weightx=2;
		c.gridx=0; c.gridy++; 
		
		title = BorderFactory.createTitledBorder("Trial Assumptions");
		panel.setBorder(title);		
		panel2.add(panel, c2); c2.gridy++;
		c.gridx=0; c.gridy=0;
		
		panel = new JPanel(new GridBagLayout());
		c.gridx=0; c.gridy=0;
		
		c.weighty=0;
		panel.add(new JLabel("N per group:"), c);
		c.gridx++;
		panel.add(new JLabel("control"), c);
		c.gridx++;
		panel.add(new JLabel("drug"), c);
		c.gridx++;			
		c.gridy++;	
		
		for (int i=0; i<6; i++) {
			c.gridx=0;
			if (i>0) { 
				binUseThis[i] = new JCheckBox("Use also this setting", false);
				binUseThis[i].addChangeListener(this);
				panel.add(binUseThis[i], c);	
			}
			c.gridx=1;
			binSampleSize[i][0] = new IntegerTextField("", 0, Integer.MAX_VALUE);
			binSampleSize[i][0].setText(""+(50+i*10));
			if (i>0) binSampleSize[i][0].setEnabled(false);
			panel.add(binSampleSize[i][0], c);	
			c.gridx=2;
			binSampleSize[i][1] = new IntegerTextField("", 0, Integer.MAX_VALUE);
			binSampleSize[i][1].setText(""+(60+i*10));
			if (i>0) binSampleSize[i][1].setEnabled(false);
			panel.add(binSampleSize[i][1], c);
			c.gridy++;
		}
		c.weighty=1;
		c.gridx=0;
		
		title = BorderFactory.createTitledBorder("Function of trial assumptions");
		panel.setBorder(title);		
		panel2.add(panel, c2); c2.gridy++;		
		
		panel = new JPanel(new GridBagLayout());
		c.gridx=0; c.gridy=0;
		
		panel.add(new JLabel("CI Upper Bound (LB < UB < 100):"), c);
		c.gridx++;c.weightx=1;
		binUB.setText("90");c.gridwidth=2;
		panel.add(binUB, c);	c.gridwidth=1;	
		c.gridx++;c.gridx++;c.weightx=2;
		c.gridx=0; c.gridy++;
		
		panel.add(new JLabel("CI Lower Bound (0 < LB < UB):"), c);
		c.gridx++;c.weightx=1;
		binLB.setText("20");c.gridwidth=2;
		panel.add(binLB, c);	c.gridwidth=1;	
		c.gridx++;c.gridx++;c.weightx=2;
		
		title = BorderFactory.createTitledBorder("Level of certainty needed when making the various decisions");
		panel.setBorder(title);		
		panel2.add(panel, c2); c2.gridy++;
		
		binGO.addActionListener(this);
		panel2.add(binGO, c2);
		
		panel2.setBorder(BorderFactory.createEmptyBorder(15,5,15,5));
		
		return panel2;
	}

	private JPanel getContPanel() {
		JPanel panel2 = new JPanel(new GridBagLayout());

		GridBagConstraints c2 = new GridBagConstraints();
		c2.fill = GridBagConstraints.HORIZONTAL;
		c2.gridx=0; c2.gridy=0; c2.gridwidth = 1; c2.gridheight = 1; c2.ipadx=5; c2.ipady=5; c2.weightx=2; c2.weighty=1;
				
		GridBagConstraints c = new GridBagConstraints();
		c.fill = GridBagConstraints.HORIZONTAL;
		c.gridx=0; c.gridy=0; c.gridwidth = 1; c.gridheight = 1; c.ipadx=5; c.ipady=5; c.weightx=2; c.weighty=1;
		
		JPanel panel = new JPanel(new GridBagLayout());
		
		panel.add(new JLabel("Target difference:"), c);
		c.gridx++;c.weightx=1;
		CTTD.setText("100");c.gridwidth=2;
		panel.add(CTTD, c);c.gridwidth=1;
		c.gridx=0;c.weightx=2; c.gridy++;
		
		panel.add(new JLabel("Minimum Acceptable Difference: MAD ( MAD ≤ TD):"), c);
		c.gridx++;c.weightx=1;
		CTMAD.setText("0");c.gridwidth=2;
		panel.add(CTMAD, c);c.gridwidth=1;	
		c.gridx++;c.gridx++;c.weightx=2;		 
		
		TitledBorder title = BorderFactory.createTitledBorder("Specified in the TPP based on the competitive landscape.");
		panel.setBorder(title);		
		panel2.add(panel, c2); c2.gridy++;		
		
		panel = new JPanel(new GridBagLayout());
		c.gridx=0; c.gridy=0;
		
		panel.add(new JLabel("Expected Drug/Comparator Effect Difference (range):"), c);
		c.gridx++;c.weightx=1;
		CTrange1.setText("0");
		panel.add(CTrange1, c);
		c.gridx++;
		CTrange2.setText("200");
		panel.add(CTrange2, c);		
		c.gridx++;c.weightx=2;
		c.gridx=0; c.gridy++;
		
		panel.add(new JLabel("Standard Deviation:"), c);
		c.gridx++;c.weightx=1;
		CTSD.setText("200");c.gridwidth=2;
		panel.add(CTSD, c);c.gridwidth=1;
		c.gridx++;c.gridx++;c.weightx=2;
		c.gridx=0; c.gridy++; 
		
		title = BorderFactory.createTitledBorder("Trial Assumptions");
		panel.setBorder(title);		
		panel2.add(panel, c2); c2.gridy++;
		c.gridx=0; c.gridy=0;
		
		panel = new JPanel(new GridBagLayout());
		c.gridx=0; c.gridy=0;
		
		c.weighty=0;
		panel.add(new JLabel("N per group:"), c);
		c.gridx++;
		panel.add(new JLabel("control"), c);
		c.gridx++;
		panel.add(new JLabel("drug"), c);
		c.gridx++;			
		c.gridy++;	
		
		for (int i=0; i<6; i++) {
			c.gridx=0;
			if (i>0) { 
				CTuseThis[i] = new JCheckBox("Use also this setting", false);
				CTuseThis[i].addChangeListener(this);
				panel.add(CTuseThis[i], c);	
			}
			c.gridx=1;
			CTsampleSize[i][0] = new IntegerTextField("", 0, Integer.MAX_VALUE);
			CTsampleSize[i][0].setText(""+(50+i*10));
			if (i>0) CTsampleSize[i][0].setEnabled(false);
			panel.add(CTsampleSize[i][0], c);	
			c.gridx=2;
			CTsampleSize[i][1] = new IntegerTextField("", 0, Integer.MAX_VALUE);
			CTsampleSize[i][1].setText(""+(60+i*10));
			if (i>0) CTsampleSize[i][1].setEnabled(false);
			panel.add(CTsampleSize[i][1], c);
			c.gridy++;
		}
		c.weighty=1;
		c.gridx=0;
		
		title = BorderFactory.createTitledBorder("Function of trial assumptions");
		panel.setBorder(title);		
		panel2.add(panel, c2); c2.gridy++;		
		
		panel = new JPanel(new GridBagLayout());
		c.gridx=0; c.gridy=0;
		
		panel.add(new JLabel("CI Upper Bound (LB < UB < 100):"), c);
		c.gridx++;c.weightx=1;
		CTUB.setText("90");c.gridwidth=2;
		panel.add(CTUB, c);	c.gridwidth=1;	
		c.gridx++;c.gridx++;c.weightx=2;
		c.gridx=0; c.gridy++;
		
		panel.add(new JLabel("CI Lower Bound (0 < LB < UB):"), c);
		c.gridx++;c.weightx=1;
		CTLB.setText("20");c.gridwidth=2;
		panel.add(CTLB, c);	c.gridwidth=1;	
		c.gridx++;c.gridx++;c.weightx=2;
		
		title = BorderFactory.createTitledBorder("Level of certainty needed when making the various decisions");
		panel.setBorder(title);		
		panel2.add(panel, c2); c2.gridy++;
		
		CTGO.addActionListener(this);
		panel2.add(CTGO, c2);
		
		panel2.setBorder(BorderFactory.createEmptyBorder(15,5,15,5));
		
		return panel2;
	}
	
	private JPanel getTopPanel() {
		JPanel panel = new JPanel(new GridBagLayout());
		
		ButtonGroup group = new ButtonGroup();
	    group.add(cat3);
	    group.add(cat6);
	    cat3.setSelected(true);

		GridBagConstraints c = new GridBagConstraints();
		c.fill = GridBagConstraints.HORIZONTAL;
		c.insets = new Insets(3, 3, 3, 3);
		c.gridx=0; c.gridy=0; c.gridwidth = 1; c.gridheight = 1; c.ipadx=1; c.ipady=1; c.weightx=0; c.weighty=1;
		
		panel.add(new JLabel("Project name:"), c);
		c.gridx++; c.weightx=1;
		panel.add(projectName, c);
		c.gridx++; c.weightx=0;
		c.gridwidth=1;
		panel.add(new JLabel("  No of categories:"), c);
		c.gridx++;
		panel.add(cat3, c);
		c.gridx++;
		panel.add(cat6, c);
		c.gridx=0;
		c.gridy++;
		
		panel.add(jbOutputPath, c);		
		jbOutputPath.addActionListener(this);
		c.gridx++; c.weightx=1;
		panel.add(outputPath, c);
		c.gridx++; c.weightx=0;
		panel.add(new JLabel("  Save:"), c);
		c.gridx++;
		panel.add(savePlot, c);
		c.gridx++;
		panel.add(saveData, c);	
		c.gridy++;
		c.gridx=2;
		panel.add(new JLabel("  Field Separator"), c);
		c.gridx++;
		panel.add(fieldSeparator, c);
		panel.setBorder(BorderFactory.createEmptyBorder(10,5,10,5));
		return panel;
	}

	/**
	 * This function handles events from buttons, check boxes and combo boxes. 
	 */
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == jbClear) { /** ClearButton */
			for (int i=0; i<6; i++) {
				binSampleSize[i][0].setText("");
				binSampleSize[i][1].setText("");
				CTsampleSize[i][0].setText("");
				CTsampleSize[i][1].setText("");
			}
			binTD.setText("");
			binMAD.setText("");
			binUB.setText("");
			binLB.setText("");
			binCR.setText("");
			binRange1.setText("");
			binRange2.setText("");
			
			CTTD.setText("");
			CTMAD.setText("");
			CTUB.setText("");
			CTLB.setText("");
			CTSD.setText("");
			CTrange1.setText("");
			CTrange2.setText("");			
			return;
		}
		if (e.getSource() == jbExit) { /** ExitButton */
			windowClosing(null);
			return;
		}
		if (e.getSource() == jbManual) { /** ManualButton */
			showFile("manual.pdf");       
			return;
		}
		if (e.getSource() == jbOutputPath) { /** Button for selecting OutputPath */
			JFileChooser fc = new JFileChooser();
			fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);    
			int returnVal = fc.showOpenDialog(this);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				File f = fc.getSelectedFile();
				outputPath.setText(f.getAbsolutePath());
			}	
			return;
		}	
		if (e.getSource() == binInc) {
		/*	if (binInc.getSelectedIndex()==0) {
				madLabel.setText("Minimum Acceptable Difference: MAD ( MAD ≤ TD) in %:");
			} else {
				madLabel.setText("Minimum Acceptable Difference: MAD ( MAD >= TD) in %:");
			}*/
			return;
		}
		callOCFunction(e);		
	}
	
	/**
	 * This function builds the OC.bin/OC.ct function call.
	 * @param e
	 */
	private void callOCFunction(ActionEvent e) {
		if (!e.getSource().equals(CTGO) && !e.getSource().equals(binGO)) return;
		saveDefaults();
		String main = projectName.getText();
		String file = "NULL";
		String file2 = "NULL";
		String plotfile = "NULL";
		if (saveData.isSelected() || savePlot.isSelected()) {
			if (!new File(outputPath.getText()).exists()) {
				JOptionPane.showMessageDialog(this, "Output directory does not exist:\n"+outputPath.getText(), "Output directory does not exist", JOptionPane.ERROR_MESSAGE);
				return;
			}						
		}
		if (saveData.isSelected() || savePlot.isSelected()) {			
			int i;
			for (i=1; new File(new File(outputPath.getText()), main+"_data_"+i+".csv").exists() ||
			 			  new File(new File(outputPath.getText()), main+"_plot_"+i+".png").exists(); i++) {}
			if (saveData.isSelected()) {
				file = new File(new File(outputPath.getText()), main+"_data_"+i+".csv").getAbsolutePath();
				file2 = new File(new File(outputPath.getText()), main+"_table_"+i+".csv").getAbsolutePath();
			}
			if (savePlot.isSelected()) plotfile = new File(new File(outputPath.getText()), main+"_plot_"+i+".png").getAbsolutePath();
			plotfile = plotfile.replace("\\", "/");
			file = file.replace("\\", "/");
			file2 = file2.replace("\\", "/");
		} 
		String s = "";
		if (e.getSource().equals(CTGO)) {
			if (CTrange1.getValue()>=CTrange2.getValue()) {
				JOptionPane.showMessageDialog(this, "First value for range must be less then second value!", "First value for range must be less then second value", JOptionPane.ERROR_MESSAGE);
				return;
			}
			if (CTLB.getValue()>=CTUB.getValue()) {
				JOptionPane.showMessageDialog(this, "Lower bound must be less then upper bound!", "Lower bound must be less then upper bound", JOptionPane.ERROR_MESSAGE);
				return;
			}
			if (CTMAD.getValue()>CTTD.getValue()) {
				JOptionPane.showMessageDialog(this, "MAD must be less or equal to TD!", "MAD must be less or equal to TD", JOptionPane.ERROR_MESSAGE);
				return;
			}			
			s = "OC.ct(";		
			s += "nmat=rbind(c("+CTsampleSize[0][0].getValue()+","+CTsampleSize[0][1].getValue()+")";
			for (int i=1; i<6; i++) {
				if (CTuseThis[i].isSelected()) {
					s +=",c("+CTsampleSize[i][0].getValue()+","+CTsampleSize[i][1].getValue()+")";
				}
			}
			s += "),";
			s += "sd="+CTSD.getValue()+",";
			s += "theta.LB="+CTrange1.getValue()+",";
			s += "theta.UB="+CTrange2.getValue()+",";
			s += "MAD="+CTMAD.getValue()+",";
			s += "TD="+CTTD.getValue()+",";
			s += "LB="+CTLB.getValue()+"/100,";
			s += "UB="+CTUB.getValue()+"/100,";
			s += "plotCat="+(cat3.isSelected()?"3":"6")+",";
			s += "semicolonSep="+(fieldSeparator.getSelectedItem().equals(";")?"TRUE":"FALSE")+",";
			if (!file.equals("NULL")) s += "file=\""+file+"\",";
			s += "main=\""+main+"\"";
			s += ")";			
		} else if (e.getSource().equals(binGO)) {
			if (binRange1.getValue()>=binRange2.getValue()) {
				JOptionPane.showMessageDialog(this, "First value for range must be less then second value!", "First value for range must be less then second value", JOptionPane.ERROR_MESSAGE);
				return;
			}	
			if (binLB.getValue()>=binUB.getValue()) {
				JOptionPane.showMessageDialog(this, "Lower bound must be less then upper bound!", "Lower bound must be less then upper bound", JOptionPane.ERROR_MESSAGE);
				return;
			}		
			if (binMAD.getValue()>binTD.getValue()) {
				JOptionPane.showMessageDialog(this, "MAD must be less or equal to TD!", "MAD must be less or equal to TD", JOptionPane.ERROR_MESSAGE);
				return;
			}						
			s = "OC.bin(";		
			s += "nmat=rbind(c("+binSampleSize[0][0].getValue()+","+binSampleSize[0][1].getValue()+")";
			for (int i=1; i<6; i++) {
				if (binUseThis[i].isSelected()) {
					s +=",c("+binSampleSize[i][0].getValue()+","+binSampleSize[i][1].getValue()+")";
				}
			}
			s += "),";
			s += "p.con="+binCR.getValue()/100+",";
			s += "p.trt.LB="+binRange1.getValue()/100+",";
			s += "p.trt.UB="+binRange2.getValue()/100+",";
			s += "MAD="+binMAD.getValue()+"/100,";
			s += "TD="+binTD.getValue()+"/100,";
			s += "LB="+binLB.getValue()+"/100,";
			s += "UB="+binUB.getValue()+"/100,";
			s += "lower="+(binInc.getSelectedIndex()==0?"TRUE":"FALSE")+",";
			s += "plotCat="+(cat3.isSelected()?"3":"6")+",";
			s += "semicolonSep="+(fieldSeparator.getSelectedItem().equals(";")?"TRUE":"FALSE")+",";
			if (!file.equals("NULL")) s += "file=\""+file+"\",";
			s += "main=\""+main+"\"";
			s += ")";			
		}	
		try {
			Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
			int width = screenSize.width  - JavaGD.inset*2;
			int height = screenSize.height - JavaGD.inset*2;        
			RControl.getR().eval("JavaGD(\"QTD (Quantitative Trial Design) Plot\", "+width+", "+height+")");		
			RControl.getR().eval(".ocObject <- "+s);
			if (savePlot.isSelected()) {
				int height2 = cat3.isSelected()?512:1024;
				RControl.getR().eval("png(filename=\""+plotfile+"\", width = 1024, height = "+height2+")");
				RControl.getR().eval(s);
				RControl.getR().eval("dev.off()");
			}		
			RControl.getR().eval("cat('"+s+"')");
			RControl.getR().eval("cat('\\n')");
			if (!file2.equals("NULL")) {
				RControl.getR().eval("summTable(.ocObject, file = \""+file2+"\", cat ="+ (cat3.isSelected()?"3":"6")+") ");
			}
			if (saveData.isSelected() || savePlot.isSelected()) {
				String message = "";
				if (saveData.isSelected()) { 
					message += "Saved Data to "+file+"\n";
					message += "Saved summary table to "+file2+"\n";
				}
				if (savePlot.isSelected()) { message += "Saved Plot to "+plotfile+"";}
				JOptionPane.showMessageDialog(this, message, "Saved files", JOptionPane.INFORMATION_MESSAGE);
			}			
		} catch (Exception exc) {
			JOptionPane.showMessageDialog(this, "An error ocurred with the following command:\n"+s+"\n\nError message:\n"+exc.getMessage(), "Error in calculation", JOptionPane.ERROR_MESSAGE);			
		}
	}

	/**
	 * Shows a file from a package
	 * @param s String like 
	 */
	public void showFile(String s) {
		File f = new File(RControl.getR().eval("system.file(\""+s+"\", package=\"nvm\")").asRChar().getData()[0]);
		if (!f.exists()) {
			throw new RuntimeException("This is strange. The vignette could not be found.");
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
	
	/**
	 * Enables / disables the sample size text fields.
	 */
	public void stateChanged(ChangeEvent e) {		
		for (int i=1; i<6; i++) {
			if (e.getSource()==binUseThis[i]) {
				binSampleSize[i][0].setEnabled(binUseThis[i].isSelected());
				binSampleSize[i][1].setEnabled(binUseThis[i].isSelected());
			}
			if (e.getSource()==CTuseThis[i]) {
				CTsampleSize[i][0].setEnabled(CTuseThis[i].isSelected());
				CTsampleSize[i][1].setEnabled(CTuseThis[i].isSelected());
			}
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

}
