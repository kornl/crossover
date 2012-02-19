con <- textConnection("
1 2 3 4  1 2 3 4
3 4 1 2  3 4 1 2
2 1 4 3  4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3, n = 8, t = 4 (brick 1)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 2 DESIGN 1"
lewisFletcherMatthews1 <- t



con <- textConnection("
1 2 3 4  1 2 3 4
4 3 2 1  4 3 2 1
2 1 4 3  3 4 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3, n = 8, t = 4 (brick 2)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 2 DESIGN 2"
lewisFletcherMatthews2 <- t


con <- textConnection("
1 2 3 4  1 2 3 4
2 1 4 3  3 4 1 2
3 4 1 2  2 1 4 3
4 3 2 1  4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 8, t = 4 (brick 3)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 2 DESIGN 3"
lewisFletcherMatthews3 <- t



con <- textConnection("
1 2 3 4  1 2 3 4
2 1 4 3  3 4 1 2
3 4 1 2  4 3 2 1
4 3 2 1  2 1 4 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 8, t = 4 (brick 4)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 2 DESIGN 4"
lewisFletcherMatthews4 <- t




con <- textConnection("
1 2 3 4  1 2 3 4
2 1 4 3  4 3 2 1
3 4 1 2  2 1 4 3
4 3 2 1  3 4 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 8, t = 4 (brick 5)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 2 DESIGN 5"
lewisFletcherMatthews5 <- t




con <- textConnection("
1 2 3 4  1 2 3 4 
2 1 4 3  4 3 2 1
4 3 2 1  3 4 1 2
3 4 1 2  2 1 4 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 8, t = 4 (brick 6)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 2 DESIGN 6"
lewisFletcherMatthews6 <- t




con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
2 3 1 5 6 4  3 1 2 6 4 5  2 3 1 5 6 4  3 1 2 6 4 5
4 5 6 1 2 3  6 4 5 3 1 2  5 6 4 2 3 1  4 5 6 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3, n = 24, t = 6 (bricks 7 & 8)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 3 DESIGN 7"
lewisFletcherMatthews7 <- t





con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
2 3 1 5 6 4  5 6 4 2 3 1  3 1 2 6 4 5  6 4 5 3 1 2
5 6 4 2 3 1  4 5 6 1 2 3  6 4 5 3 1 2  4 5 6 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3, n = 24, t = 6 (bricks 9 & 10)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 3 DESIGN 8"
lewisFletcherMatthews8 <- t




con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6
4 5 6 1 2 3  4 5 6 1 2 3
2 3 1 5 6 4  5 6 4 2 3 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3 n = 12, t = 6 (brick 11)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 3 DESIGN 9"
lewisFletcherMatthews9 <- t




con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6
4 5 6 1 2 3  4 5 6 1 2 3
5 6 4 2 3 1  6 4 5 3 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3, n = 12, t = 6 (brick 12)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 3 DESIGN 10"
lewisFletcherMatthews10 <- t





con <- textConnection("
1 2 3 4 5 6 1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6   
4 5 6 1 2 3 5 6 4 2 3 1  4 5 6 1 2 3  6 4 5 3 1 2 
5 6 4 2 3 1 2 3 1 5 6 4  6 4 5 3 1 2  3 1 2 6 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3, n = 24, t = 6 (bricks 13 & 14)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 3 DESIGN 11"
lewisFletcherMatthews11 <- t




con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6  1 2 3 4 5 6
5 6 4 2 3 1  6 4 5 3 1 2  5 6 4 2 3 1  6 4 5 3 1 2
2 3 1 5 6 4  4 5 6 1 2 3  4 5 6 1 2 3  3 1 2 6 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3, n = 24, t = 6 (bricks 15 & 16)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 3 DESIGN 12"
lewisFletcherMatthews12 <- t





con <- textConnection("
1 2 3 4 5 6
2 3 1 5 6 4
5 6 4 2 3 1
3 1 2 6 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 6, t = 6 (brick 17)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 3 DESIGN 13"
lewisFletcherMatthews13 <- t




con <- textConnection("
1 2 3 4 5 6
5 6 4 2 3 1
6 4 5 3 1 2
2 3 1 5 6 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 6, t = 6 (brick 18)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 3 DESIGN 14"
lewisFletcherMatthews14 <- t




con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
3 4 1 2 7 8 5 6  3 4 1 2 7 8 5 6
2 3 4 1 6 7 8 5  4 1 2 3 8 5 6 7
6 7 8 5 2 3 4 1  8 5 6 7 4 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 16, t = 8 (bricks 27 & 28)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 4 DESIGN 15"
lewisFletcherMatthews15 <- t







con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
3 4 1 2 7 8 5 6  3 4 1 2 7 8 5 6
2 3 4 1 6 7 8 5  4 1 2 3 8 5 6 7
7 8 5 6 3 4 1 2  7 8 5 6 3 4 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 16, t = 8 (bricks 29 & 30)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 4 DESIGN 16"
lewisFletcherMatthews16 <- t






con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
3 4 1 2 7 8 5 6  3 4 1 2 7 8 5 6
6 7 8 5 2 3 4 1  8 5 6 7 4 1 2 3
2 3 4 1 6 7 8 5  4 1 2 3 8 5 6 7")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 16, t = 8 (bricks 31 & 32)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 4 DESIGN 17"
lewisFletcherMatthews17 <- t








con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
3 4 1 2 7 8 5 6  3 4 1 2 7 8 5 6
6 7 8 5 2 3 4 1  8 5 6 7 4 1 2 3
7 8 5 6 3 4 1 2  7 8 5 6 3 4 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 16, t = 8 (bricks 33 & 34)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 2 x 4 DESIGN 18"
lewisFletcherMatthews18 <- t







con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
4 5 6 7 8 9 1 2 3  7 8 9 1 2 3 4 5 6
8 9 7 2 3 1 5 6 4  5 6 4 8 9 7 2 3 1
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
4 5 6 7 8 9 1 2 3  7 8 9 1 2 3 4 5 6
9 7 8 3 1 2 6 4 5  6 4 5 9 7 8 3 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 3, n = 36, t = 9 (bricks 39 & 40)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 3 x 3 DESIGN 19"
lewisFletcherMatthews19 <- t




con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
5 6 4 8 9 7 2 3 1  6 4 5 9 7 8 3 1 2
7 8 9 1 2 3 4 5 6  7 8 9 1 2 3 4 5 6
6 4 5 9 7 8 3 1 2  5 6 4 8 9 7 2 3 1
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
8 9 7 2 3 1 5 6 4  9 7 8 3 1 2 6 4 5
4 5 6 7 8 9 1 2 3  4 5 6 7 8 9 1 2 3
9 7 8 3 1 2 6 4 5  8 9 7 2 3 1 5 6 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Factorial cross-over designs in clinical trials, Lewis, S.M., Fletcher, D.J. and Matthews, J.N.S. In Optimal Design and Analysis of Experiments, Editors, Dodge, Y., Fedorov, V.V. and Wynn, H.P. (1988), 133--140, Elsevier Science Publishers B.V. (North-Holland)."
attr(t, "signature") <- "p = 4, n = 36, t = 9 (bricks 49, 50, 51, 52)"
attr(t, "title") <- "LEWIS, FLETCHER AND MATTHEWS 3 x 3 DESIGN 20"
lewisFletcherMatthews20 <- t





save(lewisFletcherMatthews1, lewisFletcherMatthews2, lewisFletcherMatthews3, lewisFletcherMatthews4, lewisFletcherMatthews5, lewisFletcherMatthews6, lewisFletcherMatthews7, lewisFletcherMatthews8, lewisFletcherMatthews9, lewisFletcherMatthews10, lewisFletcherMatthews11, lewisFletcherMatthews12, lewisFletcherMatthews13, lewisFletcherMatthews14, lewisFletcherMatthews15, lewisFletcherMatthews16, lewisFletcherMatthews17, lewisFletcherMatthews18, lewisFletcherMatthews19, lewisFletcherMatthews20, file="lewisFletcherMatthews.rda")

