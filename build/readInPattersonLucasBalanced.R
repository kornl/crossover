con <- textConnection("
1 2 3 1 2 3
2 3 1 3 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 6, t = 3"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 1 FOR p < t"
pattersonLucasBalanced1 <- t




con <- textConnection("
1 2 3 4 1 2 3 4 1 2 3 4
2 1 4 3 3 4 1 2 4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 12, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 3 FOR p < t"
pattersonLucasBalanced3 <- t



con <- textConnection("
1 2 3 4 1 2 3 4 1 2 3 4
2 1 4 3 3 4 1 2 4 3 2 1
3 4 1 2 4 3 2 1 2 1 4 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 12, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 4 FOR p < t"
pattersonLucasBalanced4 <- t




con <- textConnection("
1 2 3 4
2 4 1 3
3 1 4 3
4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 4, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 5 FOR p < t"
pattersonLucasBalanced5 <- t




con <- textConnection("
1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
2 3 4 5 1 3 4 5 1 2 4 5 1 2 3 5 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 7 FOR p < t"
pattersonLucasBalanced7 <- t



con <- textConnection("
1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
2 3 4 5 1 3 4 5 1 2 4 5 1 2 3 5 1 2 3 4
3 4 5 1 2 5 1 2 3 4 2 3 4 5 1 4 5 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 8 FOR p < t"
pattersonLucasBalanced8 <- t





con <- textConnection("
1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
2 3 4 5 1 3 4 5 1 2 4 5 1 2 3 5 1 2 3 4
3 4 5 1 2 5 1 2 3 4 2 3 4 5 1 4 5 1 2 3
4 5 1 2 3 2 3 4 5 1 5 1 2 3 4 3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 9 FOR p < t"
pattersonLucasBalanced9 <- t




con <- textConnection("
1 2 3 4 5 1 2 3 4 5
2 3 4 5 1 5 1 2 3 4
5 1 2 3 4 2 3 4 5 1
3 4 5 1 2 4 5 1 2 3
4 5 1 2 3 3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 10, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 10 FOR p < t"
pattersonLucasBalanced10 <- t





con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  3 4 5 6 1 2  4 5 6 1 2 3  5 6 1 2 3 4  6 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 30, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 12 FOR p < t"
pattersonLucasBalanced12 <- t






con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  3 4 5 6 1 2  4 5 6 1 2 3  5 6 1 2 3 4  6 1 2 3 4 5
3 4 5 6 1 2  4 5 6 1 2 3  5 6 1 2 3 4  3 4 5 6 1 2  2 3 4 5 6 1
6 1 2 3 4 5  6 1 2 3 4 5  3 4 5 6 1 2  6 1 2 3 4 5  5 6 1 2 3 4
4 5 6 1 2 3  5 6 1 2 3 4  2 3 4 5 6 1  2 3 4 5 6 1  4 5 6 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 30, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 13 FOR p < t"
pattersonLucasBalanced13 <- t







con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  3 4 5 6 1 2  4 5 6 1 2 3  5 6 1 2 3 4  6 1 2 3 4 5
3 4 5 6 1 2  4 5 6 1 2 3  5 6 1 2 3 4  3 4 5 6 1 2  2 3 4 5 6 1
6 1 2 3 4 5  6 1 2 3 4 5  3 4 5 6 1 2  6 1 2 3 4 5  5 6 1 2 3 4
4 5 6 1 2 3  5 6 1 2 3 4  2 3 4 5 6 1  2 3 4 5 6 1  4 5 6 1 2 3
5 6 1 2 3 4  2 3 4 5 6 1  6 1 2 3 4 5  4 5 6 1 2 3  3 4 5 6 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 30, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 15 FOR p < t"
pattersonLucasBalanced15 <- t



con <- textConnection("
1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7
2 3 4 5 6 7 1 3 4 5 6 7 1 2 4 5 6 7 1 2 3
1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7
5 6 7 1 2 3 4 6 7 1 2 3 4 5 7 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 16 FOR p < t"
pattersonLucasBalanced16 <- t



con <- textConnection("
1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7
2 3 4 5 6 7 1 3 4 5 6 7 1 2 5 6 7 1 2 3 4
5 6 7 1 2 3 4 2 3 4 5 6 7 1 3 4 5 6 7 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 21, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 17 FOR p < t"
pattersonLucasBalanced17 <- t



con <- textConnection("
1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7
2 3 4 5 6 7 1 3 4 5 6 7 1 2 4 5 6 7 1 2 3 5 6 7 1 2 3 4 6 7 1 2 3 4 5 7 1 2 3 4 5 6
3 4 5 6 7 1 2 5 6 7 1 2 3 4 7 1 2 3 4 5 6 2 3 4 5 6 7 1 4 5 6 7 1 2 3 6 7 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 18 FOR p < t"
pattersonLucasBalanced18 <- t




con <- textConnection("
1 2 3 4 5 6 7 1 2 3 4 5 6 7
2 3 4 5 6 7 1 7 1 2 3 4 5 6
4 5 6 7 1 2 3 5 6 7 1 2 3 4
7 1 2 3 4 5 6 2 3 4 5 6 7 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 14, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 19 FOR p < t"
pattersonLucasBalanced19 <- t



con <- textConnection("
1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7
2 3 4 5 6 7 1 3 4 5 6 7 1 2 4 5 6 7 1 2 3 5 6 7 1 2 3 4 6 7 1 2 3 4 5 7 1 2 3 4 5 6
3 4 5 6 7 1 2 5 6 7 1 2 3 4 7 1 2 3 4 5 6 2 3 4 5 6 7 1 4 5 6 7 1 2 3 6 7 1 2 3 4 5
4 5 6 7 1 2 3 7 1 2 3 4 5 6 3 4 5 6 7 1 2 6 7 1 2 3 4 5 2 3 4 5 6 7 1 5 6 7 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 20 FOR p < t"
pattersonLucasBalanced20 <- t




con <- textConnection("
1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7
2 3 4 5 6 7 1 3 4 5 6 7 1 2 5 6 7 1 2 3 4
5 6 7 1 2 3 4 2 3 4 5 6 7 1 3 4 5 6 7 1 2
7 1 2 3 4 5 6 6 7 1 2 3 4 5 4 5 6 7 1 2 3
6 7 1 2 3 4 5 4 5 6 7 1 2 3 7 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 21, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 21 FOR p < t"
pattersonLucasBalanced21 <- t


con <- textConnection("
1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7
2 3 4 5 6 7 1 3 4 5 6 7 1 2 4 5 6 7 1 2 3 5 6 7 1 2 3 4 6 7 1 2 3 4 5 7 1 2 3 4 5 6
3 4 5 6 7 1 2 5 6 7 1 2 3 4 7 1 2 3 4 5 6 2 3 4 5 6 7 1 4 5 6 7 1 2 3 6 7 1 2 3 4 5
4 5 6 7 1 2 3 7 1 2 3 4 5 6 3 4 5 6 7 1 2 6 7 1 2 3 4 5 2 3 4 5 6 7 1 5 6 7 1 2 3 4
5 6 7 1 2 3 4 2 3 4 5 6 7 1 6 7 1 2 3 4 5 3 4 5 6 7 1 2 7 1 2 3 4 5 6 4 5 6 7 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 22 FOR p < t"
pattersonLucasBalanced22 <- t




con <- textConnection("
1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7  1 2 3 4 5 6 7 1 2 3 4 5 6 7 1 2 3 4 5 6 7
2 3 4 5 6 7 1 3 4 5 6 7 1 2 4 5 6 7 1 2 3  5 6 7 1 2 3 4 6 7 1 2 3 4 5 7 1 2 3 4 5 6
3 4 5 6 7 1 2 5 6 7 1 2 3 4 7 1 2 3 4 5 6  2 3 4 5 6 7 1 4 5 6 7 1 2 3 6 7 1 2 3 4 5
4 5 6 7 1 2 3 7 1 2 3 4 5 6 3 4 5 6 7 1 2  6 7 1 2 3 4 5 2 3 4 5 6 7 1 5 6 7 1 2 3 4
5 6 7 1 2 3 4 2 3 4 5 6 7 1 6 7 1 2 3 4 5  3 4 5 6 7 1 2 7 1 2 3 4 5 6 4 5 6 7 1 2 3
6 7 1 2 3 4 5 4 5 6 7 1 2 3 2 3 4 5 6 7 1  7 1 2 3 4 5 6 5 6 7 1 2 3 4 3 4 5 6 7 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 23 FOR p < t"
pattersonLucasBalanced23 <- t



con <- textConnection("
1 2 3 4 5 6 7 2 3 4 5 6 7 1 4 5 6 7 1 2 3 7 1 2 3 4 5 6
2 3 4 5 6 7 1 7 1 2 3 4 5 6 1 2 3 4 5 6 7 4 5 6 7 1 2 3
4 5 6 7 1 2 3 1 2 3 4 5 6 7 7 1 2 3 4 5 6 2 3 4 5 6 7 1
7 1 2 3 4 5 6 4 5 6 7 1 2 3 2 3 4 5 6 7 1 1 2 3 4 5 6 7")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 28, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 24 FOR p < t"
pattersonLucasBalanced24 <- t





save(pattersonLucasBalanced1, pattersonLucasBalanced3, pattersonLucasBalanced4, pattersonLucasBalanced5, pattersonLucasBalanced7, pattersonLucasBalanced8, pattersonLucasBalanced9, pattersonLucasBalanced10, pattersonLucasBalanced12, pattersonLucasBalanced13, pattersonLucasBalanced15, pattersonLucasBalanced16, pattersonLucasBalanced17, pattersonLucasBalanced18, pattersonLucasBalanced19, pattersonLucasBalanced20, pattersonLucasBalanced21, pattersonLucasBalanced22, pattersonLucasBalanced23, pattersonLucasBalanced24, file="pattersonLucasBalanced.rda")

