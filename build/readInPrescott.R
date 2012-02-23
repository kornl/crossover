con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  5 1 2 3 4
4 5 1 2 3  5 1 2 3 4  4 5 1 2 3
5 1 2 3 4  4 5 1 2 3  2 3 4 5 1
3 4 5 1 2  2 3 4 5 1  3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Prescott, P. (1994) Construction of sequentially counterbalanced designs formed from two or more Latin Squares. Proceedings of the 11th Symposium on Computational Statistics held in Vienna, Austria. Editors Dutter, R. and Grossmann, W.,  Physica-Verlag: Heidelberg, 435-440.\n\nPrescott, P. (1999) Construction of sequentially counterbalanced designs formed from two latin squares. Utilitas Mathematica, 55, 135--152."
attr(t, "signature") <- "p = 5, n = 15, t = 5"
attr(t, "title") <- "PRESCOTT TRIPLE LATIN SQUARE DESIGN FIVE TREATMENTS"
prescott1 <- t

con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  7 1 2 3 4 5 6
6 7 1 2 3 4 5  7 1 2 3 4 5 6  6 7 1 2 3 4 5
4 5 6 7 1 2 3  5 6 7 1 2 3 4  3 4 5 6 7 1 2
5 6 7 1 2 3 4  4 5 6 7 1 2 3  4 5 6 7 1 2 3
7 1 2 3 4 5 6  6 7 1 2 3 4 5  2 3 4 5 6 7 1
3 4 5 6 7 1 2  2 3 4 5 6 7 1  5 6 7 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Prescott, P. (1994) Construction of sequentially counterbalanced designs formed from two or more Latin Squares. Proceedings of the 11th Symposium on Computational Statistics held in Vienna, Austria. Editors Dutter, R. and Grossmann, W.,  Physica-Verlag: Heidelberg, 435-440.\n\nPrescott, P. (1999) Construction of sequentially counterbalanced designs formed from two latin squares. Utilitas Mathematica, 55, 135--152."
attr(t, "signature") <- "p = 7, n = 21, t = 7"
attr(t, "title") <- "PRESCOTT TRIPLE LATIN SQUARE DESIGN FIVE TREATMENTS"
prescott2 <- t

save(prescott1, prescott2, file="prescott.rda")

