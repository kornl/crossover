package org.mutoss.gui.options;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.LookAndFeel;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import org.af.commons.widgets.WidgetFactory;
import org.af.commons.widgets.lists.IntegerJComboBox;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mutoss.config.Configuration;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

/**
 * OptionsPanel for general settings.
 */
public class GeneralPanel extends OptionsPanel implements ActionListener {
    private static final Log logger = LogFactory.getLog(GeneralPanel.class);

    private IntegerJComboBox cbFontSize;
    private JComboBox cbLookAndFeel;
    private JTextField jtfNumberOfDigits;
    
    private Configuration conf;
    private OptionsDialog odialog;
    private JCheckBox colorImages;

	JFrame parent;

    public GeneralPanel(JFrame parent, OptionsDialog odialog) {
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
        cbFontSize = new IntegerJComboBox(8, 20);
        cbFontSize.setSelectedObject(conf.getGeneralConfig().getFontSize());
        cbFontSize.setToolTipText("<html>" +
        		"Font size of the text in the GUI widgets.</html>");
        jtfNumberOfDigits = new JTextField(30);
        jtfNumberOfDigits.setText(""+conf.getGeneralConfig().getDigits());
        jtfNumberOfDigits.setToolTipText("<html>" +
        		"Number of digits to be shown at various places.<br>" +
        		"Not every part of the GUI will use this value.</html>");
        
        Vector<String> looknfeel = new Vector<String>();
        looknfeel.add("System");
        looknfeel.add("Windows");
        looknfeel.add("Mac OS");        
        looknfeel.add("Motif");
        looknfeel.add("Metal (highly recommended default)");

        cbLookAndFeel = new JComboBox(looknfeel);
        String currentLookNFeel = conf.getJavaConfig().getLooknFeel();
        logger.info("LooknFeel is " + currentLookNFeel + ".");
        for (int i = 0; i < looknfeel.size(); i++) {
            cbLookAndFeel.setSelectedIndex(i);
            if (getLooknFeel().equals(currentLookNFeel)) break;
            logger.debug("Not " + getLooknFeel());
        }
        cbLookAndFeel.setToolTipText("<html></html>");
        
        colorImages = new JCheckBox("Colored image files and pdf reports");
        //colorImages.setSelected(conf.getGeneralConfig().getColoredImages());
        colorImages.setToolTipText("<html></html>");
        
    }

    private void doTheLayout() {
        JPanel p1 = new JPanel();
        String cols = "pref, 5dlu, fill:pref:grow";
        String rows = "pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref";
        
        FormLayout layout = new FormLayout(cols, rows);
        p1.setLayout(layout);
        CellConstraints cc = new CellConstraints();

        int row = 1;     
        
        row += 2;
        
        p1.add(new JLabel("Number of digits:"),     cc.xy(1, row));
        p1.add(jtfNumberOfDigits, cc.xy(3, row));              
        
        row += 2;
        
        p1.add(new JLabel("Font Size"),     cc.xy(1, row));
        p1.add(cbFontSize, cc.xy(3, row));
        
        row += 2;

        p1.add(new JLabel("Look'n'Feel"),           cc.xy(1, row));
        p1.add(cbLookAndFeel, cc.xy(3, row));
        
        row += 2;
        
        /*p1.add(colorImages, cc.xyw(1, row, 3));
        
        row += 2;        
        
        p1.add(showRejected, cc.xyw(1, row, 3));        
        
        row += 2;        
        
        p1.add(useJLaTeXMath, cc.xyw(1, row, 3));        
        
        row += 2;        
        
        p1.add(showFractions, cc.xyw(1, row, 3));    
        
        row += 2;
        
        p1.add(markEpsilon, cc.xyw(1, row, 3));    
        
        row += 2;*/
        
        add(p1);
    }


    private String lfID2FullName(String id) {
        if (id.equals("Metal (highly recommended default)")) {
            return UIManager.getCrossPlatformLookAndFeelClassName();
        } else if (id.equals("System")) {
            return UIManager.getSystemLookAndFeelClassName();
        } else if (id.equals("Motif")) {
            return "com.sun.java.swing.plaf.motif.MotifLookAndFeel";
        } else if (id.equals("Windows")) {
            return "com.sun.java.swing.plaf.windows.WindowsLookAndFeel";
        } else if (id.equals("Mac OS")) {
            return "javax.swing.plaf.mac.MacLookAndFeel";
        }
        return null;
    }

    private String getLooknFeel() {
        String lf = lfID2FullName(cbLookAndFeel.getSelectedItem().toString());
        if (lf == null)
            logger.warn("No LooknFeel selected! How can this be?");
        return lf;
    }

    public void setProperties() throws SetLookAndFeelException {
        try {
        	int digits = Integer.parseInt(jtfNumberOfDigits.getText());
        	conf.getGeneralConfig().setDigits(digits);
        } catch (NumberFormatException e) {
        	JOptionPane.showMessageDialog(this, "\""+jtfNumberOfDigits.getText()+"\" is not a valid integer for the number of digits.", "Invalid input", JOptionPane.ERROR_MESSAGE);
        }
        
       	//TODO conf.getGeneralConfig().setColoredImages(colorImages.isSelected());

       	try {
       		String currentLF = conf.getJavaConfig().getLooknFeel(); // UIManager.getLookAndFeel();
       		logger.info("Selected LooknFeel:" + getLooknFeel());

       		if (!getLooknFeel().equals(currentLF)) {
           		setLooknFeel(getLooknFeel());
       			int n = JOptionPane.showConfirmDialog(parent,
       					"Keep this Look'n'Feel?",
       					"Keep this Look'n'Feel?",
       					JOptionPane.YES_NO_OPTION);

       			if (n == JOptionPane.YES_OPTION) {
       				conf.getJavaConfig().setLooknFeel(getLooknFeel());
       			} else {
       				setLooknFeel(currentLF);
       			}
       		}
       	} catch (Exception exc) {
       		// look&feel exception
       		//throw new SetLookAndFeelException(exc);
       		JOptionPane.showMessageDialog(parent, "The selected LooknFeel is not available.", "Selected LooknFeel not available.", JOptionPane.WARNING_MESSAGE);
       	}
       	
       	/* Font size: */ 
        int fontSize = cbFontSize.getSelectedObject();        
       	if (conf.getGeneralConfig().getFontSize()!=fontSize) {
       		conf.getGeneralConfig().setFontSize(fontSize);
            WidgetFactory.setFontSizeGlobal(conf.getGeneralConfig().getFontSize());
            SwingUtilities.updateComponentTreeUI(parent);
            SwingUtilities.updateComponentTreeUI(odialog);
            odialog.pack();
       	}
    }

    private void setLooknFeel(String id) throws ClassNotFoundException, IllegalAccessException,
            InstantiationException, UnsupportedLookAndFeelException {
        UIManager.setLookAndFeel(id);
        SwingUtilities.updateComponentTreeUI(parent);
        SwingUtilities.updateComponentTreeUI(odialog);
        odialog.pack();
    }

    private void setLooknFeel(LookAndFeel lf) throws ClassNotFoundException, IllegalAccessException,
            InstantiationException, UnsupportedLookAndFeelException {
        setLooknFeel(lfID2FullName(lf.getID()));
    }

	public void actionPerformed(ActionEvent e) {

	}
}

