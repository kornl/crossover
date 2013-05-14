package org.mutoss.gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class VariableNameDialog extends JDialog implements ActionListener {
	JButton ok = new JButton("Ok");

    JFrame parent;
    JTextField jt = new JTextField("", 30);
    
	public VariableNameDialog(JFrame parent, String name) {
		super(parent, "R object name", true);
		setLocationRelativeTo(parent);
		this.parent = parent;		

		String cols = "5dlu, pref, 5dlu, fill:pref:grow, 5dlu, pref, 5dlu";
		String rows = "5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu, pref, 5dlu";

		FormLayout layout = new FormLayout(cols, rows);
		getContentPane().setLayout(layout);
		CellConstraints cc = new CellConstraints();

		int row = 2;

		jt.setText(name);
		jt.addActionListener(this);
		getContentPane().add(new JLabel("R object name:"), cc.xy(2, row));
		getContentPane().add(jt, cc.xyw(4, row, 3));

		row += 2;

		getContentPane().add(ok, cc.xy(6, row));
		ok.addActionListener(this);        

		actionPerformed(null);

		pack();
		setVisible(true);
	}

	public VariableNameDialog(CrossoverGUI graphGUI) {
		this(graphGUI, Configuration.getInstance().getClassProperty(VariableNameDialog.class, "variableName", ""));
	}

	public void actionPerformed(ActionEvent e) {
		Configuration.getInstance().setClassProperty(VariableNameDialog.class, "variableName", jt.getText());
		dispose();
	}	
	
	public String getName() {
		return RControl.getR().eval("make.names(\""+jt.getText()+"\")").asRChar().getData()[0];
	}
}