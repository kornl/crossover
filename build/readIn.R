con <- textConnection("
1 2 3 1 2 3
2 3 1 3 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 6, t = 3"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 1 FOR p < t"
pattersonLucasBalanced1 <- t





save(pattersonLucasBalanced1, pattersonLucasBalanced3, pattersonLucasBalanced4, pattersonLucasBalanced5, pattersonLucasBalanced7, pattersonLucasBalanced8, pattersonLucasBalanced9, pattersonLucasBalanced10, pattersonLucasBalanced12, pattersonLucasBalanced13, pattersonLucasBalanced15, pattersonLucasBalanced16, pattersonLucasBalanced17, pattersonLucasBalanced18, pattersonLucasBalanced19, pattersonLucasBalanced20, pattersonLucasBalanced21, pattersonLucasBalanced22, pattersonLucasBalanced23, pattersonLucasBalanced24, file="pattersonLucasBalanced.rda")

