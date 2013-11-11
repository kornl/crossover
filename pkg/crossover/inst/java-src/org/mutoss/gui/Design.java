package org.mutoss.gui;

import org.mutoss.config.Configuration;

public class Design {
	
	String title;
	String reference;
	String signature;
	int t, s, p;
	String design;
	Double efficiencyAdj = null;
	Double efficiencyUnadj = null;
	String result = null;
	String rName = null;
	
	public Design(String title, String rName, String reference, String signature, int t, int s, int p, String design) {
		this.title = title;
		this.rName = rName;
		this.reference = reference;
		this.signature = signature;
		this.t = t;
		this.s = s;
		this.p = p;
		this.design = design;
		double[] eff = RControl.getR().eval("crossover:::getEff("+(rName==null?design:rName)+")").asRNumeric().getData();
		efficiencyUnadj = eff[0];
		efficiencyAdj = eff[1];		
	}
	
	public String getRSignature() {
		String rSignature = "p = "+p+", n = "+s+", t = "+t;
		//if (signature.startsWith(rSignature)) return "same";
		return rSignature;
	}
	
	public String toString() {
		return title+" ("+signature+")";
	}
	
	public String getRDesign() {
		return design;
	}
	
	public String getTextDesign() {
		if (result != null) return result;
		result = RControl.getR().eval("paste(capture.output(print("+(rName==null?design:rName)+")), collapse=\"\\n\")").asRChar().getData()[0];
		/*if (efficiency == null) {
			RControl.getR().eval("design.out<-design.efficiency(design,nseq,ntrt,nper,nrep)");
		}*/
		return result;
	}

	public String getHTMLTable() {		
		String result = RControl.getR().eval("crossover:::getTable("+(rName==null?design:rName)+", type=\""+Configuration.getInstance().getProperty("outputF", "HTML")+"\")").asRChar().getData()[0];
		return result;
	}
}
