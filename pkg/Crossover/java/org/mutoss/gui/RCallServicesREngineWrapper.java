package org.mutoss.gui;

import org.af.jhlir.backends.rengine.RCallServicesREngine;
import org.af.jhlir.call.REngineException;
import org.af.jhlir.call.RObj;
import org.rosuda.REngine.REngine;

public class RCallServicesREngineWrapper extends RCallServicesREngine {

	public RCallServicesREngineWrapper(REngine re) {
		super(re);		
	}
	
	public synchronized RObj eval(String expression) throws REngineException {		
        //System.out.println("Calling R from thread " + Thread.currentThread().getId() + ".");
		return super.eval("eval(expression("+expression+"), envir=Crossover:::Crossover.env)");
	}

	public synchronized RObj evalInGlobalEnv(String expression) throws REngineException {
		//System.out.println("Calling R from thread " + Thread.currentThread().getId() + ".");
		return super.eval(expression);
	}
	
}
