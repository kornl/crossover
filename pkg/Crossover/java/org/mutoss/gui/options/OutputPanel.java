package org.mutoss.gui.options;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mutoss.config.Configuration;
import org.mutoss.gui.CrossoverGUI;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

/**
 * OptionsPanel for general settings.
 */
public class OutputPanel extends OptionsPanel implements ActionListener {
    private static final Log logger = LogFactory.getLog(OutputPanel.class);

    private Configuration conf;
    private OptionsDialog odialog;
    private JCheckBox showCarryOver;
    private JCheckBox showNames;
    private JComboBox showTable = new JComboBox(new String[] {"HTML Table", "ASCII", "R matrix"});
    String[] outputF = new String[] {"HTML", "ASCII", "R"};

    CrossoverGUI parent;

    public OutputPanel(CrossoverGUI parent, OptionsDialog odialog) {
        this.conf = Configuration.getInstance();
        this.odialog = odialog;
        this.parent = parent;

        makeComponents();
        doTheLayout();
    }

    /**
     * Instantiation of Swing-Components.
     */
    private void makeComponents() {        
        showCarryOver = new JCheckBox("Show variances of pairwise carry-over comparisons.");
        //colorImages.setSelected(conf.getGeneralConfig().getColoredImages());
        String f = conf.getProperty("outputF", "HTML");
        for (int i=0; i<outputF.length; i++) {
        	if (f.equals(outputF[i])) showTable.setSelectedIndex(i);
        }
        showCarryOver.setToolTipText("<html></html>");
        showCarryOver.setSelected(Boolean.parseBoolean(conf.getProperty("showCarryOver", ""+false)));
        showNames = new JCheckBox("Show row and column names.");
        showNames.setSelected(Boolean.parseBoolean(conf.getProperty("showNames", ""+true)));
    }

    private void doTheLayout() {
        JPanel p1 = new JPanel();
        String cols = "pref, 5dlu, fill:pref:grow";
        String rows = "pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref";
        
        FormLayout layout = new FormLayout(cols, rows);
        p1.setLayout(layout);
        CellConstraints cc = new CellConstraints();

        int row = 1;     
        
        p1.add(new JLabel("Show design as: "), cc.xy(1, row));        
        p1.add(showTable, cc.xy(3, row));
        
        row += 2;
        
        p1.add(showCarryOver, cc.xyw(1, row, 3));
        
        row += 2;    
        
        p1.add(showNames, cc.xyw(1, row, 3));
        
        row += 2;        
            
        
        /*
        p1.add(useJLaTeXMath, cc.xyw(1, row, 3));        
        
        row += 2;        
        
        p1.add(showFractions, cc.xyw(1, row, 3));    
        
        row += 2;
        
        p1.add(markEpsilon, cc.xyw(1, row, 3));    
        
        row += 2;*/
       
        add(p1);
    }

    
    public void setProperties() throws SetLookAndFeelException {
      	conf.setProperty("outputF", outputF[showTable.getSelectedIndex()]);
      	conf.setProperty("showCarryOver", ""+showCarryOver.isSelected());
      	conf.setProperty("showNames", ""+showNames.isSelected());
    }

	public void actionPerformed(ActionEvent e) {

	}
}

