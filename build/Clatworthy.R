path <- system.file("data", package="Crossover")
for (file in dir(path=path)) {		 
  designs <- load(paste(path, file, sep="/"))
  for (designS in designs) {
    design <- get(designS)
    p <- dim(design)[1]
    s <- dim(design)[2]
    v <- length(levels(as.factor(design)))			
    if(!Crossover:::estimable(design, v, 1)) {
      cat(designS, " is not estimable!\n")
    }
  }
}

library(Crossover)
path <- system.file("data", package="Crossover")
balancedDesigns1 <- c()
balancedDesigns2 <- c()
for (file in dir(path=path)) {  	 
  if (file %in% c("clatworthy1.rda", "clatworthyC.rda", "pbib2combine.rda")) next
  designs <- load(paste(path, file, sep="/"))
  for (designS in designs) {
    design <- get(designS)
    p <- dim(design)[1]
    s <- dim(design)[2]
    v <- length(levels(as.factor(design)))			
    variances <- general.carryover(design, model=1)$Var.trt.pair[upper.tri(diag(v))]
    if(isTRUE(all.equal(min(variances), max(variances)))) {
      balancedDesigns1 <- c(balancedDesigns1, designS)
      cat(designS, " is balanced!\n")
    }
    if (max(variances)-min(variances)<0.001 && !isTRUE(all.equal(min(variances), max(variances)))) {
      balancedDesigns2 <- c(balancedDesigns2, designS)
      cat(designS, " is nearly balanced (", max(variances)-min(variances) ,")!\n")
    }
  }
}

# Result 17.10.2014:
balancedDesigns1 <- c("andersonPreece", "anderson", "archdeacon", "atkinson3t", "atkinson4t", 
                      "atkinson5t", "balaam3t", "balaam4t", "balaam5t", "balaam6t", 
                      "berenblut3t", "berenblut4t", "berenblut5t", "davisHall7tb", 
                      "federerAtkinson3ta", "federerAtkinson3tb", "federerAtkinson4ta", 
                      "federerAtkinson4tb", "federerAtkinson5ta", "fletcher9", "iqbalJones1", 
                      "iqbalJones2", "iqbalJones3", "iqbalJones4", "iqbalJones5", "iqbalJones7", 
                      "iqbalJones11", "iqbalJones17", "iqbalJones23", "lewisFletcherMatthews3", 
                      "orthogonalLatinSquare3t", "orthogonalLatinSquare4t", "orthogonalLatinSquare5t", 
                      "orthogonalLatinSquare7t", "pattersonLucasExtraPeriod30", "pattersonLucasExtraPeriod31", 
                      "pattersonLucasExtraPeriod32", "pattersonLucasExtraPeriod33", 
                      "pattersonLucasExtraPeriod34", "pattersonLucasExtraPeriod35", 
                      "pattersonLucasExtraPeriod36", "pattersonLucasExtraPeriod37", 
                      "pattersonLucasExtraPeriod38", "pattersonLucasExtraPeriod39", 
                      "pattersonLucasExtraPeriod40", "pattersonLucasExtraPeriod41", 
                      "pattersonLucasExtraPeriod42", "pattersonLucasExtraPeriod43", 
                      "pattersonLucasExtraPeriod44", "pattersonLucasExtraPeriod45", 
                      "pattersonLucasExtraPeriod46", "pattersonLucasExtraPeriod47", 
                      "pattersonLucasExtraPeriod48", "pattersonLucasExtraPeriod49", 
                      "pattersonLucasExtraPeriod86", "pattersonLucasPltT1", "pattersonLucasPltT3", 
                      "pattersonLucasPltT4", "pattersonLucasPltT5", "pattersonLucasPltT7", 
                      "pattersonLucasPltT8", "pattersonLucasPltT9", "pattersonLucasPltT10", 
                      "pattersonLucasPltT12", "pattersonLucasPltT13", "pattersonLucasPltT15", 
                      "pattersonLucasPltT16", "pattersonLucasPltT17", "pattersonLucasPltT18", 
                      "pattersonLucasPltT19", "pattersonLucasPltT20", "pattersonLucasPltT21", 
                      "pattersonLucasPltT22", "pattersonLucasPltT23", "prescott1", 
                      "prescott2", "quenouille3t2", "quenouille4t1", "quenouille4t2", 
                      "quenouille4t3", "switchback3t", "switchback4t", "switchback5t", 
                      "switchback6t", "switchback7t", "williams3t", "williams4t", "williams5t", 
                      "williams6t", "williams7t", "williams8t", "williams9t")
balancedDesigns2 <- c("bateJones5t", "bateJones8t", "iqbalJones31", "quenouille3t1")
balancedDesigns <- c(balancedDesigns1, balancedDesigns2)

# Show all designs in the data files.
path <- system.file("data", package="Crossover")
balancedDesigns1 <- c()
balancedDesigns2 <- c()
for (file in dir(path=path)) {     
  #if (file %in% c("clatworthy1.rda", "clatworthyC.rda")) next
  cat(file, "\n")
  designs <- load(paste(path, file, sep="/"))
  print(designs)
}
