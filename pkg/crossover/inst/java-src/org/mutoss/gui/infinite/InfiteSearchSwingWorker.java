package org.mutoss.gui.infinite;

import java.util.List;
import java.util.concurrent.CancellationException;

import javax.swing.JDialog;
import javax.swing.JOptionPane;

import org.jdesktop.swingworker.SwingWorker;
import org.mutoss.gui.RControl;
import org.mutoss.gui.dialogs.TextFileViewer;


public class InfiteSearchSwingWorker extends SwingWorker<SearchProgress, SearchProgress> {

	InfiniteRunningDialog ird;
	int run = 0;
	String fullcommand;
	
	boolean canceled = false;
	
	public InfiteSearchSwingWorker(InfiniteRunningDialog ird) {        
        this.ird = ird;          
                
    }
	
	protected SearchProgress doInBackground() throws Exception {
		boolean first = true;
		while (!canceled) {			 
			 publish(newSearchProgress(first));
			 first = false;
	    }
		return null;
	}
	
	private SearchProgress newSearchProgress(boolean first) {
		run++;
		fullcommand = "crossover:::infiniteSearch("+(first?"oldResult=NULL, ":"oldResult=.COresult, ")+ird.getCommand()
				+(first?ird.models:"")+")";
		RControl.getR().eval(".COresult <- " + fullcommand);	
		double[] maxEff = RControl.getR().eval("crossover:::getMaxEffPerRun(.COresult)").asRNumeric().getData();
		return new SearchProgress(run, maxEff, null);
	}

	protected void process(List<SearchProgress> chunks) {
         for (SearchProgress s : chunks) {
             ird.append(s);
         }
     }
	
	public void done() {                
		try {
            SearchProgress sp = get();
            String table = RControl.getR().eval("crossover:::getTable(getDesign(.COresult))").asRChar().getData()[0];
            ird.gui.algorithmPanel.searchResultReady(table);            
        } catch (CancellationException e) {
            //onCancel();
        } catch (Throwable e) {            
        	String message = e.getMessage();
			//System.out.println("\""+message+"\"");
			if (message.equals("Error: \n")) message = "Empty message (most likely an error in the C++ code - please look at the R console for further output)\n\n";
			JOptionPane.showMessageDialog(ird.gui, "R call produced an error:\n\n"+message+"\nWe will open a window with R code to reproduce this error for investigation.", "Error in R Call", JOptionPane.ERROR_MESSAGE);
			new TextFileViewer(ird.gui, "R Objects", "The following R code produced the following error:\n\n" +message+
							fullcommand, true);
			e.printStackTrace();
        } finally {
        	ird.gui.glassPane.stop();
        	ird.dispose();
        }
	}

	public void cancel() {
		canceled = true;		
	}
	
}
