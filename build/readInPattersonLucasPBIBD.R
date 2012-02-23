con <- textConnection("
1 2  2 3  3 4  4 1
2 1  3 2  4 3  1 4
2 1  3 2  4 3  1 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 8, t = 4"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 153"
pattersonLucasPBIBD153 <- t


con <- textConnection("
1 2 3 4 5  2 3 4 5 1  4 5 1 2 3  1 2 3 4 5  2 3 4 5 1  4 5 1 2 3
2 3 4 5 1  4 5 1 2 3  1 2 3 4 5  4 5 1 2 3  1 2 3 4 5  2 3 4 5 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 30, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 125"
pattersonLucasPBIBD125 <- t




con <- textConnection("
1 2 3 4 5  2 3 4 5 1  4 5 1 2 3  1 2 3 4 5  2 3 4 5 1  4 5 1 2 3
2 3 4 5 1  4 5 1 2 3  1 2 3 4 5  4 5 1 2 3  1 2 3 4 5  2 3 4 5 1
4 5 1 2 3  1 2 3 4 5  2 3 4 5 1  2 3 4 5 1  4 5 1 2 3  1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 30, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 126"
pattersonLucasPBIBD126 <- t



con <- textConnection("
1 2 3 4 5  2 3 4 5 1  4 5 1 2 3  1 2 3 4 5  2 3 4 5 1  4 5 1 2 3
2 3 4 5 1  4 5 1 2 3  1 2 3 4 5  4 5 1 2 3  1 2 3 4 5  2 3 4 5 1
2 3 4 5 1  4 5 1 2 3  1 2 3 4 5  4 5 1 2 3  1 2 3 4 5  2 3 4 5 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 30, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 131 (extra-period type based on PL125)"
pattersonLucasPBIBD131 <- t





con <- textConnection("
1 2 3 4 5  2 3 4 5 1  4 5 1 2 3  1 2 3 4 5  2 3 4 5 1  4 5 1 2 3
2 3 4 5 1  4 5 1 2 3  1 2 3 4 5  4 5 1 2 3  1 2 3 4 5  2 3 4 5 1
4 5 1 2 3  1 2 3 4 5  2 3 4 5 1  2 3 4 5 1  4 5 1 2 3  1 2 3 4 5
4 5 1 2 3  1 2 3 4 5  2 3 4 5 1  2 3 4 5 1  4 5 1 2 3  1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 30, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 132 (extra-period type based on PL126)"
pattersonLucasPBIBD132 <- t




con <- textConnection("
1 2 3 4 5  3 4 5 1 2
3 4 5 1 2  1 2 3 4 5
3 4 5 1 2  1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 10, t = 5"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 154 (extra-period type)"
pattersonLucasPBIBD154 <- t




con <- textConnection("
1 2 3  1 2 3  1 5 6  1 5 6  2 4 6  2 4 6  3 4 5  3 4 5
2 3 1  3 1 2  5 6 1  6 1 5  4 6 2  6 2 4  4 5 3  5 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 24, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 99"
pattersonLucasPBIBD99 <- t






con <- textConnection("
1 2 3  1 2 3  1 5 6  1 5 6  2 4 6  2 4 6  3 4 5  3 4 5
2 3 1  3 1 2  5 6 1  6 1 5  4 6 2  6 2 4  4 5 3  5 3 4
3 1 2  2 3 1  6 1 5  5 6 1  6 2 4  4 6 2  5 3 4  4 5 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 24, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 100"
pattersonLucasPBIBD100 <- t





con <- textConnection("
1 4 2 5  2 5 3 6  3 6 1 4
4 5 1 2  5 6 2 3  6 4 3 1
2 1 5 4  3 2 6 5  1 3 4 6
5 2 4 1  6 3 5 2  4 1 6 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 12, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 101"
pattersonLucasPBIBD101 <- t




con <- textConnection("
1 2 3  1 2 3  1 5 6  1 5 6  2 4 6  2 4 6  3 4 5  3 4 5
2 3 1  3 1 2  5 6 1  6 1 5  4 6 2  6 2 4  4 5 3  5 3 4
2 3 1  3 1 2  5 6 1  6 1 5  4 6 2  6 2 4  4 5 3  5 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 24, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 133 (extra-period type based on PL99)"
pattersonLucasPBIBD133 <- t






con <- textConnection("
1 2 3  1 2 3  1 5 6  1 5 6  2 4 6  2 4 6  3 4 5  3 4 5
2 3 1  3 1 2  5 6 1  6 1 5  4 6 2  6 2 4  4 5 3  5 3 4
3 1 2  2 3 1  6 1 5  5 6 1  6 2 4  4 6 2  5 3 4  4 5 3
3 1 2  2 3 1  6 1 5  5 6 1  6 2 4  4 6 2  5 3 4  4 5 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 24, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 134 (extra-period type based on PL100)"
pattersonLucasPBIBD134 <- t




con <- textConnection("
1 4 2 5  2 5 3 6  3 6 1 4
4 5 1 2  5 6 2 3  6 4 3 1
2 1 5 4  3 2 6 5  1 3 4 6
5 2 4 1  6 3 5 2  4 1 6 3
5 2 4 1  6 3 5 2  4 1 6 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 12, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 135 (extra-period type based on PL101)"
pattersonLucasPBIBD135 <- t






con <- textConnection("
1 4  1 5  1 6  2 4  2 5  2 6  3 4  3 5  3 6
4 1  5 1  6 1  4 2  5 2  6 2  4 3  5 3  6 3
4 1  5 1  6 1  4 2  5 2  6 2  4 3  5 3  6 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 18, t = 6"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 155 (extra-period type)"
pattersonLucasPBIBD155 <- t



con <- textConnection("
1 2 4  1 2 4  2 3 5  2 3 5  3 4 6  3 4 6  4 5 7  4 5 7  5 6 8  5 6 8  6 7 1  6 7 1  7 8 2  7 8 2  8 1 3  8 1 3
2 4 1  4 1 2  3 5 2  5 2 3  4 6 3  6 3 4  5 7 4  7 4 5  6 8 5  8 5 6  7 1 6  1 6 7  8 2 7  2 7 8  1 3 8  3 8 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 48, t = 8"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 102"
pattersonLucasPBIBD102 <- t




con <- textConnection("
1 2 4  1 2 4  2 3 5  2 3 5  3 4 6  3 4 6  4 5 7  4 5 7  5 6 8  5 6 8  6 7 1  6 7 1  7 8 2  7 8 2  8 1 3  8 1 3
2 4 1  4 1 2  3 5 2  5 2 3  4 6 3  6 3 4  5 7 4  7 4 5  6 8 5  8 5 6  7 1 6  1 6 7  8 2 7  2 7 8  1 3 8  3 8 1
4 1 2  2 4 1  5 2 3  3 5 2  6 3 4  4 6 3  7 4 5  5 7 4  8 5 6  6 8 5  1 6 7  7 1 6  2 7 8  8 2 7  3 8 1  1 3 8")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 48, t = 8"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 103"
pattersonLucasPBIBD103 <- t



con <- textConnection("
1 5 2 6  3 7 4 8  1 5 3 7  2 6 4 8  1 5 4 8  2 6 3 7
5 6 1 2  7 8 3 4  5 7 1 3  6 8 2 4  5 8 1 4  6 7 2 3
2 1 6 5  4 3 8 7  3 1 7 5  4 2 8 6  4 1 8 5  3 2 7 6
6 2 5 1  8 4 7 3  7 3 5 1  8 4 6 2  8 4 5 1  7 3 6 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 24, t = 8"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 104"
pattersonLucasPBIBD104 <- t




con <- textConnection("
1 5 2 7 3 6  2 6 1 5 4 8  3 7 4 8 1 5  4 8 3 6 2 7
5 2 7 3 6 1  6 1 5 4 8 2  7 4 8 1 5 3  8 3 6 2 7 4 
6 1 5 2 7 3  8 2 6 1 5 4  5 3 7 4 8 1  7 4 8 3 6 2
2 7 3 6 1 5  1 5 4 8 2 6  4 8 1 5 3 7  3 6 2 7 4 8
3 6 1 5 2 7  4 8 2 6 1 5  1 5 3 7 4 8  2 7 4 8 3 6
7 3 6 1 5 2  5 4 8 2 6 1  8 1 5 3 7 4  6 2 7 4 8 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 24, t = 8"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 105"
pattersonLucasPBIBD105 <- t




con <- textConnection("
1 2 4  1 2 4  2 3 5  2 3 5  3 4 6  3 4 6  4 5 7  4 5 7  5 6 8  5 6 8  6 7 1  6 7 1  7 8 2  7 8 2  8 1 3  8 1 3
2 4 1  4 1 2  3 5 2  5 2 3  4 6 3  6 3 4  5 7 4  7 4 5  6 8 5  8 5 6  7 1 6  1 6 7  8 2 7  2 7 8  1 3 8  3 8 1
2 4 1  4 1 2  3 5 2  5 2 3  4 6 3  6 3 4  5 7 4  7 4 5  6 8 5  8 5 6  7 1 6  1 6 7  8 2 7  2 7 8  1 3 8  3 8 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 48. t = 8"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 136 (extra-period type based on PL102)"
pattersonLucasPBIBD136 <- t





con <- textConnection("
1 2 4  1 2 4  2 3 5  2 3 5  3 4 6  3 4 6  4 5 1  4 5 7  5 6 8  5 6 8  6 7 1  6 7 1  7 8 2  7 8 2  8 1 3  8 1 3
2 4 1  4 1 2  3 5 2  5 2 3  4 6 3  6 3 4  5 7 4  7 4 5  6 8 5  8 5 6  7 1 6  1 6 7  8 2 7  2 7 8  1 3 8  3 8 1
4 1 2  2 4 1  5 2 3  3 5 2  6 3 4  4 6 3  7 4 5  5 7 4  8 5 6  6 8 5  1 6 7  7 1 6  2 7 8  8 2 7  3 8 1  1 3 8
4 1 2  2 4 1  5 2 3  3 5 2  6 3 4  4 6 3  7 4 5  5 7 4  8 5 6  6 8 5  1 6 7  7 1 6  2 7 8  8 2 7  3 8 1  1 3 8")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 48, t = 8"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 137 (extra-period type based on PL103)"
pattersonLucasPBIBD137 <- t




con <- textConnection("
1 5 2 6  3 7 4 8  1 5 3 7  2 6 4 8  1 5 4 8  2 6 3 7
5 6 1 2  7 8 4 3  5 7 1 3  6 8 2 4  5 8 1 4  6 7 2 3
2 1 6 5  4 3 8 7  3 1 7 5  4 2 8 6  4 1 8 5  3 2 7 6
6 2 5 1  8 4 7 3  7 3 5 1  8 4 6 2  8 4 5 1  7 3 6 2
6 2 5 1  8 4 7 3  7 3 5 1  8 4 6 2  8 4 5 1  7 3 6 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 24, t = 8"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 138 (extra-period type based on PL104)"
pattersonLucasPBIBD138 <- t




con <- textConnection("
1 2 3 4 5 6 7 8  2 3 4 5 6 7 8 1  1 2 3 4 5 6 7 8  4 5 6 7 8 1 2 3
2 3 4 5 6 7 8 1  1 2 3 4 5 6 7 8  4 5 6 7 8 1 2 3  1 2 3 4 5 6 7 8
2 3 4 5 6 7 8 1  1 2 3 4 5 6 7 8  4 5 6 7 8 1 2 3  1 2 3 4 5 6 7 8")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 32, t = 8"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 156 (extra-period type)"
pattersonLucasPBIBD156 <- t





con <- textConnection("
1 6 9 2  6 8 2 4  8 1 4 9  9 2 5 7  2 4 7 3  4 9 3 5  5 7 1 6  7 3 6 8  3 5 8 1
6 2 1 9  8 4 6 2  1 9 8 4  2 7 9 5  4 3 2 7  9 5 4 3  7 6 5 1  3 8 7 6  5 1 3 8
9 1 2 6  2 6 4 8  4 8 9 1  5 9 7 2  7 2 3 4  3 4 5 9  1 5 6 7  6 7 8 3  8 3 1 5
2 9 6 1  4 2 8 6  9 4 1 8  7 5 2 9  3 7 4 2  5 3 9 4  6 1 7 5  8 6 3 7  1 8 5 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 36, t = 9"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 106"
pattersonLucasPBIBD106 <- t





con <- textConnection("
1 4 7 2 5 8  2 5 8 3 6 9  3 6 9 1 4 7
4 7 2 5 8 1  5 8 3 6 9 2  6 9 1 4 7 3
8 1 4 7 2 5  9 2 5 8 3 6  7 3 6 9 1 4
7 2 5 8 1 4  8 3 6 9 2 5  9 1 4 7 3 6
5 8 1 4 7 2  6 9 2 5 8 3  4 7 3 6 9 1
2 5 8 1 4 7  3 6 9 2 5 8  1 4 7 3 6 9")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 6, n = 18, t = 9"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 107"
pattersonLucasPBIBD107 <- t




con <- textConnection("
1 2 3  1 2 3  4 5 6  4 5 6  7 8 9  7 8 9  1 4 7  1 4 7  2 5 8  2 5 8  3 6 9  3 6 9
2 3 1  3 1 2  5 6 4  6 4 5  8 9 7  9 7 8  4 7 1  7 1 4  5 8 2  8 2 5  6 9 3  9 3 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 2, n = 36, t = 9"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 127"
pattersonLucasPBIBD127 <- t


con <- textConnection("
1 2 3  1 2 3  4 5 6  4 5 6  7 8 9  7 8 9  1 4 7  1 4 7  2 5 8  2 5 8  3 6 9  3 6 9
2 3 1  3 1 2  5 6 4  6 4 5  8 9 7  9 7 8  4 7 1  7 1 4  5 8 2  8 2 5  6 9 3  9 3 6
3 1 2  2 3 1  6 4 5  5 6 4  9 7 8  8 9 7  7 1 4  4 7 1  8 2 5  5 8 2  9 3 6  6 9 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 36, t = 9"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 128"
pattersonLucasPBIBD128 <- t



con <- textConnection("
1 2 3  1 2 3  4 5 6  4 5 6  7 8 9  7 8 9  1 4 7  1 4 7  2 5 8  2 5 8  3 6 9  3 6 9
2 3 1  3 1 2  5 6 4  6 4 5  8 9 7  9 7 8  4 7 1  7 1 4  5 8 2  8 2 5  6 9 3  9 3 6
2 3 1  3 1 2  5 6 4  6 4 5  8 9 7  9 7 8  4 7 1  7 1 4  5 8 2  8 2 5  6 9 3  9 3 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 36, t = 9"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 139 (extra-period type based on PL127)"
pattersonLucasPBIBD139 <- t



con <- textConnection("
1 2 3  1 2 3  4 5 6  4 5 6  7 8 9  7 8 9  1 4 7  1 4 7  2 5 8  2 5 8  3 6 9  3 6 9
2 3 1  3 1 2  5 6 4  6 4 5  8 9 7  9 7 8  4 7 1  7 1 4  5 8 2  8 2 5  6 9 3  9 3 6
3 1 2  2 3 1  6 4 5  5 6 4  9 7 8  8 9 7  7 1 4  4 7 1  8 2 5  5 8 2  9 3 6  6 9 3
3 1 2  2 3 1  6 4 5  5 6 4  9 7 8  8 9 7  7 1 4  4 7 1  8 2 5  5 8 2  9 3 6  6 9 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 36, t = 9"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 140 (extra-period type based on PL128)"
pattersonLucasPBIBD140 <- t



con <- textConnection("
1 6 9 2  6 8 2 4  8 1 4 9  9 2 5 7  2 4 7 3  4 9 3 5  5 7 1 6  7 3 6 8  3 5 8 1
6 2 1 9  8 4 6 2  1 9 8 4  2 7 9 5  4 3 2 7  9 5 4 3  7 6 5 1  3 8 7 6  5 1 3 8 
9 1 2 6  2 6 4 8  4 8 9 1  5 9 7 2  7 2 3 4  3 4 5 9  1 5 6 7  6 7 8 3  8 3 1 5
2 9 6 1  4 2 8 6  9 4 1 8  7 5 2 9  3 7 4 2  5 3 9 4  6 1 7 5  8 6 3 7  1 8 5 3
2 9 6 1  4 2 8 6  9 4 1 8  7 5 2 9  3 7 4 2  5 3 9 4  6 1 7 5  8 6 3 7  1 8 5 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Patterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 36, t = 9"
attr(t, "title") <- "PATTERSON AND LUCAS PARTIALLY BALANCED INCOMPLETE BLOCK DESIGN 141 (extra-period type based on PL106)"
pattersonLucasPBIBD141 <- t








save(pattersonLucasPBIBD153, pattersonLucasPBIBD125, pattersonLucasPBIBD126, pattersonLucasPBIBD131, pattersonLucasPBIBD132, pattersonLucasPBIBD154, pattersonLucasPBIBD99, pattersonLucasPBIBD100, pattersonLucasPBIBD101, pattersonLucasPBIBD133, pattersonLucasPBIBD134, pattersonLucasPBIBD135, pattersonLucasPBIBD155, pattersonLucasPBIBD102, pattersonLucasPBIBD103, pattersonLucasPBIBD104, pattersonLucasPBIBD105, pattersonLucasPBIBD136, pattersonLucasPBIBD137, pattersonLucasPBIBD138, pattersonLucasPBIBD156, pattersonLucasPBIBD106, pattersonLucasPBIBD107, pattersonLucasPBIBD127, pattersonLucasPBIBD128, pattersonLucasPBIBD139, pattersonLucasPBIBD140, pattersonLucasPBIBD141, file="pattersonLucasPBIBD.rda")

