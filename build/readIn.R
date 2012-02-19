con <- textConnection("
1 2 3 4 
2 1 4 3
4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 3, n = 4, t = 4"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 2 DESIGN 1"
fletcher1 <- t




save(, file="iqbalJones.rda")

