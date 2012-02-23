con <- textConnection("
1 2 3  1 2 3
2 3 1  3 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 6, t = 3"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 1 FOR p < t"
pattersonLucasPltT1 <- t



con <- textConnection("
1 2 3 4  1 2 3 4  1 2 3 4
2 1 4 3  3 4 1 2  4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 12, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 3 FOR p < t"
pattersonLucasPltT3 <- t





con <- textConnection("
1 2 3 4  1 2 3 4  1 2 3 4
2 1 4 3  3 4 1 2  4 3 2 1
3 4 1 2  4 3 2 1  2 1 4 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 12, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 4 FOR p < t"
pattersonLucasPltT4 <- t





con <- textConnection("
1 2 3 4  1 2 3 4  1 2 3 4
2 1 4 3  3 4 1 2  4 3 2 1
3 4 1 2  4 3 2 1  2 1 4 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 12, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 4 FOR p < t"
pattersonLucasPltT5 <- t







save(pattersonLucasPltT1, pattersonLucasPltT3, pattersonLucasPltT4,  file="pattersonLucasPltT.rda")

