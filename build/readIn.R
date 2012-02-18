mcon <- textConnection("
1 2 3 4 5 6 7 8 9
2 4 6 7 1 8 9 3 5
3 1 5 6 9 2 4 7 8
4 6 7 9 3 5 8 2 1
5 3 4 2 8 9 6 1 7
6 9 2 8 4 7 1 5 3
7 8 9 5 6 1 3 4 2
8 7 1 3 2 4 5 9 6
9 5 8 1 7 3 2 6 4  ")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Archdeacon, D.S., Dinitz J.H., Stinson, D.R. and Tillson, T.W. (1980)\nSome new row-complete latin squares, Journal of Combinatorial Theory, Series A, 29, 395-398."
attr(t, "signature") <- "p = 9, n = 9, t = 9"
attr(t, "title") <- "BALANCED LATIN SQUARE DESIGN"
andersonPreece <- t
save(andersonPreece, file="andersonPreece.rda")
