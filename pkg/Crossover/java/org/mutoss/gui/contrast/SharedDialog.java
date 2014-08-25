package org.mutoss.gui.contrast;

import javax.swing.JFrame;

abstract public class SharedDialog extends StatMethodDialog {

	protected SharedDialog(JFrame owner, String title) {
        super(owner, title);
    }

    protected SharedDialog(JFrame owner, String title, boolean dataSetNeeded) {
        super(owner, title, dataSetNeeded);
    }

}
