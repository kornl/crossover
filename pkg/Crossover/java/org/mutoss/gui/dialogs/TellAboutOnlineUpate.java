package org.mutoss.gui.dialogs;

import java.awt.Container;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.DefaultStyledDocument;

import org.af.commons.widgets.WidgetFactory;
import org.af.commons.widgets.buttons.OKButtonPane;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mutoss.config.Configuration;

public class TellAboutOnlineUpate extends InfoDialog implements ActionListener {
	private static Log logger = LogFactory.getLog(TellAboutOnlineUpate.class);

	JButton jb = new JButton("Ok");
	private JCheckBox jcbHaveRead = new JCheckBox("Do not show this again");
	
	public TellAboutOnlineUpate(JFrame mainFrame) {
		super(mainFrame, "License", true);

		getContentPane().setLayout(new GridBagLayout());
		
		GridBagConstraints c = new GridBagConstraints();
		
		JTextArea jta3 = new JTextArea("Crossover\n"
				+"Copyright (C) 2010-2014 by K. Rohmeyer\n"
				+"\n"
				+"This program is free software; you can redistribute it and/or\n"
				+"modify it under the terms of the GNU General Public License\n"
				+"as published by the Free Software Foundation, Version 2.\n"				
				+"\n"
				+"This program is distributed in the hope that it will be useful,\n"
				+"but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
				+"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n"
				+"GNU General Public License for more details. It is included\n" 
				+"in the R distribution (in directory share/licenses) or can be\n" 
				+"found at: http://www.gnu.org/licenses/\n");
		jta3.setFont(new Font("Monospaced", Font.PLAIN, 10));

		c.fill = GridBagConstraints.HORIZONTAL;		
		c.gridx=0; c.gridy=0;
		c.gridwidth = 1; c.gridheight = 1;
		c.ipadx=10; c.ipady=10;
		c.weightx=1; c.weighty=1;
		
		jcbHaveRead.setSelected(Configuration.getInstance().getGeneralConfig().checkOnline());
		
		c.gridx=0;		
		c.weighty=1;
		JScrollPane js = new JScrollPane(jta3);
		(getContentPane()).add(js, c);	
		
		c.weighty=0;
		c.gridy++;
		(getContentPane()).add(jcbHaveRead, c);		
		
        Container cp = getContentPane();
        cp = WidgetFactory.makeDialogPanelWithButtons(cp, new OKButtonPane(), this);
		setContentPane(cp);
		
		pack();	
		
	    setLocationRelativeTo(mainFrame);
	    
		setVisible(true);		
	}

    public void actionPerformed(ActionEvent e) {
		Configuration.getInstance().getGeneralConfig().setHaveReadGPL(jcbHaveRead.isSelected());
		dispose();		
	}

}
