package org.mutoss.gui;

import java.util.List;
import java.util.Vector;

import javax.swing.table.AbstractTableModel;

public class DesignTableModel extends AbstractTableModel {

	List<Design> designs = new Vector<Design>();

	public DesignTableModel() {
	}

	public Class<?> getColumnClass(int columnIndex) {
		if (columnIndex < 2) return String.class;
		return Double.class;
	}

	public int getColumnCount() {
		return 2;
	}

	public String getColumnName(int columnIndex) {
		switch (columnIndex) {
		case 0: return "Title";
		case 1: return "Signature";
		//case 2: return "av.eff.trt.pair";
		case 2: return "av.eff.trt.pair.adj";
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
		case 1: return design.getRSignature(); 
		//case 2: return design.efficiencyUnadj;
		case 2: return design.efficiencyAdj;
		default: return null;
		}
	}

	public boolean isCellEditable(int rowIndex, int columnIndex) {
		return false;
	}

	public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
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
