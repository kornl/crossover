package org.mutoss.gui.options;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
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
    private JComboBox showTable = new JComboBox(new String[] {"HTML Table", "ASCII", "R matrix"});

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
        showCarryOver.setToolTipText("<html></html>");
        
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
      	//conf.getGeneralConfig().setFontSize(fontSize);
    }

	public void actionPerformed(ActionEvent e) {

	}
}

