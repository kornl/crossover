package org.mutoss.gui.options;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JDialog;
import javax.swing.JTabbedPane;

import org.af.commons.errorhandling.ErrorHandler;
import org.af.commons.widgets.WidgetFactory;
import org.af.commons.widgets.buttons.OkApplyCancelButtonPane;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mutoss.config.Configuration;
import org.mutoss.gui.CrossoverGUI;
import org.mutoss.gui.MenuBarCrossover;

/**
 * Dialog for configuring various settings.
 */
public class OptionsDialog extends JDialog implements ActionListener {
	private static final Log logger = LogFactory.getLog(OptionsDialog.class);

	private JTabbedPane tabbedPane;
    private GeneralPanel visualPanel;
    private OutputPanel outputPanel;
//    private MiscPanel miscPanel;
    private OkApplyCancelButtonPane bp;

    private Configuration conf;

    CrossoverGUI parent;

    /**
     * Standard constructor
     */
    public OptionsDialog(CrossoverGUI p) {
    	super(p);
    	this.parent = p;
        this.conf = Configuration.getInstance();
        setModal(true);
        setTitle("Options");

        setDefaultCloseOperation(DISPOSE_ON_CLOSE);

        makeComponents();
        doTheLayout();
        
        pack();
        setLocationRelativeTo(p);
        setVisible(true);
    }

    /**
     * Instantiation of Swing-Components.
     */
    private void makeComponents() {
        tabbedPane = new JTabbedPane();
        visualPanel = new GeneralPanel(parent, this);
        outputPanel = new OutputPanel(parent, this);
//        miscPanel = new MiscPanel(conf);        
        bp = new OkApplyCancelButtonPane();
    }

    /**
     * Do the layout.
     */
    private void doTheLayout() {
    	tabbedPane.addTab("Output", outputPanel);
        tabbedPane.addTab("Visual", visualPanel);
//        tabbedPane.addTab("Misc", miscPanel);
        Container cp = getContentPane();
        cp.add(tabbedPane);
        cp = WidgetFactory.makeDialogPanelWithButtons(cp, bp, this);
        setContentPane(cp);
    }

    /**
     * Calls setProperties of the selected OptionsPanel of the TabbedPane on OK.
     * @param e ActionEvent to process.
     */
    public void actionPerformed(ActionEvent e) {
    	logger.debug("Got ActionCommand "+e.getActionCommand());
        if ( (e.getActionCommand().equals(OkApplyCancelButtonPane.OK_CMD)) ||
        		(e.getActionCommand().equals(OkApplyCancelButtonPane.APPLY_CMD)) ) {
            try {
            	visualPanel.setProperties();
            	outputPanel.setProperties();
            	//miscPanel.setProperties();
                if  (e.getActionCommand().equals(OkApplyCancelButtonPane.OK_CMD)) {
                	dispose();
                }
                
                parent.repaint();
            } catch (SetLookAndFeelException exc) {
                ErrorHandler.getInstance().makeErrDialog(exc.getMessage(), exc);
            }
        }
        if (e.getActionCommand().equals(OkApplyCancelButtonPane.CANCEL_CMD)) {
            dispose();
        }
        ((MenuBarCrossover)parent.getJMenuBar()).createExtraMenu();
    }

}


