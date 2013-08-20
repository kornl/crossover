package org.mutoss.gui.infinite;

import java.util.List;
import java.util.concurrent.CancellationException;

import org.jdesktop.swingworker.SwingWorker;
import org.mutoss.gui.RControl;


public class InfiteSearchSwingWorker extends SwingWorker<SearchProgress, SearchProgress> {

	InfiniteRunningDialog ird;
	
	public InfiteSearchSwingWorker(InfiniteRunningDialog ird) {        
        this.ird = ird;          
                
    }
	
	protected SearchProgress doInBackground() throws Exception {		
		 while (true) {			 
			 publish(newSearchProgress());
	    }
	}
	
	 private SearchProgress newSearchProgress() {
		 RControl.getR().eval(".COresult <- "+ird.getCommand());
		 
		return null;
	}

	protected void process(List<SearchProgress> chunks) {
         for (SearchProgress s : chunks) {
             ird.append(s);
         }
     }

	public void done() {                
		try {
            SearchProgress sp = get();
        } catch (CancellationException e) {
            //onCancel();
        } catch (Throwable e) {            
        	throw new RuntimeException(e);
        }
	}
	
}
