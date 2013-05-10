package org.mutoss.gui;

import java.awt.Font;
import java.util.List;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class DesignSelectionPanel extends JPanel implements ListSelectionListener {
	
	DesignTable designTable;
	//JList designList;
	//DefaultListModel lmDesign;
	//JTextArea jta;
	HTMLOutputPane jta;
	List<Design> designs;
	
	
	public DesignSelectionPanel() {
		String cols = "5dlu, fill:min:grow, 5dlu, fill:min:grow, 5dlu,";
        String rows = "5dlu, pref, 5dlu, fill:min:grow, 5dlu";
        
        FormLayout layout = new FormLayout(cols, rows);
        layout.setColumnGroups(new int[][]{ {2, 4} });

        setLayout(layout);
        CellConstraints cc = new CellConstraints();
		
		int row = 2;
    	
    	add(new JLabel("List of designs:"), cc.xy(2, row));
        add(new JLabel("Selected design:"), cc.xy(4, row));
		
        row+=2;
        
        designTable = new DesignTable();		
		designTable.getSelectionModel().addListSelectionListener(this);
		
		jta = new HTMLOutputPane();
		jta.setFont(new Font("Monospaced", Font.PLAIN, 12));
		/*jta.setLineWrap(false);		
		jta.setMargin(new Insets(4,4,4,4));*/
		
    	add(new JScrollPane(designTable), cc.xy(2, row));
        add(new JScrollPane(jta), cc.xy(4, row));
		
	}
	
	public DesignSelectionPanel(List<Design> designs) {
		this();
		setDesigns(designs);
	}

	public void setDesigns(List<Design> designs) {
		designTable.setDesigns(designs);
	}

	public void valueChanged(ListSelectionEvent e) {
		int i = designTable.getSelectedRow();
		if (i == -1) return;
		Design design = designTable.getModel().getDesigns().get(i);
		jta.showDesign(design);		
	}


	
}
