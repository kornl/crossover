con <- textConnection("
1 2 3  1 2 3
2 3 1  3 1 2
2 3 1  3 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 6, t = 3"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 30 (based on PL1)"
pattersonLucasExtraPeriod30 <- t


con <- textConnection("
1 2 3  1 2 3
2 3 1  3 1 2
3 1 2  2 3 1
3 1 2  2 3 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 6, t = 3"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 31 (based on PL2)"
pattersonLucasExtraPeriod31 <- t



con <- textConnection("
1 2 3 4 1 2 3 4 1 2 3 4
2 1 4 3 3 4 1 2 4 3 2 1
2 1 4 3 3 4 1 2 4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 12, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 32 (based on PL3)"
pattersonLucasExtraPeriod32 <- t



con <- textConnection("
1 2 3 4 1 2 3 4 1 2 3 4
2 1 4 3 3 4 1 2 4 3 2 1
3 4 1 2 4 3 2 1 2 1 4 3
3 4 1 2 4 3 2 1 2 1 4 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 12, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 33 (based on PL4)"
pattersonLucasExtraPeriod33 <- t




con <- textConnection("
1 2 3 4
2 4 1 3
3 1 4 2
4 3 2 1
4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 4, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 34 (based on PL5)"
pattersonLucasExtraPeriod34 <- t




con <- textConnection("
1 2 3 4 1 2 3 4 1 2 3 4
2 1 4 3 3 4 1 2 4 3 2 1
3 4 1 2 4 3 2 1 2 1 4 3
4 3 2 1 2 1 4 3 3 4 1 2
4 3 2 1 2 1 4 3 3 4 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 12, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 35 (based on PL6)"
pattersonLucasExtraPeriod35 <- t






con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 36 (based on PL7)"
pattersonLucasExtraPeriod36 <- t





con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4
3 4 5 1 2  5 1 2 3 4  2 3 4 5 1  4 5 1 2 3
3 4 5 1 2  5 1 2 3 4  2 3 4 5 1  4 5 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 37 (based on PL8)"
pattersonLucasExtraPeriod37 <- t





con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4
3 4 5 1 2  5 1 2 3 4  2 3 4 5 1  4 5 1 2 3
4 5 1 2 3  2 3 4 5 1  5 1 2 3 4  3 4 5 1 2
4 5 1 2 3  2 3 4 5 1  5 1 2 3 4  3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 38 (based on PL9)"
pattersonLucasExtraPeriod38 <- t






con <- textConnection("
1 2 3 4 5 1 2 3 4 5
2 3 4 5 1 5 1 2 3 4
5 1 2 3 4 2 3 4 5 1
3 4 5 1 2 4 5 1 2 3
4 5 1 2 3 3 4 5 1 2
4 5 1 2 3 3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 10, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 39 (based on PL10)"
pattersonLucasExtraPeriod39 <- t





con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4
3 4 5 1 2  5 1 2 3 4  2 3 4 5 1  4 5 1 2 3
4 5 1 2 3  2 3 4 5 1  5 1 2 3 4  3 4 5 1 2
5 1 2 3 4  4 5 1 2 3  3 4 5 1 2  2 3 4 5 1
5 1 2 3 4  4 5 1 2 3  3 4 5 1 2  2 3 4 5 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 20, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 40 (based on PL11)"
pattersonLucasExtraPeriod40 <- t




con <- textConnection("
1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6
2 3 4 5 6 1 3 4 5 6 1 2 4 5 6 1 2 3 5 6 1 2 3 4 6 1 2 3 4 5
2 3 4 5 6 1 3 4 5 6 1 2 4 5 6 1 2 3 5 6 1 2 3 4 6 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 30, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 41 (based on PL12)"
pattersonLucasExtraPeriod41 <- t




con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5  6 1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  3 4 5 6 1 2  4 5 6 1 2  3 5 6 1 2 3 4  6 1 2 3 4 5
3 4 5 6 1 2  4 5 6 1 2 3  5 6 1 2 3  4 3 4 5 6 1 2  2 3 4 5 6 1
6 1 2 3 4 5  6 1 2 3 4 5  3 4 5 6 1  2 6 1 2 3 4 5  5 6 1 2 3 4
4 5 6 1 2 3  5 6 1 2 3 4  2 3 4 5 6  1 2 3 4 5 6 1  4 5 6 1 2 3
4 5 6 1 2 3  5 6 1 2 3 4  2 3 4 5 6  1 2 3 4 5 6 1  4 5 6 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 30, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 42 (based on PL13)"
pattersonLucasExtraPeriod42 <- t



con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 43 (based on PL16)"
pattersonLucasExtraPeriod43 <- t




con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  5 6 7 1 2 3 4
5 6 7 1 2 3 4  2 3 4 5 6 7 1  3 4 5 6 7 1 2
5 6 7 1 2 3 4  2 3 4 5 6 7 1  3 4 5 6 7 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 21, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 44 (based on PL17)"
pattersonLucasExtraPeriod44 <- t




con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6
3 4 5 6 7 1 2  5 6 7 1 2 3 4  7 1 2 3 4 5 6  2 3 4 5 6 7 1  4 5 6 7 1 2 3  6 7 1 2 3 4 5
3 4 5 6 7 1 2  5 6 7 1 2 3 4  7 1 2 3 4 5 6  2 3 4 5 6 7 1  4 5 6 7 1 2 3  6 7 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 45 (based on PL18)"
pattersonLucasExtraPeriod45 <- t



con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  7 1 2 3 4 5 6
4 5 6 7 1 2 3  5 6 7 1 2 3 4
7 1 2 3 4 5 6  2 3 4 5 6 7 1
7 1 2 3 4 5 6  2 3 4 5 6 7 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 14, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 46 (based on PL19)"
pattersonLucasExtraPeriod46 <- t






con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6
3 4 5 6 7 1 2  5 6 7 1 2 3 4  7 1 2 3 4 5 6  2 3 4 5 6 7 1  4 5 6 7 1 2 3  6 7 1 2 3 4 5
4 5 6 7 1 2 3  7 1 2 3 4 5 6  3 4 5 6 7 1 2  6 7 1 2 3 4 5  2 3 4 5 6 7 1  5 6 7 1 2 3 4
4 5 6 7 1 2 3  7 1 2 3 4 5 6  3 4 5 6 7 1 2  6 7 1 2 3 4 5  2 3 4 5 6 7 1  5 6 7 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 47 (based on PL20)"
pattersonLucasExtraPeriod47 <- t





con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  5 6 7 1 2 3 4
5 6 7 1 2 3 4  2 3 4 5 6 7 1  3 4 5 6 7 1 2
7 1 2 3 4 5 6  6 7 1 2 3 4 5  4 5 6 7 1 2 3
6 7 1 2 3 4 5  4 5 6 7 1 2 3  7 1 2 3 4 5 6
6 7 1 2 3 4 5  4 5 6 7 1 2 3  7 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 21, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 48 (based on PL21)"
pattersonLucasExtraPeriod48 <- t






con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6
3 4 5 6 7 1 2  5 6 7 1 2 3 4  7 1 2 3 4 5 6  2 3 4 5 6 7 1  4 5 6 7 1 2 3  6 7 1 2 3 4 5
4 5 6 7 1 2 3  7 1 2 3 4 5 6  3 4 5 6 7 1 2  6 7 1 2 3 4 5  2 3 4 5 6 7 1  5 6 7 1 2 3 4
5 6 7 1 2 3 4  2 3 4 5 6 7 1  6 7 1 2 3 4 5  3 4 5 6 7 1 2  7 1 2 3 4 5 6  4 5 6 7 1 2 3
5 6 7 1 2 3 4  2 3 4 5 6 7 1  6 7 1 2 3 4 5  3 4 5 6 7 1 2  7 1 2 3 4 5 6  4 5 6 7 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 42, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 49 (based on PL22)"
pattersonLucasExtraPeriod49 <- t




con <- textConnection("
1 2 3 4 5 6 7  2 3 4 5 6 7 1  4 5 6 7 1 2 3 7  1 2 3 4 5 6
2 3 4 5 6 7 1  7 1 2 3 4 5 6  1 2 3 4 5 6 7 4  5 6 7 1 2 3
4 5 6 7 1 2 3  1 2 3 4 5 6 7  7 1 2 3 4 5 6 2  3 4 5 6 7 1
7 1 2 3 4 5 6  4 5 6 7 1 2 3  2 3 4 5 6 7 1 1  2 3 4 5 6 7
7 1 2 3 4 5 6  4 5 6 7 1 2 3  2 3 4 5 6 7 1 1  2 3 4 5 6 7")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 28, t = 7"
attr(t, "title") <- "PATTERSON AND LUCAS EXTRA-PERIOD DESIGN 86 (based on PL65)"
pattersonLucasExtraPeriod86 <- t







save(pattersonLucasExtraPeriod30, pattersonLucasExtraPeriod31, pattersonLucasExtraPeriod32, pattersonLucasExtraPeriod33, pattersonLucasExtraPeriod34, pattersonLucasExtraPeriod35, pattersonLucasExtraPeriod36, pattersonLucasExtraPeriod37, pattersonLucasExtraPeriod38, pattersonLucasExtraPeriod39, pattersonLucasExtraPeriod40, pattersonLucasExtraPeriod41, pattersonLucasExtraPeriod42, pattersonLucasExtraPeriod43, pattersonLucasExtraPeriod44, pattersonLucasExtraPeriod45, pattersonLucasExtraPeriod46, pattersonLucasExtraPeriod47, pattersonLucasExtraPeriod48, pattersonLucasExtraPeriod49, pattersonLucasExtraPeriod86, file="pattersonLucasExtraPeriod.rda")

