package org.mutoss.gui;

import java.awt.Font;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SpinnerNumberModel;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class AlgorithmPanel extends JPanel implements ActionListener {
	
	JTextField jtTitle = new JTextField();
	JTextField jtReference = new JTextField();
	JComboBox jCBmodel;
	JButton ok = new JButton("Ready");
	JButton jbCompute = new JButton("Compute Design");
	JTextArea jta;
	JLabel label = new JLabel();
	
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
		
		add(new JScrollPane(getRightSidePanel()), cc.xy(2, row));
		add(new JScrollPane(jta), cc.xy(4, row));
		
		row+=2;	
		
	}
	
	JSpinner spinnerS;
	
	public JPanel getRightSidePanel() {
		JPanel panel = new JPanel();
		String cols = "5dlu, pref, 5dlu, fill:min:grow, 5dlu";
        String rows = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu";
        
        panel.setLayout(new FormLayout(cols, rows));
        CellConstraints cc = new CellConstraints();
		
		int row = 2;
    	
		jCBmodel = new JComboBox(CrossoverGUI.models);
		
		panel.add(new JLabel("Model"), cc.xy(2, row));
		panel.add(jCBmodel, cc.xy(4, row));
		
        row+=2;
        
    	spinnerS = new JSpinner(new SpinnerNumberModel(5, 1, 100, 1));      	
        
        panel.add(new JLabel("Number of sequences:"), cc.xy(2, row));
        panel.add(spinnerS, cc.xy(4, row));
		
        row+=2;        
		
        panel.add(jbCompute, cc.xyw(2, row, 3));
        
        return panel;
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

}
