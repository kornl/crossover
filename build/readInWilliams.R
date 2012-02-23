con <- textConnection("
1 2 3  3 1 2
2 3 1  2 3 1
3 1 2  1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Williams, E.J. (1949) Experimental designs balanced for the estimation of residual effects of treatments. Australian Journal of Science Res(A), 2, 14900168.\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 6, t = 3"
attr(t, "title") <- "WILLIAMS DESIGN THREE TREATMENTS"
williams3t <- t

con <- textConnection("
1 2 3 4
2 3 4 1
4 1 2 3
3 4 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Williams, E.J. (1949) Experimental designs balanced for the estimation of residual effects of treatments. Australian Journal of Science Res(A), 2, 14900168.\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 8, t = 4"
attr(t, "title") <- "WILLIAMS DESIGN FOUR TREATMENTS"
williams4t <- t

con <- textConnection("
1 2 3 4 5  4 5 1 2 3
2 3 4 5 1  3 4 5 1 2
5 1 2 3 4  5 1 2 3 4
3 4 5 1 2  2 3 4 5 1
4 5 1 2 3  1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Williams, E.J. (1949) Experimental designs balanced for the estimation of residual effects of treatments. Australian Journal of Science Res(A), 2, 14900168.\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 10, t = 5"
attr(t, "title") <- "WILLIAMS DESIGN FIVE TREATMENTS"
williams5t <- t


con <- textConnection("
1 2 3 4 5 6
2 3 4 5 6 1
6 1 2 3 4 5
3 4 5 6 1 2
5 6 1 2 3 4
4 5 6 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Williams, E.J. (1949) Experimental designs balanced for the estimation of residual effects of treatments. Australian Journal of Science Res(A), 2, 14900168.\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 6, t = 6"
attr(t, "title") <- "WILLIAMS DESIGN SIX TREATMENTS"
williams6t <- t



con <- textConnection("
1 2 3 4 5 6 7  4 5 6 7 1 2 3
7 1 2 3 4 5 6  5 6 7 1 2 3 4
2 3 4 5 6 7 1  3 4 5 6 7 1 2 
6 7 1 2 3 4 5  6 7 1 2 3 4 5
3 4 5 6 7 1 2  2 3 4 5 6 7 1
5 6 7 1 2 3 4  7 1 2 3 4 5 6
4 5 6 7 1 2 3  1 2 3 4 5 6 7")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Williams, E.J. (1949) Experimental designs balanced for the estimation of residual effects of treatments. Australian Journal of Science Res(A), 2, 14900168.\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 7, n = 14, t = 7"
attr(t, "title") <- "WILLIAMS DESIGN SEVEN TREATMENTS"
williams7t <- t



con <- textConnection("
1 2 3 4 5 6 7 8
2 3 4 5 6 7 8 1
8 1 2 3 4 5 6 7
3 4 5 6 7 8 1 2
7 8 1 2 3 4 5 6
4 5 6 7 8 1 2 3
6 7 8 1 2 3 4 5
5 6 7 8 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Williams, E.J. (1949) Experimental designs balanced for the estimation of residual effects of treatments. Australian Journal of Science Res(A), 2, 14900168.\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 8, n = 8, t = 8"
attr(t, "title") <- "WILLIAMS DESIGN EIGHT TREATMENTS"
williams8t <- t



con <- textConnection("
1 2 3 4 5 6 7 8 9  6 7 8 9 1 2 3 4 5
2 3 4 5 6 7 8 9 1  5 6 7 8 9 1 2 3 4
9 1 2 3 4 5 6 7 8  7 8 9 1 2 3 4 5 6
3 4 5 6 7 8 9 1 2  4 5 6 7 8 9 1 2 3
8 9 1 2 3 4 5 6 7  8 9 1 2 3 4 5 6 7
4 5 6 7 8 9 1 2 3  3 4 5 6 7 8 9 1 2
7 8 9 1 2 3 4 5 6  9 1 2 3 4 5 6 7 8
5 6 7 8 9 1 2 3 4  2 3 4 5 6 7 8 9 1
6 7 8 9 1 2 3 4 5  1 2 3 4 5 6 7 8 9")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Williams, E.J. (1949) Experimental designs balanced for the estimation of residual effects of treatments. Australian Journal of Science Res(A), 2, 14900168.\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 9, n = 18, t = 9"
attr(t, "title") <- "WILLIAMS DESIGN NINE TREATMENTS"
williams9t <- t




save(williams3t, williams4t, williams5t, williams6t, williams7t, williams8t, williams9t, file="williams.rda")

