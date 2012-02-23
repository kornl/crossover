con <- textConnection("
1 2 3  1 2 3
2 3 1  3 1 2
1 2 3  1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Lucas, H.L. (1956) Switch-back trials for more than two treatments. Journal of Diary Science, 39, 146--154."
attr(t, "signature") <- "p = 3, n = 6, t = 3"
attr(t, "title") <- "SWITCH-BACK DESIGN THREE TREATMENTS"
switchback3t <- t

con <- textConnection("
1 2 3 4  1 2 3 4  1 2 3 4
2 3 4 1  3 4 1 2  4 1 2 3
1 2 3 4  1 2 3 4  1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Lucas, H.L. (1956) Switch-back trials for more than two treatments. Journal of Diary Science, 39, 146--154."
attr(t, "signature") <- "p = 3, n = 12, t = 4"
attr(t, "title") <- "SWITCH-BACK DESIGN FOUR TREATMENTS"
switchback4t <- t

con <- textConnection("
1 2 3 4 5  1 2 3 4 5  2 3 4 5 1  3 4 5 1 2
2 3 4 5 1  3 4 5 1 2  1 2 3 4 5  1 2 3 4 5
1 2 3 4 5  1 2 3 4 5  2 3 4 5 1  3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Lucas, H.L. (1956) Switch-back trials for more than two treatments. Journal of Diary Science, 39, 146--154."
attr(t, "signature") <- "p = 3, n = 20, t = 5"
attr(t, "title") <- "SWITCH-BACK DESIGN FIVE TREATMENTS"
switchback5t <- t

con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  3 4 5 6 1 2  4 5 6 1 2 3  5 6 1 2 3 4  6 1 2 3 4 5
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Lucas, H.L. (1956) Switch-back trials for more than two treatments. Journal of Diary Science, 39, 146--154."
attr(t, "signature") <- "p = 3, n = 30, t = 6"
attr(t, "title") <- "SWITCH-BACK DESIGN SIX TREATMENTS"
switchback6t <- t


con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7   2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3   1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7   2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Lucas, H.L. (1956) Switch-back trials for more than two treatments. Journal of Diary Science, 39, 146--154."
attr(t, "signature") <- "p = 3, n = 42, t = 7"
attr(t, "title") <- "SWITCH-BACK DESIGN SEVEN TREATMENTS"
switchback7t <- t


save(switchback3t, switchback4t, switchback5t, switchback6t, switchback7t, file="switchback.rda")

