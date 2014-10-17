package org.mutoss.gui;

import java.awt.event.MouseEvent;
import java.util.List;

import javax.swing.JTable;

public class DesignTable extends JTable {

	public DesignTable() {
		super(new DesignTableModel());
		setAutoCreateRowSorter(true);
		//setModel(new DesignTableModel(this));
	}
	
	public DesignTableModel getModel() {
        return (DesignTableModel)super.getModel();
    }
	
	public void setDesigns(List<Design> designs) {
		getModel().setDesigns(designs);
	}
	
}
