package org.mutoss.gui;

public class Design {
	
	String title;
	String reference;
	String signature;
	int t, s, p;
	String design;
	Double efficiency = null;
	String result = null;
	
	public Design(String title, String reference, String signature, int t, int s, int p, String design) {
		this.title = title;
		this.reference = reference;
		this.signature = signature;
		this.t = t;
		this.s = s;
		this.p = p;
		this.design = design;
	}
	
	public String getRSignature() {
		String rSignature = "p = "+p+", n = "+s+", t = "+t;
		if (signature.startsWith(rSignature)) return "same";
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
		result = RControl.getR().eval("paste(capture.output(print("+design+")), collapse=\"\\n\")").asRChar().getData()[0];
		/*if (efficiency == null) {
			RControl.getR().eval("design.out<-design.efficiency(design,nseq,ntrt,nper,nrep)");
		}*/
		return result;
	}
}
