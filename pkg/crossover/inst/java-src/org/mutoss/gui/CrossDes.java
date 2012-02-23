package org.mutoss.gui;

import java.util.List;
import java.util.Vector;

/**
 * Loads designs from package crossdes
 */
public class CrossDes {

	public static List<Design> getDesigns(int t, int p, int s1, int s2) {
		List<Design> list = new Vector<Design>();
		
		for (int s=s1; s<=s2; s++) {
			String title = null;
			String reference = null;
			String signature = null;
			String result = null;
			Design design = new Design(title, reference, signature, t, s, p, result);
			list.add(design);
		}
		
		return list;
	}
	
}
