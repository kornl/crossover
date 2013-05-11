package org.mutoss.gui;

import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
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

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class AlgorithmPanel extends JPanel implements ActionListener, ChangeListener {
	
	JTextField jtTitle = new JTextField();
	JTextField jtReference = new JTextField();
	JComboBox<String> jCBmodel;
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
	
	public AlgorithmPanel(CrossoverGUI gui) {
		this.gui = gui;
		gui.spinnerT.addChangeListener(this);
		gui.spinnerP.addChangeListener(this);
		String cols = "5dlu, fill:min:grow, 5dlu, fill:min:grow, 5dlu,";
        String rows = "5dlu, pref, 5dlu, fill:pref:grow, 5dlu";
        
        FormLayout layout = new FormLayout(cols, rows);
        layout.setColumnGroups(new int[][]{ {2, 4} });

        setLayout(layout);
        CellConstraints cc = new CellConstraints();        
		
		int row = 2;
    	
    	add(new JLabel(""), cc.xy(2, row));
        add(new JLabel("Created design:"), cc.xy(4, row));
		
        row+=2;
        
		jta = new HTMLPaneWithButtons();
		jta.setFont(new Font("Monospaced", Font.PLAIN, 12));
		//jta.setLineWrap(false);		
		jta.setMargin(new Insets(4,4,4,4));
		jta.setEditable(false);		
		
		add(new JScrollPane(getLeftSidePanel()), cc.xy(2, row));
		add(new JScrollPane(jta), cc.xy(4, row));
		
		row+=2;	
		
	}
	
	JSpinner spinnerS;
	JPanel lsPanel;
	JLabel pLabel = new JLabel("Further model parameters:");
	JTextField jtfParam = new JTextField("1");
	
	public JPanel getLeftSidePanel() {
		lsPanel = new JPanel();
		String cols = "5dlu, pref, 5dlu, fill:min:grow, 5dlu";
        String rows = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu";
        
        lsPanel.setLayout(new FormLayout(cols, rows));
		
		int row = 2;
    	
		jCBmodel = new JComboBox<String>(CrossoverGUI.models);
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
			String command = ".COresult <- searchCrossOverDesign(s="+spinnerS.getModel().getValue().toString()
					+", "+gui.getParameters()
					+", model=\""+jCBmodel.getSelectedItem()+"\""
					+", eff.factor="+1
					+", v.rep="+getVRep()
					+", balance.s="+(jbBalanceSequences.isSelected()?"TRUE":"FALSE")
					+", balance.p="+(jbBalancePeriods.isSelected()?"TRUE":"FALSE")
					+(jCBmodel.getSelectedIndex()==4?", placebos="+jtfParam.getText():"")
					+(jCBmodel.getSelectedIndex()==7?", ppp="+jtfParam.getText():"")
					+", verbose=FALSE)";
			System.out.println(command);
			RControl.getR().eval(command).asRList();
			RList result = RControl.getR().eval(".COresult").asRList();
			String table = RControl.getR().eval("crossover:::getTable(.COresult$design)").asRChar().getData()[0];
			jta.appendHTML(table);
			jta.appendParagraph("<pre>"+result.get(1).asRChar().getData()[0]+"</pre>");
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
		}
	}

	@Override
	public void stateChanged(ChangeEvent e) {
		createWeightsPanel();
		createTreatmentNumberPanel();
	}

}
