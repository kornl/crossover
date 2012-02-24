package org.mutoss.gui;

import java.util.List;
import java.util.Vector;

import javax.swing.DefaultListModel;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableModel;

public class DesignTableModel implements TableModel {

	List<Design> designs = new Vector<Design>();
	
	public DesignTableModel() {
		
	}
	
	public void addTableModelListener(TableModelListener l) {

	}

	public Class<?> getColumnClass(int columnIndex) {
		return String.class;   
	}

	public int getColumnCount() {
		return 2;
	}

	public String getColumnName(int columnIndex) {
		switch (columnIndex) {
		case 0:  return "Title";
		case 1:  return "Signature";                   
		case 2:  
		default: return null;
		}
	}

	public int getRowCount() {
		return designs.size();
	}

	public Object getValueAt(int rowIndex, int columnIndex) {
		Design design = designs.get(rowIndex);
		switch (columnIndex) {
		case 0:  return design.title;
		case 1:  return design.signature;                   
		case 2:  
		default: return null;
		}
	}

	public boolean isCellEditable(int rowIndex, int columnIndex) {
		return false;
	}

	public void removeTableModelListener(TableModelListener l) {

	}

	public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
		
	}
	
	public void setDesigns(List<Design> designs) {
		this.designs = designs;
		//for (int i=0; i<designs.size(); i++) {}
		
	}

	public List<Design> getDesigns() {
		return designs;
	}

}
