package org.mutoss.gui.contrast;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.rmi.RemoteException;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import org.af.commons.widgets.WidgetFactory;
import org.af.jhlir.call.RMatrixDouble;
import org.mutoss.gui.RControl;

public class ContrastDialog extends SharedDialog implements ActionListener {


    
    private GroupingBox cbGroup;
    private LevelOrderSL slLevelOrder;
    //private JComboBox jbcontrol;
    private ROptionBox<String> cbType;
    private ContrastTable pTable;
    private JButton jbAdd;
    private JButton jbScaleCM;
    public JLabel jlInfo; 
    
    public ContrastDialog(JFrame window, GroupingBox cbGroup, LevelOrderSL slLevelOrder) {
        super(window, "Contrast Building");       
        
        this.cbGroup = cbGroup;
        this.slLevelOrder = slLevelOrder;
        //cbGroup = AnalysisDialogFactory.makeGroupingComboBox(df);
        //slLevelOrder = AnalysisDialogFactory.makeLevelOrderSplitList(df, cbGroup);        
        //jbcontrol = AnalysisDialogFactory.makeLevelSelectionBox(df, cbGroup);
        jbAdd = new JButton("Add Contrast");
        jbAdd.addActionListener(this); 
        jbScaleCM = new JButton("Scale contrasts");
        jbScaleCM.addActionListener(this);
        jlInfo = new JLabel("Please add contrasts.");
        
        pTable = new ContrastTable(df, cbGroup, slLevelOrder, jlInfo);
        
        String[] a = {"Dunnett", "Tukey", "Sequen", "AVE", 
                "Changepoint", "Williams", "Marcus", 
                "McDermott", "UmbrellaWilliams", "GrandMean"}; // This array you are allowed to rename!
        String[] b = {"Dunnett", "Tukey", "Sequen", "AVE", 
                "Changepoint", "Williams", "Marcus", 
                "McDermott", "UmbrellaWilliams", "GrandMean"};        
        cbType = new ROptionBox<String>("type", a, b);
        
        JPanel panel = new JPanel();
        panel.add(jbAdd);
        panel.add(jbScaleCM);
        
        String[] labels = {//"Group", "Level Order", //"Control", 
        		"Type", null, "Contrasts", null};
        
        Component[] comps = {//cbGroup, slLevelOrder, //jbcontrol, 
        		cbType, panel, new JScrollPane(pTable), jlInfo};

        setContent(labels, comps);
        setModal(true);
        doTheLayout();
        pack();
        WidgetFactory.showCompleteTitle(this);
        setLocationRelativeTo(getOwner());       
    }
    
    protected void checkConstraints() {        
        requiresFactVar();
    }
    
    public RMatrixDouble showAndGetMatrix() {
    	setVisible(true);
    	dispose();
    	return getMatrix();
    }
    
    /*public RMatrixDouble createMatrix(String matrix, String string) {
		RFunctionCall rfc = new RFunctionCall(getRControl(), matrix, string);
		rfc.setAddParams(false);
		RMatrixDouble m = new RMatrixDouble(rfc.doIt());
		new REvalCall(getRControl(), "rownames("+string+")<-paste(\"C\",1:nrow("+string+"),sep=\"\")").doIt();
		return m;
	}*/
    
    public RMatrixDouble getContrastMatrix(String varname, String type, List<String> list) {
    	//TODO df and list
    	return RControl.getR().eval("m <- myContrMat(df=df, group=\""+varname+"\", type=\""+type+"\",l=list").asRMatrixDouble();
    }

    
    public RMatrixDouble getMatrix() {
    	return null;
		//return createMatrix(pTable.getMatrix(), "m");    	
    }

    protected void onOk() {
        String group = cbGroup.getSelectedItem().toString();
		List<String> levelOrder = slLevelOrder.getRight();
		//String contr = jbcontrol.getSelectedItem().toString();
		String type = cbType.getSelectedObject();
		dispose();
    }
    
    public void actionPerformed(ActionEvent e) {
        super.actionPerformed(e);
        if (e.getSource().equals(jbAdd)) {        	
        	RMatrixDouble m = getContrastMatrix(cbGroup.getSelectedItem().toString(), cbType.getSelectedObject(), slLevelOrder.getRight());        	
        	try {
				pTable.addMatrix(m);
			} catch (RemoteException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        	/* List<Double> l = new Vector<Double>();        	
        	pTable.addMatrix(getAnalysis().getColumns(l, m)); */
        } else if (e.getSource().equals(jbScaleCM)) {        	
        	pTable.scale();
        }        
    }
    
    
}

