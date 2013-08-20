package org.mutoss.gui.infinite;

public class SearchProgress {
	int n;
	double maxEff;
	double[][] eff;
	
	public SearchProgress(int n, double maxEff, double[][] eff) {
		this.n = n;
		this.maxEff = maxEff;
		this.eff = eff;
	}
}
