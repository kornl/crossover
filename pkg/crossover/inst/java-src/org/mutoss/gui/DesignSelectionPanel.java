package org.mutoss.gui;

import java.awt.Font;
import java.awt.Insets;
import java.util.List;

import javax.swing.DefaultListModel;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTextArea;
import javax.swing.SpinnerNumberModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class DesignSelectionPanel extends JPanel implements ListSelectionListener {
	
	JList designList;
	DefaultListModel lmDesign;
	JTextArea jta;
	List<Design> designs;
	
	public DesignSelectionPanel() {
		String cols = "5dlu, fill:min:grow, 5dlu, fill:min:grow, 5dlu,";
        String rows = "5dlu, pref, 5dlu, fill:pref:grow, 5dlu";
        
        FormLayout layout = new FormLayout(cols, rows);
        layout.setColumnGroups(new int[][]{ {2, 4} });

        setLayout(layout);
        CellConstraints cc = new CellConstraints();
		
		int row = 2;
    	
    	add(new JLabel("List of designs:"), cc.xy(2, row));
        add(new JLabel("Selected design:"), cc.xy(4, row));
		
        row+=2;
        
        lmDesign = new DefaultListModel();
		designList = new JList(lmDesign);
		designList.addListSelectionListener(this);
		
		jta = new JTextArea("");
		jta.setFont(new Font("Monospaced", Font.PLAIN, 12));
		jta.setLineWrap(false);		
		jta.setMargin(new Insets(4,4,4,4));
		
    	add(new JScrollPane(designList), cc.xy(2, row));
        add(new JScrollPane(jta), cc.xy(4, row));
		
	}
	
	public DesignSelectionPanel(List<Design> designs) {
		this();
		setDesigns(designs);
	}

	public void setDesigns(List<Design> designs) {
		lmDesign.removeAllElements();
		for (Design design : designs) {
			lmDesign.addElement(design);	
		}
	}

	public void valueChanged(ListSelectionEvent e) {
		Design design = (Design) lmDesign.get(designList.getSelectedIndex());
		jta.setText(design.getTextDesign());
	}
	
}
