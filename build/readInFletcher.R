con <- textConnection("
1 2 3 4 
2 1 4 3
4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 3, n = 4, t = 4"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 2 DESIGN 1"
fletcher1 <- t


con <- textConnection("
1 2 3 4  1 2 3 4
2 1 4 3  4 3 2 1
4 3 2 1  2 1 4 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 3, n = 8, t = 4"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 2 DESIGN 2"
fletcher2 <- t

con <- textConnection("
1 2 3 4
2 1 4 3
4 3 2 1
3 4 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 4, n = 4, t = 4"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 2 DESIGN 3"
fletcher3 <- t

con <- textConnection("
1 2 3 4  1 2 3 4
2 1 4 3  3 4 1 2
4 3 2 1  4 3 2 1
3 4 1 2  2 1 4 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 4, n = 8, t = 4"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 2 DESIGN 4"
fletcher4 <- t


con <- textConnection("
1 2 3 4 5 6
5 6 4 2 3 1
6 4 5 3 1 2
2 3 1 5 6 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 4, n = 6, t = 6"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 3 DESIGN 5"
fletcher5 <- t


con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6
5 6 4 2 3 1  3 1 2 6 4 5
6 4 5 3 1 2  5 6 4 2 3 1
2 3 1 5 6 4  6 4 5 3 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 4, n = 12, t = 6"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 3 DESIGN 6"
fletcher6 <- t

con <- textConnection("
1 2 3 4 5 6
3 1 2 6 4 5
4 5 6 1 2 3
5 6 4 2 3 1
2 3 1 5 6 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 6, t = 6"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 3 DESIGN 7"
fletcher7 <- t

con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6
3 1 2 6 4 5  2 3 1 5 6 4
4 5 6 1 2 3  4 5 6 1 2 3
5 6 4 2 3 1  6 4 5 3 1 2
2 3 1 5 6 4  3 1 2 6 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 12, t = 6"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 3 DESIGN 8"
fletcher8 <- t




con <- textConnection("
1 2 3 4 5 6
2 3 1 5 6 4
6 4 5 3 1 2
3 1 2 6 4 5
5 6 4 2 3 1
4 5 6 1 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 6, t = 6"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 3 DESIGN 9"
fletcher9 <- t




con <- textConnection("
1 2 3 4 5 6  1 2 3 4 5 6
2 3 1 5 6 4  2 3 1 5 6 4
6 4 5 3 1 2  5 6 4 2 3 1
3 1 2 6 4 5  4 5 6 1 2 3
5 6 4 2 3 1  6 4 5 3 1 2
4 5 6 1 2 3  3 1 2 6 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 12, t = 6"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 3 DESIGN 10"
fletcher10 <- t




con <- textConnection("
1 2 3 4 5 6 7 8
2 3 4 1 6 7 8 5
8 5 6 7 4 1 2 3
7 8 5 6 3 4 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 4, n = 8, t = 8"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 4 DESIGN 11"
fletcher11 <- t





con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
2 3 4 1 6 7 8 5  6 7 8 5 2 3 4 1
8 5 6 7 4 1 2 3  8 5 6 7 4 1 2 3
7 8 5 6 3 4 1 2  3 4 1 2 7 8 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 4, n = 16, t = 8"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 4 DESIGN 12"
fletcher12 <- t





con <- textConnection("
1 2 3 4 5 6 7 8
2 3 4 1 6 7 8 5
8 5 6 7 4 1 2 3
7 8 5 6 3 4 1 2
3 4 1 2 7 8 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 8, t = 8"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 4 DESIGN 13"
fletcher13 <- t




con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
2 3 4 1 6 7 8 5  4 1 2 3 8 5 6 7
8 5 6 7 4 1 2 3  6 7 8 5 2 3 4 1
7 8 5 6 3 4 1 2  7 8 5 6 3 4 1 2
3 4 1 2 7 8 5 6  3 4 1 2 7 8 5 6")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 16, t = 8"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 4 DESIGN 14"
fletcher14 <- t




con <- textConnection("
1 2 3 4 5 6 7 8
3 4 1 2 7 8 5 6
8 5 6 7 4 1 2 3
7 8 5 6 3 4 1 2
2 3 4 1 6 7 8 5
6 7 8 5 2 3 4 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 8, t = 8"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 4 DESIGN 15"
fletcher15 <- t






con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
3 4 1 2 7 8 5 6  3 4 1 2 7 8 5 6
8 5 6 7 4 1 2 3  7 8 5 6 3 4 1 2
7 8 5 6 3 4 1 2  4 1 2 3 8 5 6 7
2 3 4 1 6 7 8 5  6 7 8 5 2 3 4 1
6 7 8 5 2 3 4 1  5 6 7 8 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 16, t = 8"
attr(t, "title") <- "FLETCHER FACTORIAL 2 x 4 DESIGN 16"
fletcher16 <- t





con <- textConnection("
1 2 3 4 5 6 7 8 9
6 4 5 9 7 8 3 1 2
8 9 7 2 3 1 5 6 4
5 6 4 8 9 7 2 3 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 4, n = 9, t = 9"
attr(t, "title") <- "FLETCHER FACTORIAL 3 x 3 DESIGN 17"
fletcher17 <- t







con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
6 4 5 9 7 8 3 1 2  8 9 7 2 3 1 5 6 4
8 9 7 2 3 1 5 6 4  6 4 5 9 7 8 3 1 2
5 6 4 8 9 7 2 3 1  9 7 8 3 1 2 6 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 4, n = 18, t = 9"
attr(t, "title") <- "FLETCHER FACTORIAL 3 x 3 DESIGN 18"
fletcher18 <- t






con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8  9 1 2 3 4 5 6 7 8 9
6 4 5 9 7 8 3 1 2  8 9 7 2 3 1 5 6  4 9 7 8 3 1 2 6 4 5
8 9 7 2 3 1 5 6 4  6 4 5 9 7 8 3 1  2 5 6 4 8 9 7 2 3 1
5 6 4 8 9 7 2 3 1  9 7 8 3 1 2 6 4  5 6 4 5 9 7 8 3 1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 4, n = 27, t = 9"
attr(t, "title") <- "FLETCHER FACTORIAL 3 x 3 DESIGN 19"
fletcher19 <- t



con <- textConnection("
1 2 3 4 5 6 7 8 9
2 3 1 5 6 4 8 9 7
6 4 5 9 7 8 3 1 2
9 7 8 3 1 2 6 4 5
5 6 4 8 9 7 2 3 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 9, t = 9"
attr(t, "title") <- "FLETCHER FACTORIAL 3 x 3 DESIGN 20"
fletcher20 <- t




con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
2 3 1 5 6 4 8 9 7  9 7 8 3 1 2 6 4 5
6 4 5 9 7 8 3 1 2  6 4 5 9 7 8 3 1 2
9 7 8 3 1 2 6 4 5  5 6 4 8 9 7 2 3 1
5 6 4 8 9 7 2 3 1  8 9 7 2 3 1 5 6 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 18, t = 9"
attr(t, "title") <- "FLETCHER FACTORIAL 3 x 3 DESIGN 21"
fletcher21 <- t





con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
2 3 1 5 6 4 8 9 7  9 7 8 3 1 2 6 4 5  5 6 4 8 9 7 2 3 1
6 4 5 9 7 8 3 1 2  6 4 5 9 7 8 3 1 2  6 4 5 9 7 8 3 1 2
9 7 8 3 1 2 6 4 5  5 6 4 8 9 7 2 3 1  9 7 8 3 1 2 6 4 5
5 6 4 8 9 7 2 3 1  8 9 7 2 3 1 5 6 4  8 9 7 2 3 1 5 6 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 27, t = 9"
attr(t, "title") <- "FLETCHER FACTORIAL 3 x 3 DESIGN 22"
fletcher22 <- t





con <- textConnection("
1 2 3 4 5 6 7 8 9  
2 3 1 5 6 4 8 9 7  
6 4 5 9 7 8 3 1 2  
9 7 8 3 1 2 6 4 5  
8 9 7 2 3 1 5 6 4  
4 5 6 7 8 9 1 2 3  ")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 9, t = 9"
attr(t, "title") <- "FLETCHER FACTORIAL 3 x 3 DESIGN 23"
fletcher23 <- t






con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9  
2 3 1 5 6 4 8 9 7  6 4 5 9 7 8 3 1 2  
6 4 5 9 7 8 3 1 2  9 7 8 3 1 2 6 4 5  
9 7 8 3 1 2 6 4 5  7 8 9 1 2 3 4 5 6 
8 9 7 2 3 1 5 6 4  5 6 4 8 9 7 2 3 1  
4 5 6 7 8 9 1 2 3  2 3 1 5 6 4 8 9 7  ")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 18, t = 9"
attr(t, "title") <- "FLETCHER FACTORIAL 3 x 3 DESIGN 24"
fletcher24 <- t



con <- textConnection("
1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9  1 2 3 4 5 6 7 8 9
2 3 1 5 6 4 8 9 7  6 4 5 9 7 8 3 1 2  2 3 1 5 6 4 8 9 7
6 4 5 9 7 8 3 1 2  9 7 8 3 1 2 6 4 5  8 9 7 2 3 1 5 6 4
9 7 8 3 1 2 6 4 5  7 8 9 1 2 3 4 5 6  4 5 6 7 8 9 1 2 3
8 9 7 2 3 1 5 6 4  5 6 4 8 9 7 2 3 1  6 4 5 9 7 8 3 1 2
4 5 6 7 8 9 1 2 3  2 3 1 5 6 4 8 9 7  9 7 8 3 1 2 6 4 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 27, t = 9"
attr(t, "title") <- "FLETCHER FACTORIAL 3 x 3 DESIGN 25"
fletcher25 <- t


con <- textConnection("
1 2 3 4 5 6 7 8
6 5 8 7 2 1 4 3
4 3 2 1 8 7 6 5
7 8 5 6 3 4 1 2
5 6 7 8 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 8, t = 8"
attr(t, "title") <- "FLETCHER THREE FACTOR 2x2x2 DESIGN 26"
fletcher26 <- t



con <- textConnection("
1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
6 5 7 8 2 1 4 3 2 1 4 3 6 5 8 7
4 3 2 1 8 7 6 5 8 7 6 5 4 3 2 1
7 8 5 6 3 4 1 2 7 8 5 6 3 4 1 2
5 6 7 8 1 2 3 4 5 6 7 8 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 16, t = 8"
attr(t, "title") <- "FLETCHER THREE FACTOR 2x2x2 DESIGN 27"
fletcher27 <- t




con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
6 5 7 8 2 1 4 3  2 1 4 3 6 5 8 7  7 8 5 6 3 4 1 2
4 3 2 1 8 7 6 5  8 7 6 5 4 3 2 1  4 3 2 1 8 7 6 5
7 8 5 6 3 4 1 2  7 8 5 6 3 4 1 2  6 5 8 7 2 1 4 3
5 6 7 8 1 2 3 4  5 6 7 8 1 2 3 4  5 6 7 8 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 5, n = 24, t = 8"
attr(t, "title") <- "FLETCHER THREE FACTOR 2x2x2 DESIGN 28"
fletcher28 <- t







con <- textConnection("
1 2 3 4 5 6 7 8
2 1 4 3 6 5 8 7
7 8 5 6 3 4 1 2
3 4 1 2 7 8 5 6
6 5 8 7 2 1 4 3
8 7 6 5 4 3 2 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 8, t = 8"
attr(t, "title") <- "FLETCHER THREE FACTOR 2x2x2 DESIGN 29"
fletcher29 <- t





con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
2 1 4 3 6 5 8 7  2 1 4 3 6 5 8 7
7 8 5 6 3 4 1 2  8 7 6 5 4 3 2 1
3 4 1 2 7 8 5 6  4 3 2 1 8 7 6 5
6 5 8 7 2 1 4 3  7 8 5 6 3 4 1 2
8 7 6 5 4 3 2 1  5 6 7 8 1 2 3 4")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 16, t = 8"
attr(t, "title") <- "FLETCHER THREE FACTOR 2x2x2 DESIGN 30"
fletcher30 <- t




con <- textConnection("
1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8  1 2 3 4 5 6 7 8
2 1 4 3 6 5 8 7  2 1 4 3 6 5 8 7  3 4 1 2 7 8 5 6
7 8 5 6 3 4 1 2  8 7 6 5 4 3 2 1  6 5 8 7 2 1 4 3
3 4 1 2 7 8 5 6  4 3 2 1 8 7 6 5  5 6 7 8 1 2 3 4
6 5 8 7 2 1 4 3  7 8 5 6 3 4 1 2  8 7 6 5 4 3 2 1
8 7 6 5 4 3 2 1  5 6 7 8 1 2 3 4  4 3 2 1 8 7 6 5")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Fletcher, D.J. (1987) A new class of change-over designs for factorial experiments. Biometrika, 74, 649--654."
attr(t, "signature") <- "p = 6, n = 24, t = 8"
attr(t, "title") <- "FLETCHER THREE FACTOR 2x2x2 DESIGN 30"
fletcher31 <- t







save(fletcher1, fletcher2, fletcher3, fletcher4, fletcher5, fletcher6, fletcher7, fletcher8, fletcher9, fletcher10, fletcher11, fletcher12, fletcher13, fletcher14, fletcher15, fletcher16, fletcher17, fletcher18, fletcher19, fletcher20, fletcher21, fletcher22, fletcher23, fletcher24, fletcher25, fletcher26, fletcher27, fletcher28, fletcher29, fletcher30, fletcher31, file="fletcher.rda")

