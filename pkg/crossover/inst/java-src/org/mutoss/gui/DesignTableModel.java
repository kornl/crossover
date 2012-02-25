package org.mutoss.gui;

import java.util.List;
import java.util.Vector;

import javax.swing.DefaultListModel;
import javax.swing.event.TableModelListener;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableModel;

public class DesignTableModel extends AbstractTableModel {

	List<Design> designs = new Vector<Design>();
	
	//DesignTable table;
	
	public DesignTableModel(/*DesignTable table*/) {
		//this.table = table;
	}

	public Class<?> getColumnClass(int columnIndex) {
		return String.class;   
	}

	public int getColumnCount() {
		return 3;
	}

	public String getColumnName(int columnIndex) {
		switch (columnIndex) {
		case 0: return "Title";
		case 1: return "Signature";                   
		case 2: return "RSignature"; 
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
		case 1: return design.signature;                   
		case 2: return design.getRSignature(); 
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
