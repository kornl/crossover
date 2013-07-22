test.2v.designs <- function() {
    design1 <- t(rbind(c(1,1,2,2),
                       c(2,2,1,1),
                       c(1,1,2,2),
                       c(2,2,1,1),
                       c(1,2,2,1),
                       c(2,1,1,2)))
    design2 <- t(rbind(c(1,1,2,1),
                       c(2,2,1,2),
                       c(1,1,2,1),
                       c(2,2,1,2),
                       c(1,2,2,1),
                       c(2,1,1,2)))
    design3 <- t(rbind(c(1,1,2,2),
                       c(2,2,1,1),
                       c(1,1,2,2),
                       c(2,2,1,1),
                       c(1,1,2,2),
                       c(2,2,1,1)))
    design4 <- t(rbind(c(1,1,2,2),
                       c(2,2,1,1),
                       c(1,1,2,2),
                       c(2,2,1,1),
                       c(1,1,2,2),
                       c(2,2,1,1))) # Why is there no design 4 in the book?
    design5 <- t(rbind(c(1,2,2,2),
                       c(2,1,1,1),
                       c(1,2,2,2),
                       c(2,1,1,1),
                       c(1,1,2,2),
                       c(2,2,1,1)))
    design6 <- t(rbind(c(1,2,1,2),
                       c(2,1,2,1),
                       c(1,1,2,1),
                       c(2,2,1,2),
                       c(1,2,1,2),
                       c(2,1,2,1)))
    design7 <- t(rbind(c(1,1,2,1),
                       c(2,2,1,2),
                       c(1,1,1,2),
                       c(2,2,2,1),
                       c(1,2,1,1),
                       c(2,1,2,2)))
    design8 <- t(rbind(c(1,2,2,2),
                       c(2,1,1,1),
                       c(1,1,2,2),
                       c(2,2,1,1),
                       c(1,2,1,2),
                       c(2,1,2,1)))
    
    designs <- list(design1, design2, design3, design4, design5, design6, design7, design8)
    
    models <- c("Standard additive model",
                "Self-adjacency model",
                "Proportionality model",
                "Placebo model",
                "No carry-over into self model",
                "Treatment decay model",
                "Full set of interactions",
                "Second-order carry-over effects")
    
    s <- 6; p <- 4; v <- 2
    
    results <- list()
    
    for (i in c(1,2,3,4,5,6)) {  
        model <- models[i]
        cat("======= ", model, " =======","\n")
        
        result <- searchCrossOverDesign(s=s, p=p, v=v, model=model)
        print(result)
        print(plot(result))
        
        print(general.carryover(designs[[i]], model=i))  
    }
    
    estimable(design3, v, model=3)
    
    searchCrossOverDesign(s=s, p=p, v=v, model=3)
    searchCrossOverDesign(s=s, p=p, v=v, model=3, start.designs=list(design3))
    
}