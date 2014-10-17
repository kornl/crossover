package org.mutoss.gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.DefaultStyledDocument;

import org.af.commons.io.FileTransfer;
import org.af.commons.widgets.HTMLPaneWithButtons;
import org.af.commons.widgets.RightClickTextMenuListener;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mutoss.config.Configuration;

public class HTMLOutputPane extends JPanel implements ActionListener {
    private static final Log logger = LogFactory.getLog(HTMLOutputPane.class);
    protected static final long serialVersionUID = 1L;
    protected HTMLPaneWithButtons textArea;
    protected JScrollPane scrollPane;
    protected RControl rctrl;
    protected DefaultStyledDocument doc;
    CrossoverGUI gui;    

    public HTMLOutputPane(CrossoverGUI gui) {
    	this.gui = gui;
        makeComponents();
        textArea.addMouseListener(new RightClickTextMenuListener(textArea));
        textArea.setEditable(true);
        doTheLayout();
    }

    public void clear() {
    	textArea.clear();
    }
    
    public void showDesign(Design design) {
    	textArea.clear();
    	textArea.appendParagraph(textArea.makeBold(design.title + " ("+design.getRSignature()+")"));
    	textArea.appendParagraph("");
    	textArea.appendHTML(design.getHTMLTable());
    	textArea.appendParagraph("<b>Av.eff.trt.pair.adj:</b> "+gui.df.format(design.efficiencyAdj));
    	if (design.reference!=null) textArea.appendParagraph(textArea.makeBold("Reference: ")+"<i>"+design.reference.replaceAll("\\n", "<br>")+"</i>");
    	textArea.appendParagraph(getGeneralCarryover(design));	
	}

	private String getGeneralCarryover(Design design) {
		String result = "<p><b>Model:</b> "+(gui.jCBmodel.getSelectedItem())+ "<br></p>";
		if (!design.isEstimable(gui.getModel())) {
    		result += "<b style=\"color:red\"> Design does not allow to estimate all treatment differences under this model. </b>";
    	} else {
    		String command = "Crossover:::getDesignText("+design.uniqueName+", model="+gui.getModel()
    				+", type=\""+Configuration.getInstance().getProperty("outputF", "HTML")+"\""
    				+", carryover="+(Boolean.parseBoolean(Configuration.getInstance().getProperty("showCarryOver", ""+false))?"TRUE":"FALSE")
    				+", digits="+Configuration.getInstance().getGeneralConfig().getDigits()
    				+", names="+(Boolean.parseBoolean(Configuration.getInstance().getProperty("showNames", ""+true))?"TRUE":"FALSE")
    				+")";
    		result += RControl.getR().eval(command).asRChar().getData()[0];
    	}
		return result;
	}

	public void showError(Throwable e) throws BadLocationException, IOException {    	
        String s = e.getMessage();
        String tok = "af.statguitoolkit.rinterface.exceptions.REvalException: ";
        if (s.startsWith(tok)) {            
            s = s.substring(tok.length());
            int i = s.indexOf(":");        
            if (i!=-1) s = textArea.makeBoldItalics(s.substring(i+2))+"("+s.substring(0, i)+")";            
        }
        textArea.appendParagraph(textArea.makeBold("Error: ")+textArea.makeBoldItalics(s));
        
    }

	// TODO bad method, refactor, images are transferred every single time, etc
    private String makeTable2FormatButton(String imageName, String label, ActionListener al) {
        String imageCode = "";
        try {
            String path = FileTransfer.copyFileToLocalDir("/af/statguitoolkit/images", imageName, new File(System.getProperty("java.io.tmpdir"))).getAbsolutePath();
            path = path.replace("\\", "\\\\");
            imageCode = "<img src=\"file:///" + path + "\" >";
        } catch (IOException e) {
            logger.error("Error copying LaTeX/HTML-Image.");
            imageCode = label;
        }
        return textArea.makeButtonString(imageCode, al);
    }

    /**
     * Instantiation of Swing-Components.
     */
    private void makeComponents() {
        textArea = new HTMLPaneWithButtons();
        doc = (DefaultStyledDocument) textArea.getDocument();
    }

    private void doTheLayout() {
        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
        Box b = Box.createHorizontalBox();
        scrollPane = new JScrollPane(textArea);
        b.add(scrollPane);
        add(b);
    }

    public void actionPerformed(ActionEvent e) {
        
    }

	public void setEditable(boolean b) {
		textArea.setEditable(b);		
	}

	public void appendParagraph(String string) {
		textArea.appendParagraph(string);
	}
}
