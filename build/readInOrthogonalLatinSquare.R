con <- textConnection("
1 2 3  1 2 3
2 3 1  3 1 2
3 1 2  2 3 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Cochran, W.G., Autrey, K.M. and Cannon, C.Y. (1941) A double change-over design for dairy cattle feeding experiments. Journal of Dairy Science, 24, 937--951\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 3, n = 6"
attr(t, "title") <- "ORTHOGONAL LATIN SQUARE DESIGN THREE TREATMENTS"
orthogonalLatinSquare3t <- t


con <- textConnection("
1 2 3 4  1 2 3 4  1 2 3 4
2 1 4 3  3 4 1 2  4 3 2 1
3 4 1 2  4 3 2 1  2 1 4 3
4 3 2 1  2 1 4 3  3 4 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Cochran, W.G., Autrey, K.M. and Cannon, C.Y. (1941) A double change-over design for dairy cattle feeding experiments. Journal of Dairy Science, 24, 937--951\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 4, n = 12"
attr(t, "title") <- "ORTHOGONAL LATIN SQUARE DESIGN FOUR TREATMENTS"
orthogonalLatinSquare4t <- t


con <- textConnection("
1 2 3 4 5  1 2 3 4 5  1 2 3 4 5  1 2 3 4 5
2 3 4 5 1  3 4 5 1 2  4 5 1 2 3  5 1 2 3 4
3 4 5 1 2  5 1 2 3 4  2 3 4 5 1  4 5 1 2 3
4 5 1 2 3  2 3 4 5 1  5 1 2 3 4  3 4 5 1 2
5 1 2 3 4  4 5 1 2 3  3 4 5 1 2  2 3 4 5 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Cochran, W.G., Autrey, K.M. and Cannon, C.Y. (1941) A double change-over design for dairy cattle feeding experiments. Journal of Dairy Science, 24, 937--951\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 5, n = 20 "
attr(t, "title") <- "ORTHOGONAL LATIN SQUARE DESIGN FIVE TREATMENTS"
orthogonalLatinSquare5t <- t


con <- textConnection("
1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6 7
2 3 4 5 6 7 1  3 4 5 6 7 1 2  4 5 6 7 1 2 3  5 6 7 1 2 3 4  6 7 1 2 3 4 5  7 1 2 3 4 5 6
3 4 5 6 7 1 2  5 6 7 1 2 3 4  7 1 2 3 4 5 6  2 3 4 5 6 7 1  4 5 6 7 1 2 3  6 7 1 2 3 4 5
4 5 6 7 1 2 3  7 1 2 3 4 5 6  3 4 5 6 7 1 2  6 7 1 2 3 4 5  2 3 4 5 6 7 1  5 6 7 1 2 3 4
5 6 7 1 2 3 4  2 3 4 5 6 7 1  6 7 1 2 3 4 5  3 4 5 6 7 1 2  7 1 2 3 4 5 6  4 5 6 7 1 2 3
6 7 1 2 3 4 5  4 5 6 7 1 2 3  2 3 4 5 6 7 1  7 1 2 3 4 5 6  5 6 7 1 2 3 4  3 4 5 6 7 1 2
7 1 2 3 4 5 6  6 7 1 2 3 4 5  5 6 7 1 2 3 4  4 5 6 7 1 2 3  3 4 5 6 7 1 2  2 3 4 5 6 7 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Cochran, W.G., Autrey, K.M. and Cannon, C.Y. (1941) A double change-over design for dairy cattle feeding experiments. Journal of Dairy Science, 24, 937--951\n\nPatterson, H.D. and Lucas, H.L. (1962) Change-over designs. North Carolina Agricultural Experiment Station. Tech. Bull. No. 147."
attr(t, "signature") <- "p = 7, n = 42"
attr(t, "title") <- "ORTHOGONAL LATIN SQUARE DESIGN SEVEN TREATMENTS"
orthogonalLatinSquare7t <- t





save(orthogonalLatinSquare3t, orthogonalLatinSquare4t, orthogonalLatinSquare5t, orthogonalLatinSquare7t, file="orthogonalLatinSquare.rda")

