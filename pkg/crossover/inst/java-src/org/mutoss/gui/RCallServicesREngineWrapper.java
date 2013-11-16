package org.mutoss.gui;

import org.af.jhlir.backends.rengine.RCallServicesREngine;
import org.af.jhlir.call.REngineException;
import org.af.jhlir.call.RObj;
import org.rosuda.REngine.REngine;

public class RCallServicesREngineWrapper extends RCallServicesREngine {

	public RCallServicesREngineWrapper(REngine re) {
		super(re);		
	}
	
	public RObj eval(String expression) throws REngineException {
		return super.eval("eval(expression("+expression+"), envir=crossover:::crossover.env)");
	}

	public RObj evalInGlobalEnv(String expression) throws REngineException {
		return super.eval(expression);
	}
	
}
