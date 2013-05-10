package org.mutoss.gui.contrast;

import java.util.List;

import org.af.commons.widgets.lists.MyJComboBox;

public class VarSelectBox extends MyJComboBox<RLegalName>{
    public VarSelectBox(List<RLegalName> objects) {
        super(objects);
    }

    public VarSelectBox(RLegalName[] objects) {
        super(objects);
    }
}
