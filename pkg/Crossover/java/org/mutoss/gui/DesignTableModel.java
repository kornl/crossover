package org.mutoss.gui;

import java.util.List;
import java.util.Vector;

import javax.swing.table.AbstractTableModel;

public class DesignTableModel extends AbstractTableModel {

	List<Design> designs = new Vector<Design>();
	CrossoverGUI gui;

	public DesignTableModel(CrossoverGUI gui) {
		this.gui = gui;
	}

	public Class<?> getColumnClass(int columnIndex) {
		switch (columnIndex) {
		case 0: return String.class;
		case 1: return Integer.class;
		case 2: return Double.class;
		case 3: return Boolean.class;
		default: return null;
		}
		
	}

	public int getColumnCount() {
		return 3;
	}

	public String getColumnName(int columnIndex) {
		switch (columnIndex) {
		case 0: return "Title";
		case 1: return "Sequences";
		case 2: return "av.eff.trt.pair";
		case 3: return "balanced";
		default: return null;
		}
	}

	public int getRowCount() {
		return designs.size();
	}

	public Object getValueAt(int rowIndex, int columnIndex) {
		Design design = designs.get(rowIndex);
		switch (columnIndex) {
		case 0: return design.title;		                   
		case 1: return design.s; // .getRSignature(); 
		//case 2: return design.efficiencyUnadj;
		case 2:	return design.getEff(gui.jCBmodel.getSelectedIndex()+1, gui.getParam());
		case 3: return false;
		default: return null;
		}
	}

	public boolean isCellEditable(int rowIndex, int columnIndex) {
		return false;
	}

	public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
		//This method does not set the value - do we need it? Is throwing an error better?
		fireTableStructureChanged();
	}
	
	public void setDesigns(List<Design> designs) {
		this.designs = designs;
		//for (int i=0; i<designs.size(); i++) {}
		fireTableStructureChanged();
	}

	public List<Design> getDesigns() {
		return designs;
	}
	
}
