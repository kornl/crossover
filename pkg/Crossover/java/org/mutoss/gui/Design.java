package org.mutoss.gui;

import org.mutoss.config.Configuration;

/**
 * Class for crossover design 
 * @author kornel
 * The class design is created with a reference to an R object.
 * 
 */

public class Design {
	
	String title;
	String reference;
	String signature;
	public int t;
	public int s;
	public int p;
	String design;
	double[] effs = null;
	String result = null;
	String rName = null;
	String uniqueName = null;
	
	public Design(String title, String rName) {
		this(title, rName, null);
	}
	
	/**
	 * Constuctor of design object
	 * @param title Title for Design. For example "FLETCHER FACTORIAL 2 x 2 DESIGN 3".
	 * @param rName
	 */
	public Design(String title, String rName, String reference) {
		this.title = title;		
		this.rName = rName;
		this.reference = reference;
		saveDesign2R(true);
		this.t = RControl.getR().eval("length(levels(as.factor("+uniqueName+")))").asRInteger().getData()[0];		
		int[] dim = RControl.getR().eval("dim("+uniqueName+")").asRInteger().getData();
		p = dim[0];
		s = dim[1];		
		design = RControl.getR().eval("paste(capture.output(dput("+uniqueName+")), collapse=\"\")").asRChar().getData()[0];
		effs = RControl.getR().eval("Crossover:::getEff("+uniqueName+")").asRNumeric().getData();
	}
	
	/**
	 * Contructor for crossover design objects. 
	 * @param title
	 * @param rName
	 * @param reference
	 * @param signature
	 * @param t
	 * @param s
	 * @param p
	 * @param design
	 */
	public Design(String title, String rName, String reference, String signature, int t, int s, int p, String design) {
		this.title = title;
		this.rName = rName;
		this.reference = reference;
		this.signature = signature;
		this.t = t;
		this.s = s;
		this.p = p;
		this.design = design;
		effs = RControl.getR().eval("Crossover:::getEff("+(rName==null?design:rName)+")").asRNumeric().getData();	
		saveDesign2R(true);
	}
	
	/**
	 * Saves a design to R with an unique name consisting out of the prefix "CODesig." and the result of a hash function applied to the object.
	 * @param useRName If useRName is false, it is required that uniqueName is already set.
	 * Normally saveDesign2R(true) is only called in the constructor and after that one calls saveDesign2R(false).
	 * @return
	 */
	public String saveDesign2R(boolean useRName) {
		if (useRName) {
			uniqueName = "CODesign."+RControl.getR().eval("digest::digest(getDesign("+rName+"))").asRChar().getData()[0];
			RControl.getR().eval(uniqueName+"<- getDesign("+rName+")");
		}
		RControl.getR().eval("attr("+uniqueName+",\"rName\") <- \""+rName+"\"");
		if (reference!=null) RControl.getR().eval("attr("+uniqueName+",\"reference\") <- \""+escape(reference)+"\"");
		RControl.getR().eval("attr("+uniqueName+",\"title\") <- \""+escape(title)+"\"");
		return uniqueName;
	}	
	
	public static String escape(String s) {
		s = s.replaceAll("\\\\", "\\\\\\\\");
		s = s.replaceAll("\"", "\\\\\"");
		return s;
	}
	
	public static void main(String[] args) {
		System.out.println("Test \" \\ ");
		System.out.println(escape("Test \" \\ "));
	}

	public void setRName(String name) {
		//if (RControl.getR().eval("Crossover:::isRName("+name+")").asRLogical().getData()[0]) {}
		rName = RControl.getR().eval("make.names("+name+")").asRChar().getData()[0];
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
		result = RControl.getR().eval("paste(capture.output(print("+(uniqueName==null?design:uniqueName)+")), collapse=\"\\n\")").asRChar().getData()[0];
		/*if (efficiency == null) {
			RControl.getR().eval("design.out<-design.efficiency(design,nseq,ntrt,nper,nrep)");
		}*/
		return result;
	}

	public String getHTMLTable() {		
		String result = RControl.getR().eval("Crossover:::getTable("+(uniqueName==null?design:uniqueName)
				+", type=\""+Configuration.getInstance().getProperty("outputF", "HTML")+"\"" 
				+", names="+(Boolean.parseBoolean(Configuration.getInstance().getProperty("showNames", ""+true))?"TRUE":"FALSE")+")").asRChar().getData()[0];
		return result;
	}

	public boolean isEstimable(int model) {
		return RControl.getR().eval("Crossover:::estimable("+uniqueName+", "+t+", "+model+")").asRLogical().getData()[0];		
	}

	public String getUniqueName() {
		return uniqueName;
	}
}
