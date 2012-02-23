con <- textConnection("
1 1 2 2 3 3  1 1 3 3 2 2  1 2 3 2 1 3
1 2 2 3 3 1  1 3 3 2 2 1  2 3 2 1 3 1
2 2 3 3 1 1  3 3 2 2 1 1  3 2 1 3 1 2
2 3 3 1 1 2  3 2 2 1 1 3  2 1 3 1 2 3
3 1 1 2 2 3  2 1 1 3 3 2  3 1 2 3 2 1
3 3 1 1 2 2  2 2 1 1 3 3  1 3 1 2 3 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Quenouille, M.H. (1953) The Design and Analysis of Experiments. Griffin, London."
attr(t, "signature") <- "p = 6, n = 18, t = 3"
attr(t, "title") <- "QUENOUILLE DESIGN 1 THREE TREATMENTS"
quenouille3t1 <- t

con <- textConnection("
1 1 2 3 3 2  2 2 3 1 1 3  3 3 1 2 2 1
1 2 3 3 2 1  2 3 1 1 3 2  3 1 2 2 1 3
2 3 3 2 1 1  3 1 1 3 2 2  1 2 2 1 3 3
3 3 2 1 1 2  1 1 3 2 2 3  2 2 1 3 3 1
3 2 1 1 2 3  1 3 2 2 3 1  2 1 3 3 1 2
2 1 1 2 3 3  3 2 2 3 1 1  1 3 3 1 2 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Quenouille, M.H. (1953) The Design and Analysis of Experiments. Griffin, London."
attr(t, "signature") <- "p = 6, n = 18, t = 3"
attr(t, "title") <- "QUENOUILLE DESIGN 2 THREE TREATMENTS"
quenouille3t2 <- t

con <- textConnection("
1 1 2 2 3 3 4 4  1 3 2 1 4 2 4 3
1 2 2 3 3 4 4 1  3 2 1 4 2 4 3 1
2 2 3 3 4 4 1 1  2 1 4 2 4 3 1 3
2 3 3 4 4 1 1 2  1 4 2 4 3 1 3 2
3 3 4 4 1 1 2 2  4 2 4 3 1 3 2 1
3 4 4 1 1 2 2 3  2 4 3 1 3 2 1 4
4 4 1 1 2 2 3 3  4 3 1 3 2 1 4 2
4 1 1 2 2 3 3 4  3 1 3 2 1 4 2 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Quenouille, M.H. (1953) The Design and Analysis of Experiments. Griffin, London."
attr(t, "signature") <- "p = 8, n = 16, t = 4"
attr(t, "title") <- "QUENOUILLE DESIGN 1 FOUR TREATMENTS"
quenouille4t1 <- t

con <- textConnection("
1 1 2 2 3 4 4 3  1 3 3 2 4 1 4 2
1 2 2 3 4 4 3 1  3 3 2 4 1 4 2 1
2 2 3 4 4 3 1 1  3 2 4 1 4 2 1 3
2 3 4 4 3 1 1 2  2 4 1 4 2 1 3 3
3 4 4 3 1 1 2 2  4 1 4 2 1 3 3 2
4 4 3 1 1 2 2 3  1 4 2 1 3 3 2 4
4 3 1 1 2 2 3 4  4 2 1 3 3 2 4 1
3 1 1 2 2 3 4 4  2 1 3 3 2 4 1 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Quenouille, M.H. (1953) The Design and Analysis of Experiments. Griffin, London."
attr(t, "signature") <- "p = 8, n = 16, t = 4"
attr(t, "title") <- "QUENOUILLE DESIGN 2 FOUR TREATMENTS"
quenouille4t2 <- t

con <- textConnection("
1 1 2 3 4 4 3 2  3 3 1 4 2 2 4 1
1 2 3 4 4 3 2 1  3 1 4 2 2 4 1 3
2 3 4 4 3 2 1 1 1 4 2 2 4 1 3 3
3 4 4 3 2 1 1 2  4 2 2 4 1 3 3 1
4 4 3 2 1 1 2 3  2 2 4 1 3 3 1 4
4 3 2 1 1 2 3 4  2 4 1 3 3 1 4 2
3 2 1 1 2 3 4 4  4 1 3 3 1 4 2 2
2 1 1 2 3 4 4 3  1 3 3 1 4 2 2 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Quenouille, M.H. (1953) The Design and Analysis of Experiments. Griffin, London."
attr(t, "signature") <- "p = 8, n = 16, t = 4"
attr(t, "title") <- "QUENOUILLE DESIGN 3 FOUR TREATMENTS"
quenouille4t3 <- t


save(quenouille3t1, quenouille3t2, quenouille4t1, quenouille4t2, quenouille4t3, file="quenouille.rda")

