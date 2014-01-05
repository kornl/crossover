package org.mutoss.gui;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;

import org.af.commons.errorhandling.ErrorHandler;
import org.af.commons.logging.ApplicationLog;
import org.af.commons.logging.LoggingSystem;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mutoss.gui.dialogs.ErrorDialogSGTK;
import org.rosuda.JRI.Rengine;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.JRI.JRIEngine;

public class RControl {

	private static final Log logger = LogFactory.getLog(RControl.class);

	protected static RControl rc = null;

	public static RControl getRControl(boolean debug) {
		if (rc==null) {
			rc = new RControl(debug); 
		}
		return rc;
	}

	public static RCallServicesREngineWrapper getR() {
		getRControl(true);
		return rcs;
	}

	protected static RCallServicesREngineWrapper rcs = null;
	protected static DebugTextConsole console = null;

	protected RControl(boolean debug) {
		if (!LoggingSystem.alreadyInitiated()) {
			LoggingSystem.init(
					"/org/mutoss/gui/commons-logging.properties",
					System.getProperty("eclipse") == null && !debug,
					System.getProperty("eclipse") != null || debug,
					new ApplicationLog());
			ErrorHandler.init("rohmeyer@small-projects.de", "http://www.algorithm-forge.com/report/bugreport.php", true, true, ErrorDialogSGTK.class);
		}
		if (!Rengine.versionCheck()) {
            System.err.println("Error: API version of the Rengine class and the native binary differ.");
            System.exit(1);
        }
		Rengine rengine = Rengine.getMainEngine();
		if (rengine == null) {
			// Call java with VM arguments: -Declipse="true"
			if (System.getProperty("eclipse") != null) {
				console = new DebugTextConsole();
				rengine = new Rengine(new String[] {"--vanilla"}, true, console);
			} else {
				rengine = new Rengine();
				//console = new DebugTextConsole();
				//rengine.addMainLoopCallbacks(console);
			}
		}
		try {
			rcs = new RCallServicesREngineWrapper(new JRIEngine(rengine));
			if (System.getProperty("eclipse") != null) {	
				rcs.eval("require(crossover)");
				rcs.eval("require(JavaGD)");
				rcs.eval("warnings()"); /* Otherwise the first error will also show: 
					In addition: Warning message:
					In .jinit(parameters = "-Xrs") :
					Cannot set VM parameters, because VM is running already.*/
 
			}
		} catch (REngineException e) {
			ErrorHandler.getInstance().makeErrDialog("Error creating RCallServicesREngine!", e);
		}
		if (System.getProperty("eclipse") == null && !debug) System.setOut(new PrintStream(new LoggingOutputStream(logger), true));
	}

}

class LoggingOutputStream extends ByteArrayOutputStream { 

	private String lineSeparator;    
	Log logger;

	public LoggingOutputStream(Log logger) { 
		super(); 
		this.logger = logger; 
		lineSeparator = System.getProperty("line.separator"); 
	} 

	public void flush() throws IOException { 
		String record; 
		synchronized(this) { 
			super.flush(); 
			record = this.toString(); 
			super.reset(); 
			if (record.length() == 0 || record.equals(lineSeparator)) return; 
			logger.info(record); 
		} 
	} 
} 
