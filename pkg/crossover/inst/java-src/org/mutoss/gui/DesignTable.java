package org.mutoss.gui;

import java.util.List;

import javax.swing.JTable;
import javax.swing.table.TableModel;

public class DesignTable extends JTable {

	public DesignTable() {
		super(new DesignTableModel());
		//setModel(new DesignTableModel(this));
	}
	
	public DesignTableModel getModel() {
        return (DesignTableModel)super.getModel();
    }
	
	public void setDesigns(List<Design> designs) {
		getModel().setDesigns(designs);
	}
	
}
