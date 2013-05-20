package org.mutoss.gui;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;

import org.af.commons.errorhandling.ErrorHandler;
import org.af.commons.logging.ApplicationLog;
import org.af.commons.logging.LoggingSystem;
import org.af.jhlir.backends.rengine.RCallServicesREngine;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mutoss.gui.dialogs.ErrorDialogSGTK;
import org.rosuda.JRI.Rengine;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.JRI.JRIEngine;

public class RControlTest {

	private static final Log logger = LogFactory.getLog(RControlTest.class);

	protected static RControlTest rc = null;

	public static RControlTest getRControl(boolean debug) {
		if (rc==null) {
			rc = new RControlTest(debug); 
		}
		return rc;
	}

	public static RCallServicesREngine getR() {
		getRControl(true);
		return rcs;
	}

	protected static RCallServicesREngine rcs = null;
	public static DebugTextConsole console = null;

	public RControlTest(boolean debug) {
		if (!LoggingSystem.alreadyInitiated()) {
			LoggingSystem.init(
					"/org/mutoss/gui/commons-logging.properties",
					System.getProperty("eclipse") == null && !debug,
					System.getProperty("eclipse") != null || debug,
					new ApplicationLog());
			ErrorHandler.init("rohmeyer@small-projects.de", "http://www.algorithm-forge.com/report/bugreport.php", true, true, ErrorDialogSGTK.class);
		}
		Rengine rengine = Rengine.getMainEngine();
		if (rengine == null) {
			// Call java with VM arguments: -Declipse="true"
			if (System.getProperty("eclipse") != null) {
				console = new DebugTextConsole();
				rengine = new Rengine(new String[] {"--vanilla"}, true, console);
			} else {
				rengine = new Rengine();
			}
		}
		try {
			rcs = new RCallServicesREngine(new JRIEngine(rengine));
			if (System.getProperty("eclipse") != null) {	
				rcs.eval("require(crossover)");
				rcs.eval("require(JavaGD)");
			}
		} catch (REngineException e) {
			ErrorHandler.getInstance().makeErrDialog("Error creating RCallServicesREngine!", e);
		}
		if (System.getProperty("eclipse") == null && !debug) System.setOut(new PrintStream(new LoggingOutputStream(logger), true));
		for (int s=4; s<=8; s++) {
			RControl.getR().evalVoid(".tmpDesign <- matrix(as.integer(t(find.BIB(trt=4, b="+s+", k=4, iter = 30))),nrow=4)");
		}
	}

}