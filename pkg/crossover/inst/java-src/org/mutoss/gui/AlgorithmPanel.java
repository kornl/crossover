package org.mutoss.gui;

import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SpinnerNumberModel;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import org.af.commons.widgets.HTMLPaneWithButtons;
import org.af.jhlir.call.RList;
import org.jdesktop.swingworker.SwingWorker;
import org.mutoss.gui.dialogs.TextFileViewer;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class AlgorithmPanel extends JPanel implements ActionListener, ChangeListener {
	
	JTextField jtTitle = new JTextField();
	JTextField jtReference = new JTextField();
	JComboBox jCBmodel;
	JButton ok = new JButton("Ready");
	JButton jbCompute = new JButton("Compute Design");
	HTMLPaneWithButtons jta;
	JLabel label = new JLabel();
	JPanel ntPanel = null;
	JPanel weightsPanel = null;
	JPanel effPanel = null;
	List<JTextField> weightsV = new Vector<JTextField>();
	List<JTextField> nV = new Vector<JTextField>();
	CellConstraints cc = new CellConstraints();
	JRadioButton jbBalanceNothing = new JRadioButton("No balancing restrictions");
	JRadioButton jbBalanceSequences = new JRadioButton("Balance treatments in regard to sequences (may decrease efficiency)");
	JRadioButton jbBalancePeriods = new JRadioButton("Balance treatments in regard to periods (may decrease efficiency)");
	CrossoverGUI gui;	
	JButton exportR = new JButton("Export to R");
	JButton showAlgoPerformance = new JButton("Show course of algorithm");
	//JTabbedPane jTabAlgo = new jTabAlgo;
	
	public AlgorithmPanel(CrossoverGUI gui) {
		this.gui = gui;
		gui.spinnerT.addChangeListener(this);
		gui.spinnerP.addChangeListener(this);
		String cols = "5dlu, fill:min:grow, 5dlu, fill:min:grow";
        String rows = "5dlu, fill:pref:grow, 5dlu, pref, 5dlu";
        
        FormLayout layout = new FormLayout(cols, rows);
        layout.setColumnGroups(new int[][]{ {2, 4} });

        setLayout(layout);
        CellConstraints cc = new CellConstraints();        
		
		int row = 2;
    	
    	jta = new HTMLPaneWithButtons();
		jta.setFont(new Font("Monospaced", Font.PLAIN, 12));
		//jta.setLineWrap(false);		
		jta.setMargin(new Insets(4,4,4,4));
		jta.setEditable(false);		
		
		add(new JScrollPane(getLeftSidePanel()), cc.xy(2, row));
		add((getRightSidePanel()), cc.xy(4, row));
		
		
	}
	
	JSpinner spinnerS;
	JPanel lsPanel;
	JLabel pLabel = new JLabel("Further model parameters:");
	JTextField jtfParam = new JTextField("1");
	

	public JPanel getRightSidePanel() {
		JPanel panel = new JPanel();
		GridBagConstraints c = new GridBagConstraints();
		c.fill = GridBagConstraints.BOTH;	
		c.gridx=0; c.gridy=0;
		c.gridwidth = 1; c.gridheight = 1;
		c.ipadx=5; c.ipady=5; c.gridwidth=2;
		c.weightx=1; c.weighty=0;	

		panel.setLayout(new GridBagLayout());
		panel.add(new JLabel("Created Design"), c);
		c.gridy++;c.weighty=1;
		panel.add(new JScrollPane(jta), c);
		c.gridy++;c.weighty=0; c.gridwidth=1;
		panel.add(exportR, c);
		exportR.setEnabled(false);
		exportR.addActionListener(this);
		c.gridx++;
		panel.add(showAlgoPerformance, c);
		showAlgoPerformance.setEnabled(false);
		showAlgoPerformance.addActionListener(this);
		
		return panel;
	}
    
	
	public JPanel getLeftSidePanel() {
		lsPanel = new JPanel();
		String cols = "5dlu, pref, 5dlu, fill:min:grow, 5dlu";
        String rows = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu";
        
        lsPanel.setLayout(new FormLayout(cols, rows));
		
		int row = 2;
    	
		jCBmodel = new JComboBox(CrossoverGUI.models);
		jCBmodel.addActionListener(this);
		
		lsPanel.add(new JLabel("Model"), cc.xy(2, row));
		lsPanel.add(jCBmodel, cc.xy(4, row));
		
        row+=2;
        
		lsPanel.add(pLabel, cc.xy(2, row));
		lsPanel.add(jtfParam, cc.xy(4, row));
		pLabel.setEnabled(false);
		jtfParam.setEnabled(false);

        row+=2;  
        
    	spinnerS = new JSpinner(new SpinnerNumberModel(5, 1, 100, 1)); 
    	spinnerS.addChangeListener(this);
        
        lsPanel.add(new JLabel("Number of sequences:"), cc.xy(2, row));
        lsPanel.add(spinnerS, cc.xy(4, row));
        
        row+=2;
        
        rowN = row; 
        createTreatmentNumberPanel();
        
        row+=2;  
        
        ButtonGroup group = new ButtonGroup();
        group.add(jbBalanceNothing);
        group.add(jbBalanceSequences);
        group.add(jbBalancePeriods);
        jbBalanceNothing.setSelected(true);
              
        lsPanel.add(jbBalanceNothing, cc.xyw(2, row, 3));
        row+=2;
        lsPanel.add(jbBalanceSequences, cc.xyw(2, row, 3));
        row+=2;
        lsPanel.add(jbBalancePeriods, cc.xyw(2, row, 3));        
        row+=2;
        
        rowTNP = row;        
        createWeightsPanel();
        
        row+=2;        
		
        lsPanel.add(jbCompute, cc.xyw(2, row, 3));
        jbCompute.addActionListener(this);
        
        return lsPanel;
	}
	
	int rowTNP, rowN;
	
	private void createWeightsPanel() {		
		if (weightsPanel!=null) {
			lsPanel.remove(weightsPanel);
		}

		weightsPanel = new JPanel();
		GridBagConstraints cbcWeights = new GridBagConstraints();
		cbcWeights.fill = GridBagConstraints.BOTH;	
		cbcWeights.gridx=0; cbcWeights.gridy=0;
		cbcWeights.gridwidth = 1; cbcWeights.gridheight = 1;
		cbcWeights.ipadx=5; cbcWeights.ipady=5;
		cbcWeights.weightx=1; cbcWeights.weighty=1;
		weightsPanel.setBorder(BorderFactory.createTitledBorder("Contrast Weights (redesign in future!)"));

		weightsPanel.setLayout(new GridBagLayout());
		/*} else {
			weightsPanel.removeAll();			
		}*/
		
		List<String> labels = new Vector<String>();
        
		int s = Integer.parseInt(gui.spinnerT.getModel().getValue().toString());
		for (int i=1; i<s; i++) {
        	for (int j=1; j<=s; j++) {
        		labels.add(i+"-"+j);
        	}        	
        }  

		weightsV.clear();
		for (int i=0;i<labels.size();i++) {        		
			weightsV.add(new JTextField("1.0", 6));
			weightsPanel.add(new JLabel(labels.get(i)), cbcWeights);
			cbcWeights.gridx++;
			weightsPanel.add(weightsV.get(i), cbcWeights);	
			if ((i+1)%3!=0) {
				cbcWeights.gridx++;
			} else {
				cbcWeights.gridx=0;cbcWeights.gridy++;
			}
		}		
		lsPanel.add(weightsPanel, cc.xyw(2, rowTNP, 3));
		lsPanel.revalidate();
		lsPanel.repaint();
	}
	
	private void createEffPanel() {		
		if (effPanel!=null) {
			lsPanel.remove(effPanel);
		}

		effPanel = new JPanel();
		GridBagConstraints cbcWeights = new GridBagConstraints();
		cbcWeights.fill = GridBagConstraints.BOTH;	
		cbcWeights.gridx=0; cbcWeights.gridy=0;
		cbcWeights.gridwidth = 1; cbcWeights.gridheight = 1;
		cbcWeights.ipadx=5; cbcWeights.ipady=5;
		cbcWeights.weightx=1; cbcWeights.weighty=1;
		effPanel.setBorder(BorderFactory.createTitledBorder("Efficiency factors"));

		effPanel.setLayout(new GridBagLayout());
		/*} else {
			weightsPanel.removeAll();			
		}*/
		
		List<String> labels = new Vector<String>();
        
		int s = Integer.parseInt(gui.spinnerT.getModel().getValue().toString());
		for (int i=1; i<s; i++) {
        	for (int j=1; j<=s; j++) {
        		labels.add(i+"-"+j);
        	}        	
        }  

		weightsV.clear();
		for (int i=0;i<labels.size();i++) {        		
			weightsV.add(new JTextField("1.0", 6));
			effPanel.add(new JLabel(labels.get(i)), cbcWeights);
			cbcWeights.gridx++;
			effPanel.add(weightsV.get(i), cbcWeights);	
			if ((i+1)%3!=0) {
				cbcWeights.gridx++;
			} else {
				cbcWeights.gridx=0;cbcWeights.gridy++;
			}
		}		
		lsPanel.add(effPanel, cc.xyw(2, rowTNP, 3));
		lsPanel.revalidate();
		lsPanel.repaint();
	}
	
	private void createTreatmentNumberPanel() {
		if (ntPanel!=null) {
			lsPanel.remove(ntPanel);
		}

		ntPanel = new JPanel();
		GridBagConstraints cbcWeights = new GridBagConstraints();
		cbcWeights.fill = GridBagConstraints.BOTH;	
		cbcWeights.gridx=0; cbcWeights.gridy=0;
		cbcWeights.gridwidth = 1; cbcWeights.gridheight = 1;
		cbcWeights.ipadx=5; cbcWeights.ipady=5;
		cbcWeights.weightx=1; cbcWeights.weighty=1;
		ntPanel.setBorder(BorderFactory.createTitledBorder("Number of treatment assignments"));

		ntPanel.setLayout(new GridBagLayout());
		/*} else {
			weightsPanel.removeAll();			
		}*/
		
		List<String> labels = new Vector<String>();
        
		int v = Integer.parseInt(gui.spinnerT.getModel().getValue().toString());
		int s = Integer.parseInt(spinnerS.getModel().getValue().toString());
		int p = Integer.parseInt(gui.spinnerP.getModel().getValue().toString());
		
		for (int i=1; i<=v; i++) {        	
        	labels.add("Treatment "+i+":");        	        	
        }      
        
		nV.clear();
		for (int i=0;i<labels.size();i++) {        		
			nV.add(new JTextField(""+((s*p)/v+((i<(s*p)%v)?1:0)), 6));
			ntPanel.add(new JLabel(labels.get(i)), cbcWeights);
			cbcWeights.gridx++;
			ntPanel.add(nV.get(i), cbcWeights);	
			if ((i+1)%3!=0) {
				cbcWeights.gridx++;
			} else {
				cbcWeights.gridx=0;cbcWeights.gridy++;
			}
		}		
		lsPanel.add(ntPanel, cc.xyw(2, rowN, 3));
		lsPanel.revalidate();
		lsPanel.repaint();
	}
	
	private String getVRep() {
		String vrep = "c(";
		for (int i=0; i<nV.size(); i++) {   
			vrep += nV.get(i).getText();
			if (i!=nV.size()-1) vrep += ",";
		}
		return vrep+")";
	}
	
	public void addActionListener(ActionListener al) {
		ok.addActionListener(al);
	}
	
	public Design getDesign() {
		return null;
	}

	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == jbCompute) {
			gui.glassPane.start();
			//startTesting();		
			SwingWorker<Void, Void> worker = new SwingWorker<Void, Void>() {
				@Override
				protected Void doInBackground() throws Exception {
					String command = "";
					try {
						command = "searchCrossOverDesign(s="+spinnerS.getModel().getValue().toString()
								+", "+gui.getParameters()
								+", model=\""+jCBmodel.getSelectedItem()+"\""
								+", eff.factor="+1
								+", v.rep="+getVRep()
								+", balance.s="+(jbBalanceSequences.isSelected()?"TRUE":"FALSE")
								+", balance.p="+(jbBalancePeriods.isSelected()?"TRUE":"FALSE")
								+(jCBmodel.getSelectedIndex()==4?", placebos="+jtfParam.getText():"")
								+(jCBmodel.getSelectedIndex()==7?", ppp="+jtfParam.getText():"")
								+", verbose=FALSE)";
						//System.out.println(command);
						RControl.getR().eval(".COresult <- "+command);
						exportR.setEnabled(true);						
						showAlgoPerformance.setEnabled(true);
						RList result = RControl.getR().eval(".COresult").asRList();
						String table = RControl.getR().eval("crossover:::getTable(.COresult$design)").asRChar().getData()[0];
						jta.clear();
						jta.appendHTML(table);
						jta.appendParagraph("<pre>"+result.get(1).asRChar().getData()[0]+"</pre>");		
						jta.appendParagraph("Random seed: TODO");
						jta.appendParagraph("R Code: <pre>"+command+"</pre>");
						jta.setCaretPosition(0);
						//RControl.getR().eval("dev.off()");
						//JavaGD gd = JavaGD.devices.get(JavaGD.devices.size()-1);
						//gd.getPanel();
					} catch (Exception e) {
						String message = e.getMessage();
						System.out.println("\""+message+"\"");
						if (message.equals("Error: \n")) message = "Empty message (most likely an error in the C++ code - please try the command for yourself)\n\n";
						JOptionPane.showMessageDialog(gui, "R call produced an error:\n\n"+message+"\nWe will open a window with R code to reproduce this error for investigation.", "Error in R Call", JOptionPane.ERROR_MESSAGE);
						JDialog d = new JDialog(gui, "R Error", true);
						d.add(
								new TextFileViewer(gui, "R Objects", "The following R code produced the following error:\n\n" +message+
										command, true)
								);
						d.pack();
						d.setSize(800, 600);
						d.setVisible(true);
						e.printStackTrace();						
					} finally {
						gui.glassPane.stop();
					}
					return null;
				}
			};
			worker.execute();
		} else if (e.getSource() == jCBmodel) {
			if (jCBmodel.getSelectedIndex()==4) {
				jtfParam.setEnabled(true);
				pLabel.setEnabled(true);
				pLabel.setText("Number of placebo treatments:");
			} else if (jCBmodel.getSelectedIndex()==7) {
				jtfParam.setEnabled(true);
				pLabel.setEnabled(true);
				pLabel.setText("Proportionality parameter:");
			} else {
				jtfParam.setEnabled(false);
				pLabel.setEnabled(false);
				pLabel.setText("Further model parameters:");
			}
		} else if (e.getSource()==showAlgoPerformance) {			
			RControl.getR().eval("JavaGD(\"Search algorithm performance\")");
			//RControl.getR().eval("png(filename=\""+getTmpFile()+"\")");
			RControl.getR().eval("print(searchPlot(.COresult))");
			//RControl.getR().eval("dev.off()");
		} else if (e.getSource()==exportR) {
			VariableNameDialog vd = new VariableNameDialog(gui, "design");			
			RControl.getR().eval(vd.getName()+" <- .COresult$design");
		}
	}

	private String getTmpFile() {
		String file = System.getProperty("java.io.tmpdir")+"/searchplot"+(new Date()).getTime()+".png";
		System.out.println(file);
		return file;
	}


	public void stateChanged(ChangeEvent e) {
		createWeightsPanel();
		createTreatmentNumberPanel();
	}

}
