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





save(orthogonalLatinSquare3t, file="orthogonalLatinSquare.rda")

