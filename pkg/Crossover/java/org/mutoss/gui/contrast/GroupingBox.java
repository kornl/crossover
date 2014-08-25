package org.mutoss.gui.contrast;

import java.util.ArrayList;
import java.util.List;

public class GroupingBox extends VarSelectBox {

    public GroupingBox(RLegalName vars[]) {
        super(vars);
    }

    public GroupingBox(List<RLegalName> vars) {
        super(vars);
    }


    public RLegalName getGrouping() {
        return getSelectedObject();
    }

    public List<String> getAllGroupings() {
        List<String> gs = new ArrayList<String>();
        for (int i=0; i<getItemCount(); i++)
            gs.add(getModel().getElementAt(i).toString());
        return gs;
    }
}
