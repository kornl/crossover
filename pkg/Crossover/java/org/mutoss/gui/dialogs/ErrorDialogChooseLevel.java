package org.mutoss.gui.dialogs;

import java.awt.Font;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.net.URI;
import java.net.URLEncoder;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import org.af.commons.errorhandling.ErrorHandler;
import org.af.commons.errorhandling.HTTPPoster;
import org.af.commons.logging.ApplicationLog;
import org.af.commons.logging.LoggingSystem;
import org.af.commons.threading.SafeSwingWorker;
import org.af.commons.tools.StringTools;
import org.af.commons.widgets.GUIToolKit;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.FileAppender;
import org.apache.log4j.Logger;
import org.mutoss.config.Configuration;
import org.mutoss.gui.RControl;

import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

public class ErrorDialogChooseLevel extends ErrorDialogChooseLevelBase {

	
	public ErrorDialogChooseLevel(String msg, Object e, boolean fatal) {	
		super(msg, e, fatal);
	}
	
	public String getSubjectShort() {
		return "Crossover "+Configuration.getInstance().getGeneralConfig().getVersionNumber()+
		" (R "+Configuration.getInstance().getGeneralConfig().getRVersionNumber()+") " +
		"bug report from "+System.getProperty("user.name", "<unknown user name>")+
		" on "+System.getProperty("os.name", "<unknown OS>");
	}
	
	protected String getErrorReport(int level) {	
		
		if (level==0) return "Please reconsider reporting this error.";
		String text = subjectShort +" : "+  message +"\n"+ getSep("R Error Message") +getRErrorMessage() +getSep("R TraceBack")+getTraceBack()+"\n" + getSep("Java Stacktrace") +stacktrace;  			
    			//(message.length()<40?message:message.substring(0, 37)+"...");
		if (level==1) return text;
		
		List<String> rhistory = new Vector<String>();
		// We copy the history, to avoid a ConcurrentModificationException when there are still R commands executed.
		for (int i=0; i < RControl.getR().getHistory().size(); i++) {
			rhistory.add(RControl.getR().getHistory().get(i));
		}
		
		text += getSep("R Session Info")+getRSessionInfo() /*+sep+getGraph()*/ +getSep("R GUI History")+StringTools.collapseStringList(rhistory,"\n");
		if (level==2) return text;
		
		text += getSep("System Info")+getSystemInfo()+getSep("R Options")+getROptions();
		return text;
	}

		
	public static void main(String[] args) {
		LoggingSystem.init("/org/af/gMCP/gui/commons-logging.properties", false, true,	new ApplicationLog());
		ErrorHandler.init("rohmeyer@small-projects.de", "http://www.algorithm-forge.com/report/bugreport.php", true, true, ErrorDialogChooseLevel.class);
		RControl.getRControl(true).getR().eval("plot(z=1:100)");		
		throw new RuntimeException("This is a test.");
		//ErrorHandler.getInstance().makeErrDialog("Report Error");
	}
}
