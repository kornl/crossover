con <- textConnection("
1 2 3  1 2 3  1 2 3
2 3 1  2 3 1  3 1 2
3 1 2  3 1 2  2 3 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 3, n = 9, t = 3"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 1"
iqbalJones1 <- t


con <- textConnection("
1 2 3
2 3 1
3 1 2
2 3 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 3, t = 3"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 2"
iqbalJones2 <- t



con <- textConnection("
1 2 3
2 3 1
3 1 2
2 3 1
1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 5, n = 3, t = 3"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 3"
iqbalJones3 <- t




con <- textConnection("
1 2 3
2 3 1
3 1 2
1 2 3
3 1 2
2 3 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 6, n = 3, t = 3"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 4"
iqbalJones4 <- t




con <- textConnection("
1 2 3  1 2 3
2 3 1  3 1 2
3 1 2  2 3 1
1 2 3  1 2 3
2 3 1  3 1 2
3 1 2  2 3 1
1 2 3  1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 7, n = 6, t = 3"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 5"
iqbalJones5 <- t





con <- textConnection("
1 2 3 4  1 2 3 4
2 3 4 1  3 4 1 2
4 1 2 3  2 3 4 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 3, n = 8, t = 4"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 6"
iqbalJones6 <- t


con <- textConnection("
1 2 3 4  1 2 3 4  1 2 3 4
2 3 4 1  2 3 4 1  2 3 4 1
4 1 2 3  4 1 2 3  4 1 2 3
3 4 1 2  3 4 1 2  3 4 1 2
2 3 4 1  4 1 2 3  1 2 3 4
4 1 2 3  3 4 1 2  2 3 4 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 6, n = 12, t = 4"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 7"
iqbalJones7 <- t




con <- textConnection("
1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  4 5 1 2 3
4 5 1 2 3  3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 3, n = 10, t = 5"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 8"
iqbalJones8 <- t






con <- textConnection("
1 2 3 4 5
2 3 4 5 1
5 1 2 3 4
4 5 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 5, t = 5"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 9"
iqbalJones9 <- t





con <- textConnection("
1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  5 1 2 3 4
5 1 2 3 4  2 3 4 5 1
4 5 1 2 3  3 4 5 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 10, t = 5"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 10"
iqbalJones10 <- t



con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  2 3 4 5 1  4 5 1 2 3
4 5 1 2 3  5 1 2 3 4  2 3 4 5 1
3 4 5 1 2  4 5 1 2 3  3 4 5 1 2
5 1 2 3 4  3 4 5 1 2  5 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 5, n = 15, t = 5"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 11"
iqbalJones11 <- t



con <- textConnection("
1 2 3 4 5
2 3 4 5 1
3 4 5 1 2
5 1 2 3 4
4 5 1 2 3
2 3 4 5 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 6, n = 5, t = 5"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 12"
iqbalJones12 <- t




con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  3 4 5 6 1 2  4 5 6 1 2 3
5 6 1 2 3 4  2 3 4 5 6 1  2 3 4 5 6 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 3, n = 18, t = 6"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 13"
iqbalJones13 <- t




con <- textConnection("
1 2 3 4 5 6
2 3 4 5 6 1
6 1 2 3 4 5
5 6 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 6, t = 6"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 14"
iqbalJones14 <- t





con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  3 4 5 6 1 2  2 3 4 5 6 1
4 5 6 1 2 3  6 1 2 3 4 5  5 6 1 2 3 4
3 4 5 6 1 2  4 5 6 1 2 3  3 4 5 6 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 18, t = 6"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 15"
iqbalJones15 <- t


con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6
2 3 4 5 6 1  3 4 5 6 1 2
6 1 2 3 4 5  6 1 2 3 4 5
5 6 1 2 3 4  5 6 1 2 3 4
3 4 5 6 1 2  2 3 4 5 6 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 5, n = 12, t = 6"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 16"
iqbalJones16 <- t




con <- textConnection("
1 2 3 4 5 6   1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
3 4 5 6 1 2   2 3 4 5 6 1  5 6 1 2 3 4  6 1 2 3 4 5  6 1 2 3 4 5
2 3 4 5 6 1   6 1 2 3 4 5  6 1 2 3 4 5  2 3 4 5 6 1  2 3 4 5 6 1
5 6 1 2 3 4   3 4 5 6 1 2  3 4 5 6 1 2  5 6 1 2 3 4  5 6 1 2 3 4
6 1 2 3 4 5   5 6 1 2 3 4  2 3 4 5 6 1  3 4 5 6 1 2  3 4 5 6 1 2
4 5 6 1 2 3   4 5 6 1 2 3  4 5 6 1 2 3  4 5 6 1 2 3  4 5 6 1 2 3
5 6 1 2 3 4   6 1 2 3 4 5  1 2 3 4 5 6  2 3 4 5 6 1  3 4 5 6 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 7, n = 30, t = 6"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 17"
iqbalJones17 <- t



con <- textConnection("
1 2 3 4 5 6 7
4 5 6 7 1 2 3
6 7 1 2 3 4 5
7 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 7, t = 7"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 18"
iqbalJones18 <- t




con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  7 1 2 3 4 5 6
3 4 5 6 7 1 2  6 7 1 2 3 4 5  4 5 6 7 1 2 3
5 6 7 1 2 3 4  2 3 4 5 6 7 1  2 3 4 5 6 7 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 21, t = 7"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 19"
iqbalJones19 <- t





con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2
7 1 2 3 4 5 6  6 7 1 2 3 4 5
4 5 6 7 1 2 3  7 1 2 3 4 5 6
3 4 5 6 7 1 2  5 6 7 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 5, n = 14, t = 7"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 20"
iqbalJones20 <- t




con <- textConnection("
1 2 3 4 5 6 7 
2 3 4 5 6 7 1  
5 6 7 1 2 3 4
7 1 2 3 4 5 6
6 7 1 2 3 4 5
3 4 5 6 7 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 6, n = 7, t = 7"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 21"
iqbalJones21 <- t








con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  2 3 4 5 6 7 1  4 5 6 7 1 2 3
5 6 7 1 2 3 4  7 1 2 3 4 5 6  6 7 1 2 3 4 5
7 1 2 3 4 5 6  4 5 6 7 1 2 3  5 6 7 1 2 3 4
6 7 1 2 3 4 5  3 4 5 6 7 1 2  2 3 4 5 6 7 1
3 4 5 6 7 1 2  6 7 1 2 3 4 5  7 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 6, n =21, t = 7"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 22"
iqbalJones22 <- t






con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  6 7 1 2 3 4 5  4 5 6 7 1 2 3
4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5
7 1 2 3 4 5 6  2 3 4 5 6 7 1  5 6 7 1 2 3 4
6 7 1 2 3 4 5  4 5 6 7 1 2 3  3 4 5 6 7 1 2
3 4 5 6 7 1 2  7 1 2 3 4 5 6  7 1 2 3 4 5 6
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 7, n = 31, t = 7"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 23"
iqbalJones23 <- t







con <- textConnection("
1 2 3 4 5 6 7 8
5 6 7 8 1 2 3 4
7 8 1 2 3 4 5 6
8 1 2 3 4 5 6 7")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 8, t = 8"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 24"
iqbalJones24 <- t



con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
7 8 1 2 3 4 5 6  3 4 5 6 7 8 1 2  3 4 5 6 7 8 1 2
2 3 4 5 6 7 8 1  6 7 8 1 2 3 4 5  8 1 2 3 4 5 6 7
3 4 5 6 7 8 1 2  5 6 7 8 1 2 3 4  4 5 6 7 8 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 24, t = 8"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 25"
iqbalJones25 <- t



con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
2 3 4 5 6 7 8 1  4 5 6 7 8 1 2 3
6 7 8 1 2 3 4 5  8 1 2 3 4 5 6 7
4 5 6 7 8 1 2 3  5 6 7 8 1 2 3 4
3 4 5 6 7 8 1 2  7 8 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 5, n = 16, t = 8"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 26"
iqbalJones26 <- t



con <- textConnection("
1 2 3 4 5 6 7 8
2 3 4 5 6 7 8 1
4 5 6 7 8 1 2 3
3 4 5 6 7 8 1 2
8 1 2 3 4 5 6 7
6 7 8 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 6, n = 8, t = 8"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 27"
iqbalJones27 <- t





con <- textConnection("
1 2 3 4 5 6 7 8
4 5 6 7 8 1 2 3
5 6 7 8 1 2 3 4
3 4 5 6 7 8 1 2
2 3 4 5 6 7 8 1
6 7 8 1 2 3 4 5
8 1 2 3 4 5 6 7")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 7, n = 8, t = 8"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 28"
iqbalJones28 <- t






con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
6 7 8 1 2 3 4 5  2 3 4 5 6 7 8 1  4 5 6 7 8 1 2 3
5 6 7 8 1 2 3 4  4 5 6 7 8 1 2 3  5 6 7 8 1 2 3 4
7 8 1 2 3 4 5 6  3 4 5 6 7 8 1 2  3 4 5 6 7 8 1 2
8 1 2 3 4 5 6 7  7 8 1 2 3 4 5 6  8 1 2 3 4 5 6 7
4 5 6 7 8 1 2 3  5 6 7 8 1 2 3 4  2 3 4 5 6 7 8 1
2 3 4 5 6 7 8 1  8 1 2 3 4 5 6 7  6 7 8 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 7, n = 24, t = 8"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 29"
iqbalJones29 <- t




con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
2 3 4 5 6 7 8 9 1  6 7 8 9 1 2 3 4 5  8 9 1 2 3 4 5 6 7
4 5 6 7 8 9 1 2 3  5 6 7 8 9 1 2 3 4  2 3 4 5 6 7 8 9 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 3, n = 27, t = 9"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 30"
iqbalJones30 <- t




con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
2 3 4 5 6 7 8 9 1  3 4 5 6 7 8 9 1 2  4 5 6 7 8 9 1 2 3  6 7 8 9 1 2 3 4 5
6 7 8 9 1 2 3 4 5  9 1 2 3 4 5 6 7 8  3 4 5 6 7 8 9 1 2  4 5 6 7 8 9 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 3, n = 36, t = 9"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 31"
iqbalJones31 <- t





con <- textConnection("
1 2 3 4 5 6 7 8 9
4 5 6 7 8 9 1 2 3
6 7 8 9 1 2 3 4 5
3 4 5 6 7 8 9 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 9, t = 9"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 32"
iqbalJones32 <- t






con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
2 3 4 5 6 7 8 9 1  4 5 6 7 8 9 1 2 3  9 1 2 3 4 5 6 7 8
4 5 6 7 8 9 1 2 3  2 3 4 5 6 7 8 9 1  6 7 8 9 1 2 3 4 5
8 9 1 2 3 4 5 6 7  8 9 1 2 3 4 5 6 7  2 3 4 5 6 7 8 9 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 27, t = 9"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 33"
iqbalJones33 <- t





con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
2 3 4 5 6 7 8 9 1  9 1 2 3 4 5 6 7 8
8 9 1 2 3 4 5 6 7  5 6 7 8 9 1 2 3 4
3 4 5 6 7 8 9 1 2  8 9 1 2 3 4 5 6 7
5 6 7 8 9 1 2 3 4  6 7 8 9 1 2 3 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 5, n = 18, t = 9"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 34"
iqbalJones34 <- t





con <- textConnection("
1 2 3 4 5 6 7 8 9
2 3 4 5 6 7 8 9 1
4 5 6 7 8 9 1 2 3
3 4 5 6 7 8 9 1 2
9 1 2 3 4 5 6 7 8
7 8 9 1 2 3 4 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 6, n = 9, t = 9"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 35"
iqbalJones35 <- t






con <- textConnection("
1 2 3 4 5 6 7 8 9 
2 3 4 5 6 7 8 9 1 
6 7 8 9 1 2 3 4 5
3 4 5 6 7 8 9 1 2
8 9 1 2 3 4 5 6 7
7 8 9 1 2 3 4 5 6
5 6 7 8 9 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 7, n = 9, t = 9"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 36"
iqbalJones36 <- t





con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
3 4 5 6 7 8 9 1 2  2 3 4 5 6 7 8 9 1
4 5 6 7 8 9 1 2 3  9 1 2 3 4 5 6 7 8
7 8 9 1 2 3 4 5 6  5 6 7 8 9 1 2 3 4
2 3 4 5 6 7 8 9 1  7 8 9 1 2 3 4 5 6
9 1 2 3 4 5 6 7 8  4 5 6 7 8 9 1 2 3
8 9 1 2 3 4 5 6 7  3 4 5 6 7 8 9 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 7, n = 18, t = 9"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 37"
iqbalJones37 <- t



con <- textConnection("
1 2 3 4 5 6 7 8 9
7 8 9 1 2 3 4 5 6 
8 9 1 2 3 4 5 6 7
3 4 5 6 7 8 9 1 2
6 7 8 9 1 2 3 4 5
4 5 6 7 8 9 1 2 3
9 1 2 3 4 5 6 7 8
2 3 4 5 6 7 8 9 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 8, n = 9, t = 9"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 38"
iqbalJones38 <- t




con <- textConnection("
1  2  3  4  5  6  7  8 9 10   1  2  3  4  5   6  7  8  9 10   1  2  3  4   5   6  7  8  9  10
2  3  4  5  6  7  8  9 10 1   5  6  7  8  9  10  1  2  3  4   6  7  8  9  10   1  2  3  4   5
4  5  6  7  8  9 10  1  2 3   2  3  4  5  6   7  8  9 10  1   5  6  7  8   9  10  1  2  3   4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 3, n = 30, t = 10"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 39"
iqbalJones39 <- t



con <- textConnection("
1  2  3  4   5  6   7  8  9  10    1  2  3 4  5  6  7  8  9 10    1  2  3  4  5  6   7  8  9  10
6  7  8  9  10  1   2  3  4   5    8  9 10 1  2  3  4  5  6  7    4  5  6  7  8  9  10  1  2   3
4  5  6  7   8  9  10  1  2   3    2  3  4 5  6  7  8  9 10  1    3  4  5  6  7  8   9 10  1   2
5  6  7  8   9 10   1  2  3   4    4  5  6 7  8  9 10  1  2  3    9 10  1  2  3  4   5  6  7   8")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 4, n = 30, t = 10"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 40"
iqbalJones40 <- t




con <- textConnection("
 1  2  3  4 5  6   7  8  9  10    1  2  3  4  5  6  7  8  9  10
10  1  2  3 4  5   6  7  8   9    5  6  7  8  9 10  1  2  3   4
 7  8  9 10 1  2   3  4  5   6    8  9 10  1  2  3  4  5  6   7
 9 10  1  2 3  4   5  6  7   8    6  7  8  9 10  1  2  3  4   5
 4  5  6  7 8  9  10  1  2   3    7  8  9 10  1  2  3  4  5   6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 5, n = 20, t = 10"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 41"
iqbalJones41 <- t








con <- textConnection("
1   2  3  4   5  6   7   8   9 10
2   3  4  5   6  7   8   9  10  1
10  1  2  3   4  5   6   7   8  9
6   7  8  9  10  1   2   3   4  5
8   9 10  1   2  3   4   5   6  7
3   4  5  6   7  8   9  10   1  2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Iqbal, I. and Jones, B. (1994) Efficient repeated measurements designs with equal and unequal period sizes. Journal of Statistical Planning and Inference, 42, 79-88."
attr(t, "signature") <- "p = 6, n = 10, t = 10"
attr(t, "title") <- "IQBAL AND JONES CYCLIC DESIGN 42"
iqbalJones42 <- t




















save(iqbalJones1, iqbalJones2, iqbalJones3, iqbalJones4, iqbalJones5, iqbalJones6, iqbalJones7, iqbalJones8, iqbalJones9, iqbalJones10, iqbalJones11, iqbalJones12, iqbalJones13, iqbalJones14, iqbalJones15, iqbalJones16, iqbalJones17, iqbalJones18, iqbalJones19, iqbalJones20, iqbalJones21, iqbalJones22, iqbalJones23, iqbalJones24, iqbalJones25, iqbalJones26, iqbalJones27, iqbalJones28, iqbalJones29, iqbalJones30, iqbalJones31, iqbalJones32, iqbalJones33, iqbalJones34, iqbalJones35, iqbalJones36, iqbalJones37, iqbalJones38, iqbalJones39, iqbalJones40, iqbalJones41, iqbalJones42, file="iqbalJones.rda")

