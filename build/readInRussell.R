con <- textConnection("
1 2 3 4 5
2 4 5 3 1
3 5 2 1 4
4 3 1 5 2
5 1 4 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Russell, K.R. (1991) The construction of good change-over designs when there are fewer units than treatments. Biometrika, 78, 305-313."
attr(t, "signature") <- "p = 5, n = 5, t = 5"
attr(t, "title") <- "RUSSELL NEARLY BALANCED LATIN SQUARE DESIGNS FOUR TREATMENTS"
russel4t <- t


con <- textConnection("
1 2 3 4 5 6 7
2 6 7 1 4 3 5
3 7 4 6 2 5 1
4 1 6 5 7 2 3
5 4 2 7 3 1 6
6 3 5 2 1 7 4
7 5 1 3 6 4 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Russell, K.R. (1991) The construction of good change-over designs when there are fewer units than treatments. Biometrika, 78, 305-313."
attr(t, "signature") <- "p = 7, n = 7, t = 7"
attr(t, "title") <- "RUSSELL NEARLY BALANCED LATIN SQUARE DESIGNS SEVEN TREATMENTS"
russel7t <- t




save(russel4t, russel7t, file="russell.rda")

