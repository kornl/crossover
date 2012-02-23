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
1 2 3 4
2 4 1 3
3 1 4 2
4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 4, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 5 FOR p < t"
pattersonLucasPltT5 <- t



con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 7 FOR p < t"
pattersonLucasPltT7 <- t





con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4
3 4 5 1 2  5 1 2 3 4  2 3 4 5 1  4 5 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 8 FOR p < t"
pattersonLucasPltT8 <- t



con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4
3 4 5 1 2  5 1 2 3 4  2 3 4 5 1  4 5 1 2 3
4 5 1 2 3  2 3 4 5 1  5 1 2 3 4  3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 9 FOR p < t"
pattersonLucasPltT9 <- t



con <- textConnection("
1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  5 1 2 3 4
5 1 2 3 4  2 3 4 5 1
3 4 5 1 2  4 5 1 2 3
4 5 1 2 3  3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 10, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 10 FOR p < t"
pattersonLucasPltT10 <- t



con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  3 4 5 6 1 2  4 5 6 1 2 3  5 6 1 2 3 4  6 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 30, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 12 FOR p < t"
pattersonLucasPltT12 <- t




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
pattersonLucasPltT13 <- t



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
pattersonLucasPltT15 <- t



con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 16 FOR p < t"
pattersonLucasPltT16 <- t






con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  5 6 7 1 2 3 4
5 6 7 1 2 3 4  2 3 4 5 6 7 1  3 4 5 6 7 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 21, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 17 FOR p < t"
pattersonLucasPltT17 <- t


con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6
3 4 5 6 7 1 2  5 6 7 1 2 3 4  7 1 2 3 4 5 6  2 3 4 5 6 7 1  4 5 6 7 1 2 3  6 7 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 18 FOR p < t"
pattersonLucasPltT18 <- t



con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  7 1 2 3 4 5 6
4 5 6 7 1 2 3  5 6 7 1 2 3 4
7 1 2 3 4 5 6  2 3 4 5 6 7 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 14, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 19 FOR p < t"
pattersonLucasPltT19 <- t


con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6
3 4 5 6 7 1 2  5 6 7 1 2 3 4  7 1 2 3 4 5 6  2 3 4 5 6 7 1  4 5 6 7 1 2 3  6 7 1 2 3 4 5
4 5 6 7 1 2 3  7 1 2 3 4 5 6  3 4 5 6 7 1 2  6 7 1 2 3 4 5  2 3 4 5 6 7 1  5 6 7 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 20 FOR p < t"
pattersonLucasPltT20 <- t



con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  5 6 7 1 2 3 4
5 6 7 1 2 3 4  2 3 4 5 6 7 1  3 4 5 6 7 1 2
7 1 2 3 4 5 6  6 7 1 2 3 4 5  4 5 6 7 1 2 3
6 7 1 2 3 4 5  4 5 6 7 1 2 3  7 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 21, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 21 FOR p < t"
pattersonLucasPltT21 <- t



con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6
3 4 5 6 7 1 2  5 6 7 1 2 3 4  7 1 2 3 4 5 6  2 3 4 5 6 7 1  4 5 6 7 1 2 3  6 7 1 2 3 4 5
4 5 6 7 1 2 3  7 1 2 3 4 5 6  3 4 5 6 7 1 2  6 7 1 2 3 4 5  2 3 4 5 6 7 1  5 6 7 1 2 3 4
5 6 7 1 2 3 4  2 3 4 5 6 7 1  6 7 1 2 3 4 5  3 4 5 6 7 1 2  7 1 2 3 4 5 6  4 5 6 7 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 22 FOR p < t"
pattersonLucasPltT22 <- t




con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6
3 4 5 6 7 1 2  5 6 7 1 2 3 4  7 1 2 3 4 5 6  2 3 4 5 6 7 1  4 5 6 7 1 2 3  6 7 1 2 3 4 5
4 5 6 7 1 2 3  7 1 2 3 4 5 6  3 4 5 6 7 1 2  6 7 1 2 3 4 5  2 3 4 5 6 7 1  5 6 7 1 2 3 4
5 6 7 1 2 3 4  2 3 4 5 6 7 1  6 7 1 2 3 4 5  3 4 5 6 7 1 2  7 1 2 3 4 5 6  4 5 6 7 1 2 3
6 7 1 2 3 4 5  4 5 6 7 1 2 3  2 3 4 5 6 7 1  7 1 2 3 4 5 6  5 6 7 1 2 3 4  3 4 5 6 7 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 23 FOR p < t"
pattersonLucasPltT23 <- t




con <- textConnection("
1 2 3 4 5 6 7  2 3 4 5 6 7 1  4 5 6 7 1 2 3  7 1 2 3 4 5 6 
2 3 4 5 6 7 1  7 1 2 3 4 5 6  1 2 3 4 5 6 7  4 5 6 7 1 2 3
4 5 6 7 1 2 3  1 2 3 4 5 6 7  7 1 2 3 4 5 6  2 3 4 5 6 7 1
7 1 2 3 4 5 6  4 5 6 7 1 2 3  2 3 4 5 6 7 1  1 2 3 4 5 6 7")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 28, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS BALANCED DESIGN 65 FOR p < t"
pattersonLucasPltT65 <- t







save(pattersonLucasPltT1, pattersonLucasPltT3, pattersonLucasPltT4, pattersonLucasPltT5, pattersonLucasPltT7, pattersonLucasPltT8, pattersonLucasPltT9, pattersonLucasPltT10, pattersonLucasPltT12, pattersonLucasPltT13, pattersonLucasPltT15, pattersonLucasPltT16, pattersonLucasPltT17, pattersonLucasPltT18, pattersonLucasPltT19, pattersonLucasPltT20, pattersonLucasPltT21, pattersonLucasPltT22, pattersonLucasPltT23,  file="pattersonLucasPltT.rda")

