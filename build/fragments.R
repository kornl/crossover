
if (model==1) { // "Standard additive model"
                mat rcDesign = design;
                for (unsigned i=1; i<rcDesign.n_rows; i++) {
                  rcDesign.row(i) = design.row(i)+design.row(i-1)*v;
                }
                return rcDesign;
} else if (model==2) { // "Self-adjacency model"
                       
} else if (model==3) { // "Proportionality model"
                       
} else if (model==4) { // "Placebo model"
                       return(createRowColumnDesign(design, v, model)) // if we drop the 0 column, we have to revisit this.
} else if (model==5) { // "No carry-over into self model" 
                       
} else if (model==6) { // "Treatment decay model"
                       
} else if (model==7) { // "Full set of interactions"
                       
} else 
  