package org.mutoss.gui;

import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import java.util.Vector;

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

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class AlgorithmPanel extends JPanel implements ActionListener, ChangeListener {
	
	JTextField jtTitle = new JTextField();
	JTextField jtReference = new JTextField();
	JComboBox jCBmodel;
	JButton ok = new JButton("Ready");
	JButton jbCompute = new JButton("Compute Design");
	JTextArea jta;
	JLabel label = new JLabel();
	JPanel weightsPanel = null;
	List<JTextField> weightsV = new Vector<JTextField>();	
	CellConstraints cc = new CellConstraints();
	JRadioButton jbBalanceNothing = new JRadioButton("No balancing restrictions");
	JRadioButton jbBalanceSequences = new JRadioButton("Balance treatments in regard to sequences");
	JRadioButton jbBalancePeriods = new JRadioButton("Balance treatments in regard to periods");
	
	public AlgorithmPanel() {
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
        
		jta = new JTextArea("");
		jta.setFont(new Font("Monospaced", Font.PLAIN, 12));
		jta.setLineWrap(false);		
		jta.setMargin(new Insets(4,4,4,4));
		jta.setEditable(false);		
		
		add(new JScrollPane(getLeftSidePanel()), cc.xy(2, row));
		add(new JScrollPane(jta), cc.xy(4, row));
		
		row+=2;	
		
	}
	
	JSpinner spinnerS;
	JPanel lsPanel;
	
	public JPanel getLeftSidePanel() {
		lsPanel = new JPanel();
		String cols = "5dlu, pref, 5dlu, fill:min:grow, 5dlu";
        String rows = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu";
        
        lsPanel.setLayout(new FormLayout(cols, rows));
		
		int row = 2;
    	
		jCBmodel = new JComboBox(CrossoverGUI.models);
		
		lsPanel.add(new JLabel("Model"), cc.xy(2, row));
		lsPanel.add(jCBmodel, cc.xy(4, row));
		
        row+=2;
        
    	spinnerS = new JSpinner(new SpinnerNumberModel(5, 1, 100, 1)); 
    	spinnerS.addChangeListener(this);
        
        lsPanel.add(new JLabel("Number of sequences:"), cc.xy(2, row));
        lsPanel.add(spinnerS, cc.xy(4, row));
		
        row+=2;        
		
        lsPanel.add(jbCompute, cc.xyw(2, row, 3));
        
        row+=2;  
        
        rowTNP = row;        
        createWeightsPanel();
        
        row+=2;
        
        return lsPanel;
	}
	
	GridBagConstraints cbcWeights = new GridBagConstraints();
	int rowTNP;
	
	private void createWeightsPanel() {
		if (weightsPanel!=null) {
			lsPanel.remove(weightsPanel);
		}

		weightsPanel = new JPanel();
		cbcWeights.fill = GridBagConstraints.BOTH;	
		cbcWeights.gridx=0; cbcWeights.gridy=0;
		cbcWeights.gridwidth = 1; cbcWeights.gridheight = 1;
		cbcWeights.ipadx=5; cbcWeights.ipady=5;
		cbcWeights.weightx=1; cbcWeights.weighty=1;

		weightsPanel.setLayout(new GridBagLayout());
		/*} else {
			weightsPanel.removeAll();			
		}*/
		
		List<String> labels = new Vector<String>();
        
		int s = Integer.parseInt(spinnerS.getModel().getValue().toString());
        for (int i=1; i<s; i++) {
        	for (int j=1; j<=s; j++) {
        		labels.add("Weight "+i+"-"+j+":");
        	}        	
        }

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
		lsPanel.add(weightsPanel, cc.xyw(2, 8, 3)); //TODO This 4 should perhaps not be hardcoded...
		lsPanel.revalidate();
		lsPanel.repaint();
	}
	
	private void createTreatmentNumberPanel() {
		if (weightsPanel!=null) {
			lsPanel.remove(weightsPanel);
		}

		weightsPanel = new JPanel();
		cbcWeights.fill = GridBagConstraints.BOTH;	
		cbcWeights.gridx=0; cbcWeights.gridy=0;
		cbcWeights.gridwidth = 1; cbcWeights.gridheight = 1;
		cbcWeights.ipadx=5; cbcWeights.ipady=5;
		cbcWeights.weightx=1; cbcWeights.weighty=1;

		weightsPanel.setLayout(new GridBagLayout());
		/*} else {
			weightsPanel.removeAll();			
		}*/
		
		List<String> labels = new Vector<String>();
        
		int s = Integer.parseInt(spinnerS.getModel().getValue().toString());
        for (int i=1; i<s; i++) {
        	for (int j=1; j<=s; j++) {
        		labels.add(i+"-"+j);
        	}        	
        }

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
	
	public void addActionListener(ActionListener al) {
		ok.addActionListener(al);
	}
	
	public Design getDesign() {
		return null;
	}

	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == jbCompute) {
			
		}		
	}

	@Override
	public void stateChanged(ChangeEvent e) {
		int s = Integer.parseInt(spinnerS.getModel().getValue().toString());
		createWeightsPanel();
	}

}
