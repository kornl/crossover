con <- textConnection("
1 2 3  1 2 3
2 3 1  3 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 6, t = 3"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 1 FOR p < t"
pattersonLucasPltT1 <- t




save(pattersonLucasPltT1,  file="pattersonLucasPltT.rda")

