con <- textConnection("
1 2 3 4  1 2 3 4
3 4 1 2  3 4 1 2
2 1 4 3  4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3, n = 8, t = 4 (brick 1)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 2 DESIGN 1"
lewisFletcherMatthews1 <- t



save(lewisFletcherMatthews1, file="lewisFletcherMatthews.rda")

