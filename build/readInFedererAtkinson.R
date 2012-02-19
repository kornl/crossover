con <- textConnection("
1 2 3  1 2 3
2 3 1  3 1 2
3 1 2  2 3 1
1 2 3  1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Source: Federer, W.T. and Atkinson, G.F. (1964) Tied-double-change-over designs. Biometrics, 20, 168--181."
attr(t, "signature") <- "p = 4, n = 6, t = 3 (s = 2, q = 1)"
attr(t, "title") <- "FEDERER AND ATKINSON'S BALANCED DESIGN THREE TREATMENTS A"
federerAtkinson3ta <- t

con <- textConnection("
1 2 3  1 2 3
2 3 1  3 1 2
3 1 2  2 3 1
1 2 3  1 2 3
3 1 2  2 3 1
2 3 1  3 1 2
1 2 3  1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Source: Federer, W.T. and Atkinson, G.F. (1964) Tied-double-change-over designs. Biometrics, 20, 168--181."
attr(t, "signature") <- "p = 7, n = 6, t = 3 (s = 2, q = 2)"
attr(t, "title") <- "FEDERER AND ATKINSON'S BALANCED DESIGN THREE TREATMENTS B"
federerAtkinson3tb <- t

###

con <- textConnection("
1 2 3 4  1 2 3 4  1 2 3 4
2 1 4 3  4 3 2 1  3 4 1 2
3 4 1 2  2 1 4 3  4 3 2 1
4 3 2 1  3 4 1 2  2 1 4 3
1 2 3 4  1 2 3 4  1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Source: Federer, W.T. and Atkinson, G.F. (1964) Tied-double-change-over designs. Biometrics, 20, 168--181."
attr(t, "signature") <- "p = 5, n = 12, t = 4 (s = 3, q = 1)"
attr(t, "title") <- "FEDERER AND ATKINSON'S BALANCED DESIGN FOUR TREATMENTS A"
federerAtkinson4ta <- t

con <- textConnection("
1 2 3 4  1 2 3 4  1 2 3 4
2 1 4 3  4 3 2 1  3 4 1 2
3 4 1 2  2 1 4 3  4 3 2 1
4 3 2 1  3 4 1 2  2 1 4 3
1 2 3 4  1 2 3 4  1 2 3 4
4 3 2 1  3 4 1 2  2 1 4 3
3 4 1 2  2 1 4 3  4 3 2 1
2 1 4 3  4 3 2 1  3 4 1 2
1 2 3 4  1 2 3 4  1 2 3 4 ")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Source: Federer, W.T. and Atkinson, G.F. (1964) Tied-double-change-over designs. Biometrics, 20, 168--181."
attr(t, "signature") <- "p = 9, n = 12, t = 4 (s = 3, q = 2)"
attr(t, "title") <- "FEDERER AND ATKINSON'S BALANCED DESIGN FOUR TREATMENTS B"
federerAtkinson4tb <- t

###

con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4
3 4 5 1 2  5 1 2 3 4  2 3 4 5 1  4 5 1 2 3
4 5 1 2 3  2 3 4 5 1  5 1 2 3 4  3 4 5 1 2
5 1 2 3 4  4 5 1 2 3  3 4 5 1 2  2 3 4 5 1
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Source: Federer, W.T. and Atkinson, G.F. (1964) Tied-double-change-over designs. Biometrics, 20, 168--181."
attr(t, "signature") <- "p = 6, n = 20, t = 5 (s = 4, q = 1, sq = 4)"
attr(t, "title") <- "FEDERER AND ATKINSON'S BALANCED DESIGN FIVE TREATMENTS"
federerAtkinson5ta <- t



save(federerAtkinson3ta, federerAtkinson3tb, federerAtkinson4ta, federerAtkinson4tb, federerAtkinson5ta, file="federerAtkinson.rda")

