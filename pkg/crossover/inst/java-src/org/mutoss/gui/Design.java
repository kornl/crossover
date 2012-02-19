package org.mutoss.gui;

public class Design {
	
	String title;
	String reference;
	String signature;
	int t, s, p;
	String design;
	
	public Design(String title, String reference, String signature, int t, int s, int p, String design) {
		this.title = title;
		this.reference = reference;
		this.signature = signature;
		this.t = t;
		this.s = s;
		this.p = p;
		this.design = design;
	}
	
	public String toString() {
		return title+" ("+signature+")";
	}
	
	public String getRDesign() {
		return design;
	}
	
	public String getTextDesign() {
		String result = RControl.getR().eval("paste(capture.output(print("+design+")), collapse=\"\\n\")").asRChar().getData()[0];
		return result;
	}
}
