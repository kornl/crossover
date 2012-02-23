con <- textConnection("
1 1 1  2 3 4  2 3 4
2 3 4  1 1 1  4 2 3
3 4 2  4 2 3  1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=9, t=3"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 1"
pidgeon1 <- t

con <- textConnection("
1 1 1  1 1 1  2 3 4  2 3 4  2 3 4  2 3 4
2 3 4  2 3 4  1 1 1  1 1 1  4 2 3  4 2 3
3 4 2  3 4 2  4 2 3  4 2 3  1 1 1  1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=18, t=3"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 2"
pidgeon2 <- t

con <- textConnection("
1 1 1  1 1 1  2 3 4  2 3 4  2 3 4  2 3 4  2 3 4
2 3 4  2 3 4  1 1 1  1 1 1  3 4 2  4 2 3  4 2 3
3 4 2  3 4 2  4 2 3  4 2 3  1 1 1  1 1 1  3 4 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=21, t=3"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 3"
pidgeon3 <- t

con <- textConnection("
1 1 1  1 1 1  1 1 1  2 3 4  2 3 4  2 3 4  2 3 4  2 3 4  2 3 4
2 3 4  2 3 4  2 3 4  1 1 1  1 1 1  1 1 1  4 2 3  4 2 3  4 2 3
2 3 4  2 3 4  2 3 4  4 2 3  4 2 3  4 2 3  1 1 1  1 1 1  1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=27, t=3"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 4"
pidgeon4 <- t


con <- textConnection("
1 1 1  1 1 1  1 1 1  2 3 4  2 3 4  2 3 4  2 3 4  2 3 4  2 3 4  2 3 4
2 3 4  2 3 4  2 3 4  1 1 1  1 1 1  1 1 1  3 4 2  4 2 3  4 2 3  4 2 3
2 3 4  2 3 4  2 3 4  4 2 3  4 2 3  4 2 3  1 1 1  1 1 1  1 1 1  3 4 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=30, t=3"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 5"
pidgeon5 <- t


con <- textConnection("
1 1 1 1  2 3 4 5  2 3 4 5  2 3 4 5
3 4 5 2  1 1 1 1  3 4 5 2  3 4 5 2
5 2 3 4  5 2 3 4  1 1 1 1  5 2 3 4
4 5 2 3  4 5 2 3  4 5 2 3  1 1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=4, n=16, t=4"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 6"
pidgeon6 <- t



con <- textConnection("
1 1 1 1  1 1 1 1  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5
3 4 5 2  3 4 5 2  1 1 1 1  1 1 1 1  3 4 5 2  3 4 5 2  3 4 5 2  3 4 5 2
5 2 3 4  5 2 3 4  5 2 3 4  5 2 3 4  1 1 1 1  1 1 1 1  5 2 3 4  5 2 3 4
4 5 2 3  4 5 2 3  4 5 2 3  4 5 2 3  4 5 2 3  4 5 2 3  1 1 1 1  1 1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=4, n=32, t=4"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 7"
pidgeon7 <- t


con <- textConnection("
1 1 1 1  1 1 1 1  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5
3 4 5 2  3 4 5 2  1 1 1 1  1 1 1 1  3 4 5 2  3 4 5 2  3 4 5 2  3 4 5 2  3 4 5 2
5 2 3 4  5 2 3 4  5 2 3 4  5 2 3 4  1 1 1 1  1 1 1 1  5 2 3 4  5 2 3 4  5 2 3 4
4 5 2 3  4 5 2 3  4 5 2 3  4 5 2 3  4 5 2 3  4 5 2 3  1 1 1 1  1 1 1 1  4 5 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=4, n=36, t=4"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 8"
pidgeon8 <- t



con <- textConnection("
1 1 1 1  1 1 1 1  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5 
2 3 4 5  2 3 4 5  1 1 1 1  1 1 1 1  3 4 5 2  4 5 2 3  5 2 3 4
3 4 5 2  4 5 2 3  3 4 5 2  5 2 3 4  1 1 1 1  1 1 1 1  4 5 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=28, t=4"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 9"
pidgeon9 <- t




con <- textConnection("
1 1 1 1 1 1 1 1 1 1  2 2 2  3 3 3  4 4  5 5  4 5 2  4 2 3  5 2 3  3 4 5  3 4 5  2 3 4
2 2 3 3 4 4 4 5 5 5  1 1 1  1 1 1  1 1  1 1  2 2 3  3 4 4  4 5 5  5 2 2  2 3 3  3 4 5
4 5 4 2 5 3 5 2 3 4  3 3 4  2 5 4  2 5  2 3  1 1 1  1 1 1  1 1 1  1 3 4  5 2 4  5 2 3")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=38, t=4"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 10"
pidgeon10 <- t



con <- textConnection("
1 1 1 1  1 1 1 1  1 1 1 1  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5  2 3 4 5
2 3 4 5  2 3 4 5  2 3 4 5  1 1 1 1  1 1 1 1  1 1 1 1  3 4 5 2  4 5 2 3  5 2 3 4
3 4 5 2  4 5 2 3  5 2 3 4  3 4 5 2  4 5 2 3  5 2 3 4  1 1 1 1  1 1 1 1  1 1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=36, t=4"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 11"
pidgeon11 <- t


con <- textConnection("
1 1 1 1 1  2 3 4 5 6  3 4 5 6 2  6 2 3 4 5  4 5 6 2 3
3 4 5 6 2  1 1 1 1 1  2 3 4 5 6  3 4 5 6 2  6 2 3 4 5
6 2 3 4 5  6 2 3 4 5  1 1 1 1 1  2 3 4 5 6  3 4 5 6 2
4 5 6 2 3  4 5 6 2 3  4 5 6 2 3  1 1 1 1 1  2 3 4 5 6
5 6 2 3 4  5 6 2 3 4  5 6 2 3 4  5 6 2 3 4  1 1 1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=5, n=25, t=5"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 12"
pidgeon12 <- t


con <- textConnection("
1 1 1 1 1  1 1 1 1 1  2 3 4 5 6  2 3 4 5 6  3 4 5 6 2  3 4 5 6 2  6 2 3 4 5  6 2 3 4 5  4 5 6 2 3  4 5 6 2 3
3 4 5 6 2  3 4 5 6 2  1 1 1 1 1  1 1 1 1 1  2 3 4 5 6  2 3 4 5 6  3 4 5 6 2  3 4 5 6 2  6 2 3 4 5  6 2 3 4 5
6 2 3 4 5  6 2 3 4 5  6 2 3 4 5  6 2 3 4 5  1 1 1 1 1  1 1 1 1 1  2 3 4 5 6  2 3 4 5 6  3 4 5 6 2  3 4 5 6 2
4 5 6 2 3  4 5 6 2 3  4 5 6 2 3  4 5 6 2 3  4 5 6 2 3  4 5 6 2 3  1 1 1 1 1  1 1 1 1 1  2 3 4 5 6  2 3 4 5 6
5 6 2 3 4  5 6 2 3 4  5 6 2 3 4  5 6 2 3 4  5 6 2 3 4  5 6 2 3 4  5 6 2 3 4  5 6 2 3 4  1 1 1 1 1  1 1 1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=5, n=50, t=5"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 13"
pidgeon13 <- t


con <- textConnection("
1 1 1 1 1  1 1 1 1 1  2 3 4 5 6  2 3 4 5 6  3 4 5 6 2  4 5 6 2 3  5 6 2 3 4  6 2 3 4 5
2 3 4 5 6  2 3 4 5 6  1 1 1 1 1  1 1 1 1 1  6 2 3 4 5  5 6 2 3 4  4 5 6 2 3  3 4 5 6 2
3 4 5 6 2  4 5 6 2 3  5 6 2 3 4  6 2 3 4 5  1 1 1 1 1  1 1 1 1 1  2 3 4 5 6  2 3 4 5 6
6 2 3 4 5  5 6 2 3 4  4 5 6 2 3  3 4 5 6 2  2 3 4 5 6  2 3 4 5 6  1 1 1 1 1  1 1 1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=4, n=40, t=5"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 14"
pidgeon14 <- t


con <- textConnection("
1 1 1 1 1  2 3 4 5 6  2 3 4 5 6  6 2 3 4 5
2 3 4 5 6  1 1 1 1 1  4 5 6 2 3  5 6 2 3 4
3 4 5 6 2  6 2 3 4 5  1 1 1 1 1  3 4 5 6 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=20, t=5"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 15"
pidgeon15 <- t



con <- textConnection("
1 1 1 1 1  1 1 1 1 1  2 3 4 5 6  2 3 4 5 6  2 3 4 5 6  2 3 4 5 6
2 3 4 5 6  2 3 4 5 6  1 1 1 1 1  1 1 1 1 1  5 6 2 3 4  6 2 3 4 5
3 4 5 6 2  4 5 6 2 3  5 6 2 3 4  6 2 3 4 5  1 1 1 1 1  1 1 1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=30, t=5"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 16"
pidgeon16 <- t


con <- textConnection("
1 1 1 1 1  1 1 1 1 1  2 3 4 5 6  2 3 4 5 6  2 3 4 5 6  2 3 4 5 6  6 2 3 4 5  6 2 3 4 5
2 3 4 5 6  2 3 4 5 6  1 1 1 1 1  1 1 1 1 1  4 5 6 2 3  4 5 6 2 3  5 6 2 3 4  5 6 2 3 4
3 4 5 6 2  3 4 5 6 2  6 2 3 4 5  6 2 3 4 5  1 1 1 1 1  1 1 1 1 1  3 4 5 6 2  3 4 5 6 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=40, t=5"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 17"
pidgeon17 <- t

con <- textConnection("
1 1 1 1 1  1 1 1 1 1  1 1 1 1 1  2 3 4 5 6  2 3 4 5 6  2 3 4 5 6  2 3 4 5 6  2 3 4 5 6  2 3 4 5 6  6 2 3 4 5
2 3 4 5 6  2 3 4 5 6  2 3 4 5 6  1 1 1 1 1  1 1 1 1 1  1 1 1 1 1  4 5 6 2 3  5 6 2 3 4  6 2 3 4 5  5 6 2 3 4
3 4 5 6 2  3 4 5 6 2  4 5 6 2 3  6 2 3 4 5  5 6 2 3 4  6 2 3 4 5  1 1 1 1 1  1 1 1 1 1  1 1 1 1 1  3 4 5 6 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=3, n=50, t=5"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 18"
pidgeon18 <- t

con <- textConnection("
1 1 1 1 1 1  2 3 4 5 6 7  2 3 4 5 6 7  2 3 4 5 6 7  2 3 4 5 6 7  2 3 4 5 6 7
3 4 5 6 7 2  1 1 1 1 1 1  3 4 5 6 7 2  3 4 5 6 7 2  3 4 5 6 7 2  3 4 5 6 7 2
7 2 3 4 5 6  7 2 3 4 5 6  1 1 1 1 1 1  7 2 3 4 5 6  7 2 3 4 5 6  7 2 3 4 5 6
4 5 6 7 2 3  4 5 6 7 2 3  4 5 6 7 2 3  1 1 1 1 1 1  4 5 6 7 2 3  4 5 6 7 2 3
6 7 2 3 4 5  6 7 2 3 4 5  6 7 2 3 4 5  6 7 2 3 4 5  1 1 1 1 1 1  6 7 2 3 4 5 
5 6 7 2 3 4  5 6 7 2 3 4  5 6 7 2 3 4  5 6 7 2 3 4  5 6 7 2 3 4  1 1 1 1 1 1")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=6, n=36, t=6"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 19"
pidgeon19 <- t

con <- textConnection("
2 3 6 1  2 3 7 1  2 4 5 1  2 4 7 1  2 5 6 1  3 4 5 1  3 4 6 1  3 5 7 1  4 6 7 1  5 6 7 1  2 3 4 5  6 7 1 2  3 4 5 6  7 1
3 6 1 2  3 7 1 2  4 5 1 2  4 7 1 2  5 6 1 2  4 5 1 3  4 6 1 3  5 7 1 3  6 7 1 4  6 7 1 5  3 4 5 6  7 1 2 1  2 3 4 5  6 7
1 2 3 6  1 2 3 7  1 2 4 5  1 2 4 7  1 2 5 6  1 3 4 5  1 3 4 6  1 3 5 7  1 4 6 7  1 5 6 7  5 6 7 1  2 3 4 6  7 1 2 3  4 5
6 1 2 3  7 1 2 3  5 1 2 4  7 1 2 4  6 1 2 5  5 1 3 4  6 1 3 4  7 1 3 5  7 1 4 6  7 1 5 6  1 2 3 4  5 6 7 3  4 5 6 7  1 2")

t <- as.matrix(read.table(con, header = FALSE))
rownames(t) <- colnames(t) <- NULL
attr(t, "reference") <- "Residual effects designs for comparing treatments with a control. PhD dissertation, Temple University, Phildelphia, PA, 1984."
attr(t, "signature") <- "p=4, n=54, t=6"
attr(t, "title") <- "PIGEON CONTROL-BALANCED DESIGN 20"
pidgeon20 <- t




save(pidgeon1, pidgeon2, pidgeon3, pidgeon4, pidgeon5, pidgeon6, pidgeon7, pidgeon8, pidgeon9, pidgeon10, pidgeon11, pidgeon12, pidgeon13, pidgeon14, pidgeon15, pidgeon16, pidgeon17, pidgeon18, pidgeon19, pidgeon20, file="pidgeon.rda")

